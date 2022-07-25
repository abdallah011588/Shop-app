
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/home_layout/cubit/cubit.dart';
import 'package:shop_app/home_layout/cubit/states.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/modules/description_screen.dart';

class favoritesScreen extends StatelessWidget
{
  const favoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<appCubit,appStates>(
      listener: (context, state) {},
      builder:(context, state) {
        return state is !appLoadingGetFavoritesState ?
        ListView.separated(
          itemBuilder: (context, index) =>favoriteBuilder(appCubit.get(context).favorites_model.data!.data![index],context),
          separatorBuilder: (context, index) =>Container(
            width: double.infinity,
            height: 2,
            color: Colors.white,
          ),
          itemCount:appCubit.get(context).favorites_model.data!.data!.length,
        )
        :Center(child:CircularProgressIndicator()) ;
      } ,
    );
  }
}


favoriteBuilder(favoritesData model ,context)
{
  return  Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => descriptionScreen(
                name: model.product!.name!,
                images:List.generate(1, (index) =>model.product!.image!),
                description: model.product!.description!,
              ),
            ));
      },
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(5.0) ,
                    image: DecorationImage(
                      image: NetworkImage(model.product!.image!),
                    ),
                  ),
                ),
                /* Image(
                    image: NetworkImage('https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg'),
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    //fit: BoxFit.cover,
                  ),

                  */
                if(model.product!.discount !=0) Container(
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
            SizedBox(width: 20.0,),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${model.product!.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        '${double.parse( model.product!.price.toString()).toInt()}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      if(model.product!.discount !=0) Text(
                        '${double.parse( model.product!.oldPrice.toString()).toInt()}',
                         style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 17,
                        backgroundColor: appCubit.get(context).favorites[model.product!.id]! ? Colors.blue: Colors.grey, /// //////
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.favorite_border,size: 15.0,),
                          onPressed: (){
                             appCubit.get(context).changeFavorites(productId: model.product!.id!);
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
    ),
  );
}

//favoritesScreen