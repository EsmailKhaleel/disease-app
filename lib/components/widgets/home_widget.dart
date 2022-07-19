// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HomeWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() ontap;
  HomeWidget({
    required this.title,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width * 0.4,
        height: height * 0.22,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            kPrimaryColor,
            kSecondaryColor,
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(
                icon,
                size: 45,
                color: Colors.white,
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
