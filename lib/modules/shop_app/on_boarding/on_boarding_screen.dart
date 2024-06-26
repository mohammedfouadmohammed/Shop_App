import 'package:first_app/modules/shop_app/login/shop_login_screen.dart';
import 'package:first_app/shared/Network/local/cache_helper.dart';
import 'package:first_app/shared/componets/componets.dart';
import 'package:first_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
});
}

class OnBoardingScreen extends StatefulWidget
{

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/onboarding1.png',
        title: 'On Board 1 Title',
        body: 'On Board 1 Body',
    ),
    BoardingModel(
      image: 'assets/images/onboarding2.png',
      title: 'On Board 2 Title',
      body: 'On Board 2 Body',
    ),
    BoardingModel(
      image: 'assets/images/onboarding3.png',
      title: 'On Board 3 Title',
      body: 'On Board 3 Body',
    ),
  ];

  void submit()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value!)
      {
        navigateAndFinish
          (
            context,
            ShopLoginScreen(),
        );
      }
    });

    navigateAndFinish(
        context,
        ShopLoginScreen(),
    );
  }

  bool islast = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        actions: [
          //defaultButton(
          //     function: ()
          //     {
          //       navigateAndFinish(context, ShopLoginScreen());
          //     },
          //     text: 'SKIP'
          // ),
          TextButton(
              onPressed: ()
              {
                submit();
              },
              child: Text('SKIP'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index){
                  if(index == boarding.length-1)
                  {
                    setState(() {
                      islast = true;
                    });
                    print('last');
                  }else
                  {
                    print('notLast');
                    setState(() {
                      islast = false;
                    });
                  }
                },
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                      activeDotColor:defaultColor,
                    ),
                    count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: ()
                    {
                      if (islast)
                      {
                        submit();
                      }else {
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastEaseInToSlowEaseOut,
                        );
                      }
                    },
                  child: Icon
                    (Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) =>  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
    ],
  );
}
