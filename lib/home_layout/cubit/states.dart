
import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/login_model.dart';

abstract class appStates{}


class initialState extends appStates{}

class appChangeBottomNavState extends appStates{}

class appLoadingHomeDataState extends appStates{}
class appSuccessHomeDataState extends appStates{}
class appErrorHomeDataState extends appStates{}


class appLoadingCategoriesState extends appStates{}
class appSuccessCategoriesState extends appStates{}
class appErrorCategoriesState extends appStates{}

class appChangeFavoritesLoadingState extends appStates{}
class appChangeFavoritesSuccessState extends appStates{
  final changeFavoritesModel changeFavModel;
  appChangeFavoritesSuccessState(this.changeFavModel);
}
class appChangeFavoritesErrorState extends appStates{}



class appLoadingGetFavoritesState extends appStates{}
class appSuccessGetFavoritesState extends appStates{}
class appErrorGetFavoritesState extends appStates{}


class appLoadingGetUserDataState extends appStates{}
class appSuccessGetUserDataState extends appStates{
  final loginModel user_model;
  appSuccessGetUserDataState(this.user_model);
}
class appErrorGetUserDataState extends appStates{}


class appLoadingUpdateUserDataState extends appStates{}
class appSuccessUpdateUserDataState extends appStates{
  final loginModel user_model;
  appSuccessUpdateUserDataState(this.user_model);
}
class appErrorUpdateUserDataState extends appStates{}


class appLoadingCategoriesDetailsState extends appStates{}
class appSuccessCategoriesDetailsState extends appStates{}
class appErrorCategoriesDetailsState extends appStates{}

