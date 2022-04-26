// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:first_app/components/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/components/components.dart';
import '../../shared/shared_preference/cacheHelper.dart';
import '../loginModule/loginScreen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.body,
    required this.image,
    required this.title,
  });
}

class OnBoardingScreen extends StatefulWidget {
  static String id = 'OnBoardingScreen';
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  List<BoardingModel> boarding = [
    BoardingModel(
      body:
          'GLOBALLY, CARDIOVASCULAR DISEASES CLAIM NEARLY 17.9 MILLION LIVES EACH YEAR',
      image: 'assets/images/onboard.jpg',
      title: 'Welcome To MediaCare',
    ),
    BoardingModel(
      body:
          'EARLY DETECTION OF HEART DISEASE IS INSTRUMENTAL TO BRINGING THE FATALITY RATE DOWN',
      image: 'assets/images/onboard.jpg',
      title: 'Keep Aware!',
    ),
    BoardingModel(
      body: 'ENJOY OUR SERVICES, WE HOPE YOU GREAT HEALTH',
      image: 'assets/images/onboard.jpg',
      title: 'MediaCare Heart Monitoring Application',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: Text(
              'SKIP',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: ((context, index) =>
                    onBoardingItem(boarding[index])),
                itemCount: boarding.length,
                controller: pageController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                    print('last page');
                  } else {
                    setState(() {
                      isLast = false;
                    });
                    print('not last page');
                  }
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: kStatusColor,
                    expansionFactor: 4,
                    dotColor: kSecondaryColor,
                  ),
                ),
                Spacer(),
                FloatingActionButton.extended(
                  label: Text('Get Started'),
                  onPressed: () {
                    if (isLast) {
                      submit();
                    }

                    pageController.nextPage(
                        duration: Duration(
                          milliseconds: 700,
                        ),
                        curve: Curves.fastOutSlowIn);
                  },
                  icon: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateNoBack(context, LoginScreen());
      }
    });
  }

  Widget onBoardingItem(BoardingModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(
              model.image,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          model.title,
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          model.body,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
