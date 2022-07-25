
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/home_layout/cubit/cubit.dart';
import 'package:shop_app/models/home_model.dart';



class descriptionScreen extends StatelessWidget
{

  final String description;
  final String name;
  final List<String> images;


  descriptionScreen({
    required this.description,
    required this.name,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               CarouselSlider(
                    items: images.map((e) => Image(
                        image: NetworkImage(e),
                      //fit: BoxFit.cover,
                      width: double.infinity,
                    )).toList(),
                    options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                     autoPlayCurve: Curves.easeInOutExpo,
                     autoPlayInterval: Duration(seconds: 3),
                     enableInfiniteScroll: true,
                      viewportFraction: 1.0,
                      initialPage: 0,
                     reverse: false,
                     scrollDirection: Axis.horizontal,
                    ),
                ) ,
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text (
                    '${description}',
                     style: TextStyle(
                       color: Colors.grey,
                       fontSize: 22,
                     ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
