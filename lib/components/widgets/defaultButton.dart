// ignore_for_file: prefer_const_constructors

import 'package:first_app/components/constants/constants.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  required void Function() onPressed,
  Color textColor = Colors.white,
  Color backgroundColor = kPrimaryColor,
  required String text,
}) =>
    Container(
      height: 55,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ))),
          child: Text(
            text,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
