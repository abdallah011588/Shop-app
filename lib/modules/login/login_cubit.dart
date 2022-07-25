
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/login/login_states.dart';
import 'package:shop_app/shared/network/dio_helper.dart';
import 'package:shop_app/shared/network/end_points.dart';

class loginCubit extends Cubit<loginStates>
{
  loginCubit():super(loginInitialState());

  static loginCubit get(context)=>BlocProvider.of(context);

  bool hidePass=true;


  void changePassShow()
  {
    emit(appChangePassShowState());
    hidePass=!hidePass;
  }

  late loginModel model;
  void userLogin({
  required String email,
  required String passWord,
  })
  {
    emit(appLoginLoadingState());
    dioHelper.postData(
        url: LOGIN,
        data: {
             "email":"$email",
             "password":"$passWord",
        },).then((value) {
       // print(value.data);
        model=loginModel.fromJson(value.data);
        print(model.message.toString());
        emit(appLoginSuccessState(model));
        }).catchError((onError){
        print(onError.toString());
        emit(appLoginErrorState(onError.toString()));
    });
  }



}