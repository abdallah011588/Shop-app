
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/register/register_states.dart';
import 'package:shop_app/shared/network/dio_helper.dart';
import 'package:shop_app/shared/network/end_points.dart';

class registerCubit extends Cubit<registerStates>
{
  registerCubit():super(registerInitialState());

  static registerCubit get(context)=>BlocProvider.of(context);

  bool hidePass=true;
  void changePassShow()
  {
    emit(appRegisterChangePassShowState());
    hidePass=!hidePass;
  }


  late loginModel model;
  void userLogin({
    required String name,
    required String phone,
    required String email,
    required String passWord,
  })
  {
    emit(appRegisterLoadingState());
    dioHelper.postData(
      url: REGISTER,
      data: {
        "name":"$name",
        "phone":"$phone",
        "email":"$email",
        "password":"$passWord",
      },).then((value) {
      model=loginModel.fromJson(value.data);
      print(model.message.toString());
      emit(appRegisterSuccessState(model));
    }).catchError((onError){
      print(onError.toString());
      emit(appRegisterErrorState(onError.toString()));
    });
  }




}