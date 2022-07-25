
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/home_layout/cubit/cubit.dart';
import 'package:shop_app/modules/description_screen.dart';
import 'package:shop_app/modules/search/search_cubit.dart';
import 'package:shop_app/modules/search/search_states.dart';

class searchScreen extends StatelessWidget
{
  var formKey=GlobalKey<FormState>();

  var searchController=TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => searchCubit(),
      child: BlocConsumer<searchCubit,searchStates>(

        listener: (context, state) {},
        builder:(context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value){
                        searchCubit.get(context).getSearch(text: value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search_outlined),
                      ),
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return 'Can not be empty !';
                        }
                      },
                    ),
                    SizedBox(height: 10.0,),
                    if(state is searchLoadingState) LinearProgressIndicator(),
                    SizedBox(height: 20.0,),
                    if(state is searchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>searchBuilder(searchCubit.get(context).search_Model.data!.data![index],context),
                        separatorBuilder: (context, index) =>Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.white,
                        ),
                        itemCount:searchCubit.get(context).search_Model.data!.data!.length,
                        physics: BouncingScrollPhysics(),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        } ,
      ),
    );
  }
}





searchBuilder( model ,context)
{
  return  Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
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
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(5.0) ,
                image: DecorationImage(
                  image: NetworkImage(model.image!),
                ),
              ),
            ),
            SizedBox(width: 20.0,),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${model.name}',
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
                        '${double.parse( model.price.toString()).toInt()}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
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
