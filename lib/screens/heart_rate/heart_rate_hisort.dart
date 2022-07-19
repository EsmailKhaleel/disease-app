// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeartRateHistory extends StatelessWidget {
  const HeartRateHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Recordings"),
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: height * 0.15,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.green[50]!,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image(
                          width: width,
                          height: height * 0.15,
                          fit: BoxFit.fill,
                          image: AssetImage("assets/doctors/heartPulse.png"),
                        ),
                        Positioned(
                          top: height * 0.01,
                          left: width * 0.01,
                          child: Text(
                            "Your Heart Rate is 85",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Positioned(
                          top: height * 0.05,
                          left: width * 0.01,
                          child: Text(
                            "Recorded on 20/2/2022",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox();
            },
            itemCount: 20),
      ),
    );
  }
}
