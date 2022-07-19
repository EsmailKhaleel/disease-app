// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_app/components/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 90,
              child: Image(
                image: AssetImage(
                  'assets/images/onboarding.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
            Text(
              'Medical History',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return MedicalRecordCard(
                    context,
                  );
                },
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

Widget MedicalRecordCard(context) {
  return Card(
      elevation: 0,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 200, 229, 252),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.heartCircleCheck),
              color: Colors.red,
            ),
            Text("Prediction Redorded on",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            Text(
              DateFormat("dd-MMM-yyyy").format(DateTime.now()),
              style: TextStyle(fontSize: 12),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text(
                              'Record on "${DateFormat("dd-MMM-yyyy HH:mm").format(DateTime.now())}"',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Heart Disease",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey)),
                                Text("${true ? "Yes" : "No"}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            true ? Colors.red : Colors.green)),
                                SizedBox(
                                  height: 13,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Age",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey)),
                                        Text("31",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Gender",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey)),
                                        Text("Male",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black))
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Text("Resting Blood Pressure ",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey)),
                                Text("65 mm Hg",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                SizedBox(
                                  height: 13,
                                ),
                                Text("Cholestrol",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey)),
                                Text("240 mm/dl",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                SizedBox(
                                  height: 13,
                                ),
                                Text("Fasting Blood Sugar ",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey)),
                                Text("145 mg/dl",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                SizedBox(
                                  height: 13,
                                ),
                                Text("Old peak",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey)),
                                Text(" 0.0",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                SizedBox(
                                  height: 13,
                                ),
                                Text("Maximum Heart Rating",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey)),
                                Text("86 bpm",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                SizedBox(
                                  height: 13,
                                ),
                                Text("Chest Pain Type",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey)),
                                Text("ASY",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                SizedBox(
                                  height: 13,
                                ),
                                Text("Resting Electro Cardiographic ",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey)),
                                Text("Normal",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                SizedBox(
                                  height: 13,
                                ),
                                Text("Exercise Angine",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey)),
                                Text("Yes",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                SizedBox(
                                  height: 13,
                                ),
                                Text("ST_Slope",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey)),
                                Text("Flat",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                              ],
                            ),
                          ));
                },
                icon: Icon(Icons.more_vert))
          ],
        ),
      ));
}
