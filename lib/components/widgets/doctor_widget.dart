// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_app/components/components/components.dart';
import 'package:first_app/screens/doctors_details/doctors_details.dart';
import 'package:flutter/material.dart';

Widget doctorWidget({
  required String doctorName,
  required String hospitalName,
  required String image,
  required context,
  required int index,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 150,
        width: double.infinity,
        child: Row(
          children: [
            Image(
              image: AssetImage(
                image,
              ),
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    doctorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    hospitalName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          navigateTo(
                            context,DoctorDetailsScreen(index:index),
                          );
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                        label: Text("Open"),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
