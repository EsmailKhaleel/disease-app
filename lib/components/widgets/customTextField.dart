// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, non_constant_identifier_names

import 'package:first_app/components/constants/constants.dart';
import 'package:flutter/material.dart';

Widget CustomTextField({
  // required this.onClick,
  required String hint,
  required IconData icon,
  required TextEditingController controller,
  required String label,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required TextInputType type,
  IconData? Suffix,
  void Function()? suffixPressed,
  void Function()? ontap,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        onTap: ontap,
        keyboardType: type,
        controller: controller,
        // onSaved: onClick(key),
        obscureText: isPassword,
        validator: validate,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: kSecondaryColor,
          ),
          suffixIcon: Suffix != null
              ? IconButton(onPressed: suffixPressed, icon: Icon(Suffix))
              : null,
          prefixIcon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: kSecondaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: kSecondaryColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: kSecondaryColor)),
        ),
      ),
    );
