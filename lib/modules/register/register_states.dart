

import 'package:shop_app/models/login_model.dart';

abstract class registerStates{}


class registerInitialState extends registerStates{}

class appRegisterChangePassShowState extends registerStates{}

class appRegisterLoadingState extends registerStates{}
class appRegisterSuccessState extends registerStates{
  final loginModel model;
  appRegisterSuccessState(this.model);
}
class appRegisterErrorState extends registerStates{
  final String error;
  appRegisterErrorState(this.error);
}












