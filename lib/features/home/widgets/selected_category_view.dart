import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/colors_palette.dart';
import 'package:news_app/data/models/category_data.dart';
import 'package:news_app/features/home/source%20manager/cubit.dart';
import 'package:news_app/features/home/source%20manager/states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'category_view_details_widget.dart';


class SelectedCategoryView extends StatelessWidget {
  final CategoryData categoryData;
  const SelectedCategoryView({super.key,required this.categoryData});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var lag=AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context)=>SourceCubit()..getNewsSourceList(categoryData.categoryId),
      child: BlocConsumer<SourceCubit,SourceState>(
          builder: (context,state){

            switch(state){
              case LoadingSourceState():
                return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsPalette.primaryColor,
                    ));
              case SuccessSourceState():
                return CategoryViewDetailsWidget(sourceList: state.sourceList);
              case ErrorSourceState():
                return Center(
                  child: Text(state.errorMessage??''),
                );
            }
            var bloc=SourceCubit.get(context);
        return bloc.sourceList.isEmpty?const Center(
                   child: CircularProgressIndicator(
                     color: ColorsPalette.primaryColor,
                  )) : CategoryViewDetailsWidget(sourceList: bloc.sourceList);
      }, listener: (context,state){
      }),
    );


      // ChangeNotifierProvider(
    //   create:(context)=>SourcesViewModel()..getSourcesList(categoryData.categoryId) ,
    //   child: Consumer<SourcesViewModel>(builder: (context,vm,_)
    //   {
    //     if(vm.sourceList.isEmpty) {
    //       return
    //       const Center(
    //       child: CircularProgressIndicator(
    //         color: ColorsPalette.primaryColor,
    //       ),
    //     );
    //     }
    //     return CategoryViewDetailsWidget(sourceList: vm.sourceList);
    //   }),
    //
    // );
      /*FutureBuilder(
        future: ApiManager.fetchSourcesList(categoryData.categoryId),
        builder: (context,snapShot){
          if(snapShot.hasError){
            return Text(lag.error_Fetching_data);
          }
          if(snapShot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsPalette.primaryColor,
              ),
            );
          }
          List<Source>sourceList=snapShot.data??[];
          return sourceList.isEmpty?Center(child: Text(lag.data_Not_Found,style: theme.textTheme.bodyLarge,)):

          CategoryViewDetailsWidget(sourceList:sourceList);
    });

       */
  }
}
