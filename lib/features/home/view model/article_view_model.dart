import 'package:flutter/cupertino.dart';
import 'package:news_app/data/data_source/api_manager.dart';
import 'package:news_app/data/models/article_model.dart';

class ArticleViewModel extends ChangeNotifier{
  List<Article>_articlesList=[];
  List<Article> get articleList=>_articlesList;
  Future<void> getArticlesList(String sourcesID)async{
    _articlesList=await ApiManager.fetchArticlesList(sourcesID);
    notifyListeners();
  }

}