// ignore_for_file: prefer_const_constructors

import 'package:first_app/screens/historyModule/historyScreen.dart';
import 'package:first_app/screens/homeModule/homePage.dart';
import 'package:first_app/screens/profileModule/profileScreen.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  List<String> titles = [
    'Home',
    'History',
    'My Profile',
  ];

  List<Widget> screens = [
    HomePageScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];
  int indexed = 0;
  void changeIndex(int index) {
    indexed = index;
    emit(AppChangeNavigationBarState());
  }

  bool isBottomSheetShown = false;

  void changeBottomSheet({required bool isShow}) {
    isBottomSheetShown = isShow;
    emit(AppChangeBottomSheetState());
  }

  late Database database;
  List<Map> reminders = [];

  void createDatabase() {
    openDatabase(
      'Reminder.db',
      version: 1,
      onCreate: (Database database, int version) async {
        print('Database is created');

        await database
            .execute(
                'CREATE TABLE REMINDER (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT)')
            .then((value) {
          print('Tables are created');
        }).catchError((error) {
          print('error on create tables is ${error.toString()}');
        });
      },
      onOpen: (database) {
        print('Database is opened');
      },
    ).then((value) => {
          database = value,
          getDataFromDataBase(database),
          reminders = [],
          emit(AppCreateDataBaseState()),
        });
  }

  void getDataFromDataBase(Database database) {
    reminders = [];
    emit(AppGetDataBaseLoadingState());

    database.rawQuery('SELECT * FROM REMINDER').then((value) => {
          // print(value),
          value.forEach((element) {
            reminders.add(element);
          }),
          emit(AppGetDataBaseState()),
        });
  }

  Future<void> insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    return await database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO REMINDER(title, date, time) VALUES("$title", "$date","$time")')
          .then((value) {
        emit(AppInsertDataBaseState());
        print('$value inserted 1 successfully ');

        getDataFromDataBase(database);
      }).catchError((error) {
        print('error on inserting record is ${error.toString()}');
      });
    });
  }

  void updateData({
    required int id,
  }) async {
    database.rawUpdate('UPDATE REMINDER SET WHERE id = ?', [
      id,
    ]).then((value) => {
          emit(AppUpdateDataBaseState()),
          getDataFromDataBase(database),
        });
  }

  void deleteData({
    required int id,
  }) async {
    database
        .rawDelete('DELETE FROM REMINDER WHERE id = ?', [id]).then((value) => {
              getDataFromDataBase(database),
              emit(AppDeleteDataBaseState()),
            });
  }

  void controlDrawer(ZoomDrawerController drawerController, context) {
    try {
      ZoomDrawer.of(context)?.toggle();
      // drawerController.toggle?.call();
      emit(AppOpenDrawerSuccessState());
    } catch (e) {
      print(e.toString());
      emit(AppOpenDrawerErrorState());
    }
  }


}
