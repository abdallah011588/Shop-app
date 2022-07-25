
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/home_layout/cubit/cubit.dart';
import 'package:shop_app/home_layout/cubit/states.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/modules/description_screen.dart';

class productsScreen extends StatelessWidget
{
  const productsScreen({Key? key}) : super(key: key);

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
          return appCubit.get(context).home_Model !=null && appCubit.get(context).categories_Model !=null?
          productBuilder(appCubit.get(context).home_Model,appCubit.get(context).categories_Model,context)
          : Center(child: CircularProgressIndicator());
        },
       );
  }
}

Widget productBuilder(homeModel model,categoriesModel category,context)
{
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: model.data.banner.map((e) =>
              Image(
                image: NetworkImage(e.image),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
             ).toList(),
            options: CarouselOptions(
              height: 250,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              enlargeCenterPage: false,
              //onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Categories',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 120,
                width: double.infinity,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => categoriesItem(category.data!.data![index]),
                    separatorBuilder: (context, index) =>SizedBox(width: 10,),
                    itemCount: category.data!.data!.length,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'New products',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          color: Colors.grey[200],
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 1/1.72,
            children: List.generate(
                model.data.product.length,
                (index) =>buildGridItem(model.data.product[index], context ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildGridItem(products model,context)
{
  return InkWell(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => descriptionScreen(
              name: model.name,
            images: model.images,
            description: model.description,
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
                image: NetworkImage(model.image),
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
                  model.name,
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
                          appCubit.get(context).changeFavorites(productId: model.id);
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

Widget categoriesItem( Data model)
{
  return  Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image(
        image: NetworkImage(model.image!),
        height: 120,
        width: 120,
        fit: BoxFit.cover,
      ),
      Container(
        width:120,
        color: Colors.black.withOpacity(0.7),
        child: Text(
          '${model.name}',
           style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}