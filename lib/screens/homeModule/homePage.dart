// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:first_app/components/components/components.dart';
import 'package:first_app/components/widgets/defaultButton.dart';
import 'package:first_app/screens/quizModule/option.dart';
import 'package:first_app/screens/quizModule/questions.dart';
import 'package:first_app/shared/notifications/notifications_api.dart';
import 'package:flutter/material.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 90,
              child: Image(
                image: AssetImage(
                  'assets/images/onboard.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
            defaultButton(
                onPressed: () {
                  navigateTo(context, ReminderScreen());
                },
                text: 'Pill Reminder'),
            defaultButton(
                onPressed: () {
                  try {
                    NotificationApi.showNotification(
                            title: 'Esmail Khaleel',
                            body:
                                'This is our Awesome Notification Hope you enjoy',
                            payLoad: 'esmail.khaleel')
                        .then((value) => showToast(
                            text: 'Done', state: ToastStates.SUCCESS));
                  } catch (error) {
                    print(error.toString());
                  }
                },
                text: 'Show Notification'),
            defaultButton(
                onPressed: () {
                  NotificationApi.showScheduledNotification(
                          scheduleDate:
                              DateTime.now().add(Duration(seconds: 5)),
                          title: 'EsmailKhaleel',
                          body: 'This is our Awesome Notification',
                          payLoad: 'esmail.khaleel')
                      .then((value) {
                    showToast(
                        text: 'Successfully Scheduled ',
                        state: ToastStates.WARNING);
                  }).catchError((error) {
                    print(error.toString());
                  });
                },
                text: 'Show Scheduled Notification'),
            SizedBox(
              height: 10,
            ),
          ],
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
