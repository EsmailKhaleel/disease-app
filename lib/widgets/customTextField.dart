import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  // final Function(dynamic) onClick;
  final TextEditingController controller;

  String _errormesssage(String str) {
    switch (hint) {
      case 'Enter your name':
        return 'fill your name';
      case 'Enter your E-mail':
        return 'fill your e-mail';
      case 'Enter your Password':
        return 'fill your password';
      default:
        'value is empty !';
    }
    return 'value is empty !';
  }

  CustomTextField({
    // required this.onClick,
    required this.hint,
    required this.icon,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        // onSaved: onClick(key),
        obscureText: hint == 'Enter your Password' ? true : false,
        validator: (value)
            // ignore: body_might_complete_normally_nullable
            {
          if (value!.isEmpty) {
            return _errormesssage(hint);
          }
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
