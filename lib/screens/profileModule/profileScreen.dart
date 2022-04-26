// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_app/components/widgets/defaultButton.dart';
import 'package:first_app/screens/loginModule/loginScreen.dart';
import 'package:first_app/screens/profileModule/logout_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components/components.dart';
import 'logout_cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LogoutCubit(),
      child: BlocConsumer<LogoutCubit, LogoutStates>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            showToast(text: 'Successfully Logout', state: ToastStates.SUCCESS);
            navigateNoBack(context, LoginScreen());
          }
          if (state is LogoutErrorState) {
            showToast(text: 'Error Logout', state: ToastStates.ERROR);
          }
        },
        builder: (context, state) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 90,
                child: Image(
                  image: AssetImage(
                    'assets/images/onboard.jpg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Spacer(),
            defaultButton(
              onPressed: () {},
              text: 'Update',
            ),
            SizedBox(
              height: height * 0.03,
            ),
            defaultButton(
              onPressed: () {
                LogoutCubit.get(context).userLogout(
                  accessToken: accessToken,
                  refreshToken: refreshToken,
                );
              },
              text: 'Logout',
            ),
            SizedBox(
              height: height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
