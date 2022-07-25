
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/home_layout/cubit/states.dart';
import 'package:shop_app/models/categories_details.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/categories_screen.dart';
import 'package:shop_app/modules/favorites_screen.dart';
import 'package:shop_app/modules/products_screen.dart';
import 'package:shop_app/modules/settings_screen.dart';
import 'package:shop_app/shared/local/cache_helper.dart';
import 'package:shop_app/shared/network/dio_helper.dart';
import 'package:shop_app/shared/network/end_points.dart';

class appCubit extends Cubit<appStates>
{
   appCubit():super(initialState());

  static appCubit get(context)=>BlocProvider.of(context);

  List<Widget> screens=[
    productsScreen(),
    categoriesScreen(),
    favoritesScreen(),
    settingsScreen(),
  ];

  int currentIndex=0;
  void changeBottomNav(int index)
  {
    emit(appChangeBottomNavState());
    currentIndex=index;
  }

  late homeModel home_Model;
  Map<int,bool>favorites={};
  void getHomeData()
  {
    emit(appLoadingHomeDataState());
    dioHelper.getData(
      url: HOME,
      auth: token,
      lang: 'en',
    ).then((value)
    {
      home_Model =homeModel.fromJson(value.data);
      home_Model.data.product.forEach((e){
        favorites.addAll({
          e.id : e.inFavorites
        });
      });
      print(favorites.toString());
      print(home_Model.data.banner[0].image);
      emit(appSuccessHomeDataState());
    }).catchError((onError){
      print(onError.toString());
      emit(appErrorHomeDataState());
    });
  }

   late categoriesModel categories_Model;
   void getCategoriesData()
   {
     emit(appLoadingCategoriesState());
     dioHelper.getData(
       url: CATEGORIES,
       lang: 'en',
     ).then((value)
     {
       categories_Model =categoriesModel.fromJson(value.data);
       print(categories_Model.data!.data![0].name);
       emit(appSuccessCategoriesState());
     }).catchError((onError){
       print(onError.toString());
       emit(appErrorCategoriesState());
     });
   }


  late changeFavoritesModel changeFavModel;
  void changeFavorites({
  required int productId,
   })
   {
     favorites[productId]= !favorites[productId]!;
     emit(appChangeFavoritesLoadingState());
     dioHelper.postData(
        url: FAVORITES,
        data: {
       "product_id":productId,
        },
        auth: token,
        lang: 'en',
      ).then((value) {
       changeFavModel=changeFavoritesModel.fromJson(value.data);
       if(!changeFavModel.status!)
       {
         favorites[productId]= !favorites[productId]!;
       }
       else
         {
           getFavoritesData();
         }
       emit(appChangeFavoritesSuccessState(changeFavModel));
     }).catchError((onError){
       favorites[productId]= !favorites[productId]!;
       emit(appChangeFavoritesErrorState());
       print(onError.toString());
    });

   }


   late favoritesModel favorites_model;
   void getFavoritesData()
   {
     emit(appLoadingGetFavoritesState());
     dioHelper.getData(
       url: FAVORITES,
       lang: 'en',
       auth: token,
     ).then((value)
     {
       favorites_model =favoritesModel.fromJson(value.data);
       print(favorites_model.data!.data![0].product!.name);
       emit(appSuccessGetFavoritesState());
     }).catchError((onError){
       print(onError.toString());
       emit(appErrorGetFavoritesState());
     });
   }



   late loginModel user_Model;
   void getUserData()
   {
     emit(appLoadingGetUserDataState());
     dioHelper.getData(
       url: PROFILE,
       auth: token,
     ).then((value) {
       user_Model=loginModel.fromJson(value.data);
       print(user_Model.data!.name);
       emit(appSuccessGetUserDataState(user_Model));
     }).catchError((onError){
       print(onError.toString());
       emit(appErrorGetUserDataState());
     });
   }



   late loginModel model;
   void updateUserData({
     required String name,
     required String phone,
     required String email,
   })
   {
     emit(appLoadingUpdateUserDataState());
     dioHelper.putData(
       url: UPDATE_PROFILE,
       auth: token,
       data: {
         "name":"$name",
         "phone":"$phone",
         "email":"$email",
       },).then((value) {
       model=loginModel.fromJson(value.data);
       getUserData();
       print(model.message.toString());
       emit(appSuccessUpdateUserDataState(model));
     }).catchError((onError){
       print(onError.toString());
       emit(appErrorUpdateUserDataState());
     });
   }


  late categoriesDetailsModel categories_Details_Model;
  void getCategoriesDetailsData({
  required String id,
   })
   {
     emit(appLoadingCategoriesDetailsState());
     dioHelper.getData(
       url: '${CATEGORIES}/$id',
       lang: 'en',
     ).then((value)
     {
       categories_Details_Model =categoriesDetailsModel.fromJson(value.data);
       print(categories_Details_Model.data!.data![0].name);
       print(categories_Details_Model.data!.data.toString());

       emit(appSuccessCategoriesDetailsState());
     }).catchError((onError){
       print(onError.toString());
       emit(appErrorCategoriesDetailsState());
     });
   }

}