
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/home_layout/cubit/cubit.dart';
import 'package:shop_app/home_layout/cubit/states.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/modules/categories_details_screen.dart';

class categoriesScreen extends StatelessWidget
{
  const categoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<appCubit,appStates>(
      listener: (context, state) {},
      builder:(context, state) {
       return ListView.separated(
          itemBuilder: (context, index) => builder(appCubit.get(context).categories_Model.data!.data![index],context),
          separatorBuilder: (context, index) =>Container(
            width: double.infinity,
            height: 2,
            color: Colors.white,
          ),
          itemCount: appCubit.get(context).categories_Model.data!.data!.length,
        );
      } ,
    );
  }
}


Widget builder(Data model,context)=>Padding(
  padding: const EdgeInsets.all(10.0),
  child: InkWell(
    onTap: (){
      appCubit.get(context).getCategoriesDetailsData(id: model.id.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => categoriesDetailsScreen(),));

    },
    child: Row(
      children: [
        Image(
          image: NetworkImage('${model.image}'),
          width: 100,
          height: 100,
        ),
        SizedBox(width: 20,),
        Text(
          '${model.name}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    ),
  ),
);