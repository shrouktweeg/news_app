import 'package:news_app/core/config/constants.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/data/models/source_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class BaseRepository{
  Future<List<Source>>getSourceList(String categoryID);
  Future<List<Article>>getArticleList({String? sourcesID,String?q,String page});
}
class RepositoryDataSource extends BaseRepository{
  @override
  Future<List<Source>> getSourceList(String categoryID) async{
    var url=Uri.https(
        Constants.domain,
        "/v2/top-headlines/sources", // end points
        {
          "apiKey":Constants.apiKey,
          "category":categoryID,
        }
    );
    final response=await http.get(url);
    // http =>>>> return response as text.
    if(response.statusCode==200){
      // we got response
      // parsing
      Map<String,dynamic> data= jsonDecode(response.body);
      SourceModel sourceModel=SourceModel.fromJson(data);
      return sourceModel.sources;
    }
    else{
      throw Exception("Failed to get source list ..");
    }

  }

  @override
  Future<List<Article>> getArticleList({String? sourcesID, String? q, String page='1'}) async{
    var url=Uri.https(
      Constants.domain,
      "/v2/top-headlines", // end points
      {
        "apiKey":Constants.apiKey,
        if (sourcesID!=null ) "sources":sourcesID,
        if (q!=null) "q":q,
        "page":page,
        "pageSize":'10',
      }
  );
  final response=await http.get(url);
  // http =>>>> return response as text.
  if(response.statusCode==200){
    // we got response
    // parsing
    Map<String,dynamic> data= jsonDecode(response.body);
    ArticleModel articleModel=ArticleModel.fromJson(data);

    return articleModel.articles;
  }
  else{
    throw Exception("Failed to get source list ..");
  }
  }

  }
