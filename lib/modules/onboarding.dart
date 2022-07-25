
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class boardingModel{
  final String image;
  final String title;
  final String body;

  boardingModel({
   required this.image,
    required this.title,
    required this.body,
});

}

class onBoardingScreen extends StatefulWidget
{

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {

  List<boardingModel> boarding=[
    boardingModel(image: 'assets/images/shop6.jpg', title: 'title1', body: 'body1'),
    boardingModel(image: 'assets/images/shop8.jpg', title: 'title2', body: 'body2'),
    boardingModel(image: 'assets/images/shop2.jpg', title: 'title3', body: 'body3'),
  ];

  var boardController=PageController();
  bool IsLast=false;

  void submit()
  {
    cacheHelper.setData(key: 'onBoarding', value: true).then((value) {
      if(value )
        {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => loginScreen(),
            ),
                (route) => false,
          );
        }
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
                submit();
              },
              child: Text('SKIP',),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => itemBuilder(boarding[index]),
                itemCount: 3,
                onPageChanged: (index){
                  if(index==boarding.length-1)
                    {
                      setState(() {
                        IsLast=true;
                      });
                    }
                },
              ),
            ),
            SizedBox(height: 35.0,),
            Row(
              children: [
                SmoothPageIndicator(
                      controller: boardController,  // PageController
                      count:  3,
                      effect:  ExpandingDotsEffect(
                      activeDotColor:Colors.blue,
                      dotColor: Colors.grey[400]!,
                      spacing: 10,
                      dotHeight: 10,
                      expansionFactor: 2,
                      dotWidth: 20,
                    ),
                    onDotClicked: (index){
                      boardController.jumpToPage(index);
                    }
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(IsLast)
                      {
                        submit();
                      }
                   else
                     {
                       boardController.nextPage(
                         duration:Duration(milliseconds: 800) ,
                         curve: Curves.fastLinearToSlowEaseIn,
                       );
                     }
                    },

                  child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget itemBuilder(boardingModel list)=> Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Image(
          image: AssetImage(list.image),
      ),
    ),
    SizedBox(height: 10.0,),
    Text(list.title,
      style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 15.0,),
    Text(list.body,
      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 30.0,),
  ],
);
