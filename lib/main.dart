import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/home_layout/cubit/cubit.dart';
import 'package:shop_app/home_layout/cubit/states.dart';
import 'package:shop_app/home_layout/home_page.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/modules/onboarding.dart';
import 'package:shop_app/shared/local/cache_helper.dart';
import 'package:shop_app/shared/network/dio_helper.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/themes.dart';


void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  dioHelper.init();
  await cacheHelper.init();

  bool boarding =cacheHelper.getBoolean(key: 'onBoarding')==null? false : cacheHelper.getBoolean(key: 'onBoarding');
  bool logIn =cacheHelper.getBoolean(key: 'logIn')==null? false : cacheHelper.getBoolean(key: 'logIn');
  token = cacheHelper.getString(key: 'token').toString();/// YOU SHOULD ADD .toString TO CONVERT DYNAMIC TO STRING

  runApp( MyApp(
    onBoarding: boarding,
    loggedIn: logIn,
  ));
}

class MyApp extends StatelessWidget {

  late bool onBoarding;
  late bool loggedIn;
   MyApp({
     required this.onBoarding,
     required this.loggedIn,
   });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appCubit()..getHomeData()..getCategoriesData()..getFavoritesData()..getUserData(),//..getCategoriesDetailsData(id: '46'),
      child: BlocConsumer<appCubit,appStates>(
        listener: (context, state) {},
        builder:(context, state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme,
            home: onBoarding ?( loggedIn? homePage():loginScreen() ): onBoardingScreen(),
          );
        },
      ),
    );
  }
}

