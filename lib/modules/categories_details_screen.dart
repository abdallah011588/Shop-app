


import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/home_layout/cubit/cubit.dart';
import 'package:shop_app/home_layout/cubit/states.dart';
import 'package:shop_app/models/categories_details.dart';
import 'package:shop_app/modules/description_screen.dart';

class categoriesDetailsScreen extends StatelessWidget
{
  const categoriesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<appCubit,appStates>(
      listener:(context, state) {
        if(state is appChangeFavoritesSuccessState)
        {
          if(!state.changeFavModel.status!)
          {
            Fluttertoast.showToast(
              msg:'${state.changeFavModel.message}',
              textColor: Colors.white,
              backgroundColor: Colors.red,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 5,
              fontSize: 16.0,
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(),
          body: appCubit.get(context).categories_Details_Model !=null ?
          productBuilder(appCubit.get(context).categories_Details_Model,context)
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget productBuilder(categoriesDetailsModel model,context)
{
  return Padding(
    padding: const EdgeInsets.only(top: 2.0),
    child: SingleChildScrollView(
      child: Container(
        color: Colors.grey[200],
        child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 1/1.72,
          children: List.generate(
                 model.data!.data!.length,
                (index) =>buildGridItem(model.data!.data![index], context ),
          ),
        ),
      ),
    ),
  );
}

Widget buildGridItem(categData model,context)
{
  return InkWell(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => descriptionScreen(
              name: model.name!,
              images: model.images!,
              description: model.description!,
            ),
          ));
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.image!),
                width: double.infinity,
                height: 200,
                //fit: BoxFit.cover,
              ),
              if(model.discount !=0) Container(
                color: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                child: Text(
                  'DISCOUNT',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  model.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      '${double.parse( model.price.toString()).toInt()}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    if(model.discount !=0) Text(
                      '${double.parse( model.oldPrice.toString()).toInt()}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 17,
                      backgroundColor: appCubit.get(context).favorites[model.id]! ? Colors.blue: Colors.grey, /// //////
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.favorite_border,size: 15.0,),
                        onPressed: (){
                          appCubit.get(context).changeFavorites(productId: model.id!);
                          print(model.id);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ) ;
}
