
import 'package:shop_app/models/login_model.dart';

abstract class loginStates{}


class loginInitialState extends loginStates{}

class appChangePassShowState extends loginStates{}

class appLoginLoadingState extends loginStates{}
class appLoginSuccessState extends loginStates{
  final loginModel model;

  appLoginSuccessState(this.model);
}
class appLoginErrorState extends loginStates{
  final String error;
  appLoginErrorState(this.error);
}












