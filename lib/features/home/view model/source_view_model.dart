import 'package:flutter/cupertino.dart';
import 'package:news_app/data/data_source/api_manager.dart';
import 'package:news_app/data/models/source_model.dart';

class SourcesViewModel extends ChangeNotifier{
  List<Source>_sourceList=[];
  List<Source> get sourceList=>_sourceList;

  Future<void>getSourcesList(String categoryID)async{
    _sourceList=await ApiManager.fetchSourcesList(categoryID);
    notifyListeners();
  }



}