import 'package:news_app/data/models/source_model.dart';

sealed class SourceState{
}
class LoadingSourceState extends SourceState{

}
class SuccessSourceState extends SourceState{
List<Source>sourceList;

SuccessSourceState(this.sourceList);
}
class ErrorSourceState extends SourceState{
   final String? errorMessage;
  ErrorSourceState({this.errorMessage});

}