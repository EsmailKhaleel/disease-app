// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:first_app/screens/quizModule/questions.dart';
import 'package:flutter/material.dart';

class Option {
  final String code;
  final String text;
  final bool isCorrect;

  Option({required this.code, required this.text, required this.isCorrect});
}

class OptionWidget extends StatelessWidget {
  final Question question;
  ValueChanged<Option> onClickedOption;

  OptionWidget({
    required this.onClickedOption,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        buildOption(context, question.options[0]),
        SizedBox(
          height: height * 0.01,
        ),
        buildOption(context, question.options[1]),
        SizedBox(
          height: height * 0.01,
        ),
        buildOption(context, question.options[2]),
        SizedBox(
          height: height * 0.01,
        ),
        buildOption(context, question.options[3]),
      ],
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    return Column(
      children: [
        Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              Text(
                option.code,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Text(
                  option.text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}
