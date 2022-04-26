// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:first_app/components/style/theme.dart';
import 'package:first_app/screens/homeModule/homePage.dart';
import 'package:first_app/screens/layoutModule/layoutScreen.dart';
import 'package:first_app/screens/loginModule/loginScreen.dart';
import 'package:first_app/shared/notifications/notifications_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'components/components/components.dart';
import 'network/remote/dio_helper.dart';
import 'screens/onBoardingModule/onBoardingScreen.dart';
import 'shared/blocObserver/blocObserver.dart';
import 'shared/shared_preference/cacheHelper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp().whenComplete(() {
  //   print("Firebase Initialized completely");
  // });
  DioHelper.init();
  await CacheHelper.init();
  accessToken = CacheHelper.getData(key: 'token');
  refreshToken = CacheHelper.getData(key: 'refreshToken');
  print(accessToken);
  print(refreshToken);
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  bool? tokenFlag = CacheHelper.getData(key: 'tokenFlag');
  //
  Widget widget;
  if (onBoarding != null) {
    widget = LoginScreen();
    if (tokenFlag != null && tokenFlag == true) {
      widget = MyDrawer();
    }
  } else {
    widget = OnBoardingScreen();
  }
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        onBoarding: onBoarding,
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? onBoarding;
  final Widget? startWidget;
  MyApp({
    this.onBoarding,
    this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: startWidget,
    );
  }
}
