import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/features/home/source%20manager/states.dart';
import 'package:news_app/repository/base_repository.dart';


class SourceCubit extends Cubit<SourceState>{
  SourceCubit():super(LoadingSourceState());
  static SourceCubit get(context)=>BlocProvider.of(context);
  List<Source>_sourceList=[];
  List<Source> get sourceList=>_sourceList;
  late BaseRepository _baseRepositorySource;
  Future<void> getNewsSourceList(String categoryID)async{
    try {
      _baseRepositorySource=RepositoryDataSource();
      _sourceList=await _baseRepositorySource.getSourceList(categoryID);
    //  _sourceList = await ApiManager.fetchSourcesList(categoryID);
      emit(SuccessSourceState(_sourceList));
    }catch(error){
      emit(ErrorSourceState(errorMessage: error.toString()));
    }

  }

}