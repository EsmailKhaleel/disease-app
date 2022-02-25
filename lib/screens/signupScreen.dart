// ignore_for_file: prefer_const_constructors, unused_field, avoid_print

import 'package:first_app/screens/loginScreen.dart';
import 'package:first_app/services/provider/modelHud.dart';
import 'package:first_app/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/auth.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'SignupScreen';
  final _email = String;
  final _password = String;
  final _auth = auth();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
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
                                image:
                                    AssetImage('images/icons/hearticon.png'))),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          'Heart Disease Application',
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
              ),
              SizedBox(
                height: height * 0.1,
              ),
              CustomTextField(
                controller: userController,
                hint: 'Enter your name',
                icon: Icons.perm_identity,
                //   onClick: (value) {},
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
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
                controller: passwordController,
                // onClick: (value) {
                //   _password = value.toString();
                // },
                hint: 'Enter your Password',
                icon: Icons.lock,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: ElevatedButton(
                  onPressed: () async {
                    final modelhud =
                        Provider.of<ModelHud>(context, listen: false);
                    modelhud.changeflag(true);
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();

                      try {
                        final authResult = await _auth.Signup(
                            emailController.text, passwordController.text);
                        modelhud.changeflag(false);
                        Navigator.pushNamed(context, LoginScreen.id);
                        print(authResult.user!.uid);
                        print('Registeration');
                      } catch (e) {
                        modelhud.changeflag(false);
                        final snackBar = SnackBar(
                            content: Text(e.toString()),
                            duration: new Duration(seconds: 4),
                            action: SnackBarAction(
                                label: 'Undo', onPressed: () {}));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                    modelhud.changeflag(false);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                    ),
                  ),
                ),
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
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
