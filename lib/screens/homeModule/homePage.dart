// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:camera/camera.dart';
import 'package:first_app/components/components/components.dart';
import 'package:first_app/components/constants/constants.dart';
import 'package:first_app/components/widgets/defaultButton.dart';
import 'package:first_app/components/widgets/home_widget.dart';
import 'package:first_app/main.dart';
import 'package:first_app/screens/doctors/doctors.dart';
import 'package:first_app/screens/heart_info/heart_info.dart';
import 'package:first_app/screens/heart_rate/heart_rate.dart';
import 'package:first_app/screens/quizModule/option.dart';
import 'package:first_app/screens/quizModule/questions.dart';
import 'package:first_app/shared/notifications/notifications_api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../reminderModule/reminderScreen.dart';

class HomePageScreen extends StatefulWidget {
  static String id = 'HomePageScreen';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationApi.initNotification();
    listenNotification();
  }

  void listenNotification() {
    NotificationApi.onNotification.stream.listen(onClickedNotification);
  }

  void onClickedNotification(String? payload) {
    navigateTo(context, ReminderScreen(payload: payload));
  }

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 90,
                child: Image(
                  image: AssetImage(
                    'assets/images/onboarding.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "Welcome to MediaCare App ",
                style: TextStyle(fontSize: 25, fontFamily: "Pacifico"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeWidget(
                      title: 'Pill Reminder',
                      icon: FontAwesomeIcons.pills,
                      ontap: () {
                        navigateTo(context, ReminderScreen());
                      }),
                  HomeWidget(
                    title: 'Heart Doctors',
                    icon: FontAwesomeIcons.userDoctor,
                    ontap: () {
                      navigateTo(context, DoctorScreen());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeWidget(
                      title: 'Read About Heart Diseases',
                      icon: Icons.library_books_rounded,
                      ontap: () {
                        navigateTo(context, HeartInfoScreen());
                      }),
                  HomeWidget(
                    title: 'Contact Us',
                    icon: Icons.email_rounded,
                    ontap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeWidget(
                    title: "Measure Heart Rate",
                    icon: FontAwesomeIcons.heartPulse,
                    ontap: () {
                      navigateTo(
                          context,
                          HeartRateScreen(
                            cameras: cameras,
                          ));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

//quiz template_________________________________________________________________
  Widget buildPageView() => PageView.builder(
        controller: pageController,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return buildQuestion(question: question);
        },
      );

  Widget buildQuestion({required Question question}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Text(
            question.text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Choose Your Answer From Below',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black45),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: OptionWidget(
              question: question,
              onClickedOption: (Option) {},
            ),
          ),
        ],
      ),
    );
  }
}
