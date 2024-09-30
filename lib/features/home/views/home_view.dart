import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/category_data.dart';
import 'package:news_app/features/home/articles%20manager/cubit.dart';
import 'package:news_app/features/home/widgets/category_item_widget.dart';
import 'package:news_app/features/home/widgets/custom_drawer.dart';
import 'package:news_app/features/home/widgets/selected_category_view.dart';
import 'package:news_app/features/settings/setting_provider.dart';
import 'package:news_app/features/settings/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/colors_palette.dart';
import '../../../data/models/source_model.dart';
import '../articles manager/states.dart';
import '../widgets/article_view_details_widget.dart';


class HomeView extends StatefulWidget {
  final List<Source>sourceList=[];

   HomeView({super.key,});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String query='';
  late ArticleCubit _articleCubit;

  @override
  void initState() {
    // _articleViewModel=ArticleViewModel();
    _articleCubit=ArticleCubit();

    super.initState();
  }
  bool isSearch=false;
  List<CategoryData> categories_en = [
    CategoryData(
      categoryId: 'sports',
      categoryImage: 'assets/icons/sports.png',
      categoryName: 'Sports',
      categoryColor: const Color(0XFFC91C22),
    ),
    CategoryData(
      categoryId: 'general',
      categoryImage: 'assets/icons/Politics.png',
      categoryName: 'Politics',
      categoryColor: const Color(0XFF003E90),
    ),
    CategoryData(
      categoryId: 'health',
      categoryImage: 'assets/icons/health.png',
      categoryName: 'Health',
      categoryColor: const Color(0XFFED1E79),
    ),
    CategoryData(
      categoryId: 'business',
      categoryImage: 'assets/icons/bussines.png',
      categoryName: 'Business',
      categoryColor: const Color(0XFFCF7E48),
    ),
    CategoryData(
      categoryId: 'environment',
      categoryImage: 'assets/icons/environment.png',
      categoryName: 'Environment',
      categoryColor: const Color(0XFF4882CF),
    ),
    CategoryData(
      categoryId: 'science',
      categoryImage: 'assets/icons/science.png',
      categoryName: 'Science',
      categoryColor: const Color(0XFFF2D352),
    ),
  ];
  List<CategoryData> categories_ar = [
    CategoryData(
      categoryId: 'sports',
      categoryImage: 'assets/icons/sports.png',
      categoryName: 'الرياضة',
      categoryColor: const Color(0XFFC91C22),
    ),
    CategoryData(
      categoryId: 'general',
      categoryImage: 'assets/icons/Politics.png',
      categoryName: 'سياسة',
      categoryColor: const Color(0XFF003E90),
    ),
    CategoryData(
      categoryId: 'health',
      categoryImage: 'assets/icons/health.png',
      categoryName: 'صحة',
      categoryColor: const Color(0XFFED1E79),
    ),
    CategoryData(
      categoryId: 'business',
      categoryImage: 'assets/icons/bussines.png',
      categoryName: 'عمل',
      categoryColor: const Color(0XFFCF7E48),
    ),
    CategoryData(
      categoryId: 'environment',
      categoryImage: 'assets/icons/environment.png',
      categoryName: 'بيئة',
      categoryColor: const Color(0XFF4882CF),
    ),
    CategoryData(
      categoryId: 'science',
      categoryImage: 'assets/icons/science.png',
      categoryName: 'علوم',
      categoryColor: const Color(0XFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang=AppLocalizations.of(context)!;
    var provider=Provider.of<SettingsProvider>(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer:isSearch?null: CustomDrawer(
            onCategoriesChangedClicked: onCategoriesChangedClicked,
            onSettingsClicked: onSettingsClicked,
          ),
          appBar: AppBar(
            title: isSearch?FadeInDown(
              child: SizedBox(
                height: 40,
                width: 250,
                child:
                   TextFormField(
                     onChanged: (q){
                       _articleCubit..getNewsArticleList('',q);
                     },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),

                      )
                    ),
                  ),

              ),
            ):Text(
              selectedCategoryData == null
                  ? isSettingsClicked ? lang.settings:lang.news_app
                  : isSettingsClicked?lang.settings :selectedCategoryData!.categoryName,
              style: theme.textTheme.titleLarge,
            ),
            actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: IconButton(
                    icon: isSearch?Icon(Icons.close) : Icon(
                      Icons.search_outlined,
                    ),
                    onPressed: () {
                      changeSearch();
                    },
                    color: Colors.white,
                    iconSize: 35,
                  ),
                )
            ],
          ),
          body:isSearch?
          BlocProvider(create: (context)=>_articleCubit..getNewsArticleList('',query),
            child:BlocConsumer<ArticleCubit,ArticleState>(
                builder: (context,state){
                  var cubit=ArticleCubit.get(context);
                  return Expanded(
                    child:cubit.articleList.isEmpty? const SizedBox():

                    ListView.builder(

                        itemCount: cubit.articleList.length,
                        itemBuilder:(context,index)=>ArticleViewDetailsWidget(articleList: cubit.articleList[index])),
                  ) ;
                }, listener: (context,state){}
          ) ):
          isSettingsClicked? const SettingsView():
          selectedCategoryData == null ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang.pick_your_category_of_interest,
                        style: theme.textTheme.bodyMedium,
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.only(top: 20),
                          itemCount: provider.currentLanguage=='en'?categories_en.length:categories_ar.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.90,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) => CategoryItemWidget(
                            category:provider.currentLanguage=='en'?categories_en[index]:categories_ar[index],
                            index: index,
                            onCategoryClicked: onCategoryClicked,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              :
          SelectedCategoryView(
                  categoryData: selectedCategoryData!,
                )),
    );
  }

  CategoryData? selectedCategoryData;
  void onCategoryClicked(CategoryData categoryData) {
    setState(() {
      selectedCategoryData = categoryData;
    });
  }
  bool isSettingsClicked=false;
  void onCategoriesChangedClicked() {
    setState(() {
      selectedCategoryData = null;
      isSettingsClicked=false;
      Navigator.pop(context);
    });
  }

  void onSettingsClicked(){
    setState(() {
      isSettingsClicked=true;
      Navigator.pop(context);
    });
  }
  void changeSearch(){
    setState(() {
      isSearch=!isSearch;
    });
  }

}
