// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_app/components/widgets/doctor_widget.dart';
import 'package:first_app/models/local/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heart Doctors"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: doctorData
            .map((e) => doctorWidget(
                  doctorName: e.title,
                  hospitalName: e.hospital,
                  image: e.image,
                  context: context,
                  index: e.id,
                ))
            .toList(),
      ),
    );
  }
}
