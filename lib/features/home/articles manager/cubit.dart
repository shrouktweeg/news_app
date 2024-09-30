import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/features/home/articles%20manager/states.dart';
import 'package:news_app/repository/base_repository.dart';


class ArticleCubit extends Cubit<ArticleState>{
  ArticleCubit():super(LoadingArticleState());
  static ArticleCubit get(context)=>BlocProvider.of(context);
  List<Article>_articleList=[];
  List<Article> get articleList=>_articleList;
  late BaseRepository _baseRepositoryArticle;

  Future<void> getNewsArticleList(String? categoryID,String?q,{String page='1'})async{
    try {
      _baseRepositoryArticle=RepositoryDataSource();
      _articleList=await _baseRepositoryArticle.getArticleList(sourcesID: categoryID,q:q,);
     // _articleList = await ApiManager.fetchArticlesList(categoryID);
      emit(SuccessArticleState());
    }catch(error){
      emit(ErrorArticleState());
    }

  }

}