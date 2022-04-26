// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/components/constants/constants.dart';
import 'package:first_app/components/widgets/customTextField.dart';
import 'package:first_app/components/widgets/defaultButton.dart';
import 'package:first_app/screens/homeModule/homePage.dart';
import 'package:first_app/screens/layoutModule/layoutScreen.dart';

import 'package:first_app/screens/loginModule/cubit/cubit.dart';
import 'package:first_app/screens/loginModule/cubit/states.dart';
import 'package:first_app/screens/signupModule/signupScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components/components.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(text: state.error.toString(), state: ToastStates.ERROR);
          }
          if (state is LoginSuccessState) {
            showToast(
                text: 'Successfully Signed In', state: ToastStates.SUCCESS);
            navigateNoBack(context, LayoutScreen());
          }
        },
        builder: (context, state) => Scaffold(
          body: Form(
            key: _globalKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: Container(
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
                                  image: AssetImage(
                                      'assets/icons/hearticon.png'))),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            'MediaCare',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Pacifico',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Login Now To Check Your Health',
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
                  hint: 'Enter your E-mail',
                  icon: Icons.email,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  hint: 'Enter Your Password',
                  icon: Icons.lock,
                  controller: passwordController,
                  label: 'Password',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                  },
                  type: TextInputType.visiblePassword,
                  isPassword: flag,
                  Suffix: flag ? Icons.visibility_off : Icons.visibility,
                  suffixPressed: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                ConditionalBuilder(
                  condition: state is! LoginLoadingState,
                  builder: (context) => defaultButton(
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();
                        LoginCubit.get(context).userLogin(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context,
                        );
                      }
                    },
                    text: 'Login'.toUpperCase(),
                  ),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, SignupScreen.id);
                        navigateTo(context, SignupScreen());
                      },
                      child: Text(
                        ' Regitser Now',
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
}
