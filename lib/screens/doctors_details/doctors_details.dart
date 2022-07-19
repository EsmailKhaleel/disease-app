// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_app/components/widgets/defaultButton.dart';
import 'package:first_app/models/local/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DoctorDetailsScreen extends StatelessWidget {
  List<DoctorInformationModel> doctorDetails = doctorData;
  final int index;
  DoctorDetailsScreen({required this.index});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: AssetImage(doctorDetails[index].image),
                  fit: BoxFit.fill,
                  height: height * 0.45,
                  width: double.infinity,
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              doctorDetails[index].title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              doctorDetails[index].info!,
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Experience",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        doctorDetails[index].experience!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 3,
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      Text(
                        "Patients",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${doctorDetails[index].patients!}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 3,
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      Text(
                        "Rate",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${doctorDetails[index].rate!}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            defaultButton(
                onPressed: () async {
                  _launchUrl("tel:${doctorDetails[index].phoneNumber!}");
                },
                text: "Call"),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      launchUrlString(url);
    }
  }
}
