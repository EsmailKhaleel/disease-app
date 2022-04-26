// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/components/constants/constants.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget reminderCard(model, context) => Padding(
      padding: EdgeInsets.all(5),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          // dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (context) {
                AppCubit.get(context).deleteData(id: model['id']);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Card(
          elevation: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              child: ListTile(
                trailing: Text(
                  '${model['date']}',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
                leading: Icon(
                  Icons.medication,
                  size: 70,
                  color: Colors.blue,
                ),
                title: Text(
                  '${model['title']}',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_alarm),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${model['time']}',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                isThreeLine: true,
              ),
            ),
          ),
        ),
      ),
    );

Widget reminderBuilder({
  required List<Map> reminders,
}) =>
    ConditionalBuilder(
      condition: reminders.isNotEmpty,
      builder: (context) => ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 5),
          itemBuilder: (context, index) =>
              reminderCard(reminders[index], context),
          itemCount: reminders.length),
      fallback: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
