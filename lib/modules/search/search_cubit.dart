
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/modules/search/search_states.dart';
import 'package:shop_app/shared/network/dio_helper.dart';
import 'package:shop_app/shared/network/end_points.dart';

class searchCubit extends Cubit<searchStates>
{
  searchCubit():super(searchInitialState());

  static searchCubit get(context)=>BlocProvider.of(context);
  
  late searchModel search_Model;
  void getSearch({required String text})
  {
    emit(searchLoadingState());
    dioHelper.postData(
        url: SEARCH,
        data: {
          "text":"${text}",
        },
        lang: 'en',
        auth: token
    ).then((value) {
      search_Model=searchModel.fromJson(value.data);
      print(search_Model.data!.data![0].name);
      emit(searchSuccessState());
    }).catchError((onError){
      emit(searchErrorState());
      print(onError.toString());
    });
  }

}