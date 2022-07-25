import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/home_layout/cubit/cubit.dart';
import 'package:shop_app/home_layout/cubit/states.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/modules/search/search_screen.dart';
import 'package:shop_app/shared/local/cache_helper.dart';
import 'package:shop_app/shared/network/end_points.dart';

class homePage extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,appStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = appCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Shopping'),
            actions: [
              if(cubit.currentIndex==3) IconButton(
                onPressed: (){
                  cacheHelper.setBoolean(key: 'logIn', value: false).then((value) {
                    cacheHelper.removeData(key: 'token').then((value) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => loginScreen()),
                        (route) => false,
                      );
                    });
                   // token='';
                  });
                },
                icon: Icon(Icons.logout),
              ),
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => searchScreen(),));
                  print(cacheHelper.getString(key: 'token').toString());
                  print(cubit.user_Model.data!.phone);
                  // print(appCubit.get(context).favorites_model.data!.data![0].product!.description!);
                },
                icon: Icon(Icons.search_outlined),
              ),
            ],
          ),

          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,),label: 'Products'),
              BottomNavigationBarItem(icon: Icon(Icons.apps,),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border,),label: 'Favorites'),
              BottomNavigationBarItem(icon: Icon(Icons.settings_outlined,),label: 'Settings'),
            ],
            currentIndex:cubit.currentIndex ,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
          ),
        );
      },
    );
  }
}
