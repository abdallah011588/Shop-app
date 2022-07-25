import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/home_layout/cubit/cubit.dart';
import 'package:shop_app/home_layout/home_page.dart';
import 'package:shop_app/modules/login/login_cubit.dart';
import 'package:shop_app/modules/login/login_states.dart';
import 'package:shop_app/modules/description_screen.dart';
import 'package:shop_app/modules/register/register_screen.dart';
import 'package:shop_app/shared/local/cache_helper.dart';
import 'package:shop_app/shared/network/end_points.dart';

var emailController=TextEditingController();
var passwordController=TextEditingController();

class loginScreen extends StatelessWidget
{
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => loginCubit(),
      child: BlocConsumer<loginCubit,loginStates>(
        listener: (context, state) {
          if(state is appLoginSuccessState)
            {
              if(state.model.status)
                {
                  cacheHelper.setData(key: 'token', value: state.model.data!.token).then((value)
                  {
                    token=state.model.data!.token;
                    appCubit.get(context).getUserData();
                    appCubit.get(context).getFavoritesData();
                    appCubit.get(context).getCategoriesData();
                    appCubit.get(context).getHomeData();
                    cacheHelper.setData(key: 'logIn', value: true).then((value) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => homePage()),
                        (route) => false,
                      );
                    });

                    Fluttertoast.showToast(
                      msg:'${state.model.message.toString()}',
                      textColor: Colors.white,
                      backgroundColor: Colors.green,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 5,
                      fontSize: 16.0,
                    );
                  });
                 // print('logged in  ${state.model.status}');
                }
              else
                {
                  Fluttertoast.showToast(
                    msg:'${state.model.message.toString()}',
                    textColor: Colors.white,
                    backgroundColor: Colors.red,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 5,
                    fontSize: 16.0,
                  );
                  print('Error in logging in : ${state.model.message.toString()}');
                }
            }
        },
        builder: (context, state) {

         var cubit= loginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView (
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                          style: Theme.of(context).textTheme.headline4!.copyWith(color:Colors.black ),
                        ),
                        SizedBox(height: 30.0,),
                        Text('Login now to get our hot offers',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'Email address can not be empty !';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email address',
                            prefixIcon: Icon(Icons.email_outlined),

                          ),
                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText:cubit.hidePass,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outlined),
                            suffixIcon: IconButton(
                              onPressed: (){
                                cubit.changePassShow();
                              },
                              icon:Icon(cubit.hidePass? Icons.visibility_outlined: Icons.visibility_off_outlined),
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'Password can not be empty !';
                            }
                          },
                        ),
                        SizedBox(height: 30.0,),
                        state is appLoginLoadingState ? Center(child: CircularProgressIndicator())
                          : Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightBlue,
                          ),
                          child: MaterialButton(
                              onPressed: (){
                                if(formKey.currentState!.validate())
                                  {
                                    cubit.userLogin(
                                      email: emailController.text,
                                      passWord: passwordController.text,
                                    );
                                  //  appCubit.get(context).getUserData();
                                  }
                              },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Text(
                              'Don\'t have an account ',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(width: 10,),
                            TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => registerScreen(),));
                                },
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
