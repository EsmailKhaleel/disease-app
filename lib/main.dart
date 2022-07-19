// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:camera/camera.dart';
import 'package:first_app/components/style/theme.dart';
import 'package:first_app/screens/layoutModule/layoutScreen.dart';
import 'package:first_app/screens/loginModule/loginScreen.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/components/components.dart';
import 'network/remote/dio_helper.dart';
import 'screens/onBoardingModule/onBoardingScreen.dart';
import 'shared/blocObserver/blocObserver.dart';
import 'shared/shared_preference/cacheHelper.dart';

 List<CameraDescription> cameras=[];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp().whenComplete(() {
  //   print("Firebase Initialized completely");
  // });
try {
    cameras = await availableCameras();

  } on CameraException catch (e) {
   print(e.code+ e.description!);
  }  DioHelper.init();
  await CacheHelper.init();
  accessToken = CacheHelper.getData(key: 'token');
  print(accessToken);
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  bool? tokenFlag = CacheHelper.getData(key: 'tokenFlag');
  //
  Widget widget;
  if (onBoarding != null) {
    widget = LoginScreen();
    if (accessToken != null) {
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
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode:
              AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: darkTheme,
          theme: lightTheme,
          home: startWidget,
        ),
      ),
    );
  }
}
