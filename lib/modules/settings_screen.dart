
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/home_layout/cubit/cubit.dart';
import 'package:shop_app/home_layout/cubit/states.dart';

class settingsScreen extends StatelessWidget
{

  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();

  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<appCubit,appStates>(
      listener:(context, state)
      {
        if(state is appSuccessUpdateUserDataState)
        {
          if(state.user_model.status)
          {
              Fluttertoast.showToast(
                msg:'${state.user_model.message.toString()}',
                textColor: Colors.white,
                backgroundColor: Colors.green,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 5,
                fontSize: 16.0,
              );
          }
          else
          {
            Fluttertoast.showToast(
              msg:'${state.user_model.message.toString()}',
              textColor: Colors.white,
              backgroundColor: Colors.red,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 5,
              fontSize: 16.0,
            );
          }
        }
      },
      builder:(context, state)
      {
        nameController.text=appCubit.get(context).user_Model.data!.name;
        emailController.text=appCubit.get(context).user_Model.data!.email;
        phoneController.text=appCubit.get(context).user_Model.data!.phone;

        return appCubit.get(context).user_Model !=null? Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                if(state is appLoadingUpdateUserDataState)
                  LinearProgressIndicator(),
                SizedBox(height: 20.0,),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return 'Name address can not be empty !';
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    prefixIcon: Icon(Icons.person_outlined),

                  ),
                ),
                SizedBox(height: 20.0,),
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
                SizedBox(height: 20.0,),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return 'Phone can not be empty !';
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'PHone',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
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
                        appCubit.get(context).updateUserData(
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                        );
                      }
                    },
                    child: Text(
                      'UPDATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ):Center(child: CircularProgressIndicator());
      },
    );
  }
}
