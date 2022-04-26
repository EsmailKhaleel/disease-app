// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_app/screens/drawerModule/menuPage.dart';
import 'package:first_app/screens/reminderModule/reminderScreen.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


class LayoutScreen extends StatelessWidget {
  static final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  MenuItem currentItem = MenuItems.help;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              titleSpacing: 0,
              title: Row(
                children: [
                  Text(
                    cubit.titles[cubit.indexed],
                  ),
                  Spacer(),
                  Text('MediaCare'),
                ],
              ),
              leading: MenuWidget(),
            ),
            body: cubit.screens[cubit.indexed],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) => cubit.changeIndex(value),
              currentIndex: cubit.indexed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                  ),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_rounded,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  MenuItem currentItem = MenuItems.payment;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 40,
      mainScreen: getScreen(),
      menuScreen: Builder(builder: (context) {
        return MenuPage(
          cuurentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
            });
            ZoomDrawer.of(context)!.close();
          },
        );
      }),
      // style: DrawerStyle.style2,
      menuBackgroundColor: Color.fromRGBO(7, 36, 81, 1),
      showShadow: true,
      androidCloseOnBackTap: true,
      duration: Duration(
        milliseconds: 200,
      ),
      angle: 0,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      openCurve: Curves.fastOutSlowIn,
      drawerShadowsBackgroundColor: Colors.grey[300]!,
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.notifications:
        return ReminderScreen();
      default:
        return LayoutScreen();
    }
  }
}
