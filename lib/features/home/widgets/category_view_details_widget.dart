import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/colors_palette.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/features/home/articles%20manager/cubit.dart';
import 'package:news_app/features/home/articles%20manager/states.dart';
import 'package:news_app/features/home/widgets/tab_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'article_view_details_widget.dart';

class CategoryViewDetailsWidget extends StatefulWidget {
  final List<Source>sourceList;

  const CategoryViewDetailsWidget({super.key,required this.sourceList});

  @override
  State<CategoryViewDetailsWidget> createState() => _CategoryViewDetailsWidgetState();
}

class _CategoryViewDetailsWidgetState extends State<CategoryViewDetailsWidget> {
  int selectedIndex=0;
 // late ArticleViewModel _articleViewModel;
  late ArticleCubit _articleCubit;
  @override
  void initState() {
 // _articleViewModel=ArticleViewModel();
  _articleCubit=ArticleCubit();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var lag=AppLocalizations.of(context)!;
    return Column(
      children: [
        DefaultTabController(length: widget.sourceList.length, child: TabBar(
          onTap: (index){
            setState(() {
              selectedIndex=index;
            });
            _articleCubit.getNewsArticleList(widget.sourceList[selectedIndex].id,'');
         //   _articleViewModel.getArticlesList(widget.sourceList[selectedIndex].id);
          },
            tabAlignment:TabAlignment.start,
            dividerColor: Colors.transparent,
          isScrollable: true,
            indicatorPadding: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(vertical: 10),
            indicator: const BoxDecoration(),
            labelPadding: const EdgeInsets.symmetric(horizontal: 6),
            tabs:
        widget.sourceList.map((source)=>TabItemWidget(source: source,isSelected:selectedIndex==widget.sourceList.indexOf(source) ,)).toList()
        ))
        ,
        BlocProvider(create: (context)=>_articleCubit..getNewsArticleList(widget.sourceList[selectedIndex].id,''),
        child:BlocConsumer<ArticleCubit,ArticleState>(
            builder: (context,state){
              var cubit=ArticleCubit.get(context);
         return Expanded(
            child:cubit.articleList.isEmpty? const Center(child: CircularProgressIndicator(
              color: ColorsPalette.primaryColor,
            ),):ListView.builder(
                itemCount: cubit.articleList.length,
                itemBuilder:(context,index)=>ArticleViewDetailsWidget(articleList: cubit.articleList[index])),
          ) ;
        }, listener: (context,state){}),
        ),
        /*
        ChangeNotifierProvider(create: (context)=>_articleViewModel..getArticlesList(widget.sourceList[selectedIndex].id),
        child:Consumer<ArticleViewModel>(builder: (context,vm,_){
          return Expanded(
            child:vm.articleList.isEmpty? const Center(child: CircularProgressIndicator(
              color: ColorsPalette.primaryColor,
            ),):ListView.builder(
                itemCount: vm.articleList.length,
                itemBuilder:(context,index)=>ArticleViewDetailsWidget(articleList: vm.articleList[index])),
          ) ;
        }) ,)

         */
        /*
        FutureBuilder<List<Article>>(future: ApiManager.fetchArticlesList(
            widget.sourceList[selectedIndex].id),  builder: (context,snapShot){
    if(snapShot.hasError){
    return Center(child: Text(lag.error_Fetching_data));
    }
    if(snapShot.connectionState==ConnectionState.waiting){
    return const Center(
    child: CircularProgressIndicator(
    color: ColorsPalette.primaryColor,
    ),
    );
    }
    List<Article>articlesList=snapShot.data??[];
    return Expanded(
      child:ListView.builder(
        itemCount: articlesList.length,
          itemBuilder:(context,index)=>ArticleViewDetailsWidget(articleList: articlesList[index])),
    );

    }),
*/
      ],
    );
  }
}
