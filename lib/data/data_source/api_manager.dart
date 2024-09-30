import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/data/models/source_model.dart';
class ApiManager{
  static Future<List<Source>> fetchSourcesList(String categoryID)async{
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
  static Future<List<Article>> fetchArticlesList(String sourcesID)async{
    var url=Uri.https(
        Constants.domain,
        "/v2/top-headlines", // end points
        {
          "apiKey":Constants.apiKey,
          "sources":sourcesID,
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
