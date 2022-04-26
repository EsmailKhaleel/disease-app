// ignore_for_file: prefer_const_constructors, unused_field, avoid_print, use_key_in_widget_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/components/components/components.dart';
import 'package:first_app/components/constants/constants.dart';
import 'package:first_app/components/widgets/customTextField.dart';
import 'package:first_app/components/widgets/defaultButton.dart';
import 'package:first_app/screens/loginModule/loginScreen.dart';
import 'package:first_app/screens/signupModule/cubit/cubit.dart';
import 'package:first_app/screens/signupModule/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class SignupScreen extends StatefulWidget {
  static String id = 'SignupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  bool flag = true;
  bool confirmflag = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            showToast(
                text: 'Successfully Registered', state: ToastStates.SUCCESS);
            navigateTo(context, LoginScreen());
          }
          if (state is SignUpErrorState) {
            showToast(
                text: 'There is some problem in regisering, Please try again',
                state: ToastStates.ERROR);
          }
        },
        builder: (context, state) => Scaffold(
          body: Form(
            key: _globalKey,
            child: ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image(
                                image:
                                    AssetImage('assets/icons/hearticon.png'))),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          'MediaCare',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Register Now To Check Your Health',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  type: TextInputType.name,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first Name';
                    }
                    return null;
                  },
                  isPassword: false,
                  label: 'First Name',
                  controller: firstNameController,
                  hint: 'Enter your first name',
                  icon: Icons.perm_identity,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  type: TextInputType.name,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last Name';
                    }
                    return null;
                  },
                  isPassword: false,
                  label: 'Last Name',
                  controller: lastNameController,
                  hint: 'Enter your last name',
                  icon: Icons.perm_identity,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  type: TextInputType.emailAddress,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your E-mail';
                    }
                    return null;
                  },
                  isPassword: false,
                  label: 'E-mail',
                  controller: emailController,
                  // onClick: (value) {
                  //   _email = value.toString();
                  // },
                  hint: 'Enter your E-mail',
                  icon: Icons.email,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  suffixPressed: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                  Suffix: flag ? Icons.visibility_off : Icons.visibility,
                  type: TextInputType.visiblePassword,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                  isPassword: flag,
                  label: 'Password',
                  controller: passwordController,
                  hint: 'Enter your Password',
                  icon: Icons.lock,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  suffixPressed: () {
                    setState(() {
                      confirmflag = !confirmflag;
                    });
                  },
                  Suffix: confirmflag ? Icons.visibility_off : Icons.visibility,
                  type: TextInputType.visiblePassword,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your Password';
                    }
                    return null;
                  },
                  isPassword: confirmflag,
                  label: 'Confirm Password',
                  controller: confirmPasswordController,
                  hint: 'Confirm your Password',
                  icon: Icons.lock,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                ConditionalBuilder(
                  condition: state is! SignUpLoadingState,
                  builder: (context) => defaultButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState!.save();
                          SignUpCubit.get(context).register(
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            id: generateRandomInt(),
                          );
                        }
                      },
                      text: 'Register'.toUpperCase()),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have already an account?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, LoginScreen.id);
                        navigateTo(context, LoginScreen());
                      },
                      child: Text(
                        ' Sign In',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int generateRandomInt() {
    var rng = Random();
    return rng.nextInt(10000);
  }
}
