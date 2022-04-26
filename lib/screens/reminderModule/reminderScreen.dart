// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/components/components/components.dart';
import 'package:first_app/components/widgets/customTextField.dart';
import 'package:first_app/components/widgets/defaultButton.dart';
import 'package:first_app/components/widgets/reminderItem.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:first_app/shared/notifications/notifications_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReminderScreen extends StatefulWidget {
  final String? payload;

  ReminderScreen({Key? key, this.payload}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var pillController = TextEditingController();

  var timeController = TextEditingController();

  var dateController = TextEditingController();

  String? hour;

  String? minute;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          List<Map> reminders = cubit.reminders;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                'Pill Reminder',
              ),
            ),
            body: ConditionalBuilder(
              condition: cubit.reminders.isNotEmpty,
              builder: (context) => reminderBuilder(reminders: cubit.reminders),
              fallback: (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.grey,
                      size: 100.0,
                    ),
                    Text(
                      'No Reminders Yet, Please Add Some Reminders !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    addReminder(context);
                  }
                } else {
                  try {
                    scaffoldKey.currentState!
                        .showBottomSheet((context) {
                          return SingleChildScrollView(
                            child: Form(
                              key: formKey,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    CustomTextField(
                                      hint: 'Medicine Name',
                                      icon: Icons.medication,
                                      controller: pillController,
                                      label: 'Medicine Name',
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter medicine name';
                                        }
                                      },
                                      type: TextInputType.text,
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    CustomTextField(
                                      ontap: () async {
                                        await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          if (value!.hour == 0 ||
                                              value.hour < 10) {
                                            hour = "0${value.hour}";
                                          } else {
                                            hour = "${value.hour}";
                                          }
                                          if (value.minute == 0 ||
                                              value.minute < 10) {
                                            minute = "0${value.minute}";
                                          } else {
                                            minute = "${value.minute}";
                                          }
                                          timeController.text = "$hour:$minute";
                                        });
                                      },
                                      hint: 'Time',
                                      icon: Icons.watch_later,
                                      controller: timeController,
                                      label: 'Time',
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter time';
                                        }
                                      },
                                      type: TextInputType.datetime,
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    CustomTextField(
                                      ontap: () async {
                                        await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse("2023-01-01"),
                                        ).then((value) {
                                          dateController.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(value!)
                                                  .toString();
                                        });
                                      },
                                      hint: 'Date',
                                      icon: Icons.calendar_month,
                                      controller: dateController,
                                      label: 'Date',
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter date';
                                        }
                                      },
                                      type: TextInputType.datetime,
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    defaultButton(
                                      onPressed: () {
                                        if (cubit.isBottomSheetShown) {
                                          if (formKey.currentState!
                                              .validate()) {
                                            addReminder(context);
                                          }
                                        }
                                      },
                                      text: 'Add Reminder',
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                        .closed
                        .then((value) {
                          cubit.changeBottomSheet(
                            isShow: false,
                          );
                        });
                    cubit.changeBottomSheet(
                      isShow: true,
                    );
                  } catch (error) {
                    print(error.toString());
                  }
                }
              },
              child: Icon(Icons.notification_add_rounded),
            ),
          );
        },
      ),
    );
  }

  addReminder(context) {
    AppCubit.get(context)
        .insertToDatabase(
      title: pillController.text,
      time: timeController.text,
      date: dateController.text,
    )
        .then((value) {
      NotificationApi.showScheduledNotification(
        scheduleDate: DateTime.parse(myDate()),
        title: pillController.text,
        body: "${timeController.text}          ${dateController.text}",
        payLoad: 'esmail.khaleel',
      ).then((value) {
        showToast(text: 'Successfully Scheduled ', state: ToastStates.WARNING);
      }).catchError((error) {
        print(error.toString());
      });
      pillController.clear();
      timeController.clear();
      dateController.clear();
    });
  }

  TimeOfDay convertStringToTimeOfDay(String s) {
    return TimeOfDay.fromDateTime(DateTime.tryParse(s)!);
  }

  String myDate() {
    return "${dateController.text} ${timeController.text}";
  }
}
