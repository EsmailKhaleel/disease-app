// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_app/components/widgets/defaultButton.dart';
import 'package:first_app/screens/loginModule/loginScreen.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/components/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is LogoutSuccessState) {
        showToast(text: 'Successfully Logout', state: ToastStates.SUCCESS);
        navigateNoBack(context, LoginScreen());
      }
      if (state is LogoutErrorState) {
        showToast(text: 'Error Logout', state: ToastStates.ERROR);
      }
      if (state is AppGetUserDataErrorState) {
        Center(
          child: CircularProgressIndicator(),
        );
      }
    }, builder: (context, state) {
      var cubit = AppCubit.get(context);
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 90,
                child: Image(
                  image: AssetImage(
                    'assets/images/onboarding.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            cubit.dataModel == null
                ? Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Error Loading data')
                    ],
                  )
                : Container(
                    color: cubit.isDark ? Colors.grey[800] : Colors.grey[100],
                    child: ListTile(
                      title: Text('Full name'),
                      subtitle: Text(
                        cubit.dataModel!.firstName +
                            " " +
                            cubit.dataModel!.lastName,
                        // 'Esmail Khaleel',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            cubit.dataModel == null
                ? Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Error Loading data')
                    ],
                  )
                : Container(
                    color: cubit.isDark ? Colors.grey[800] : Colors.grey[100],
                    child: ListTile(
                      title: Text('E-mail'),
                      subtitle: Text(
                        cubit.dataModel!.email,
                        // 'esmail@gmail.com',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            cubit.dataModel == null
                ? Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Error Loading data')
                    ],
                  )
                : Container(
                    color: cubit.isDark ? Colors.grey[800] : Colors.grey[100],
                    child: ListTile(
                      title: Text('Gender'),
                      subtitle: Text(
                        cubit.dataModel!.gender ??= "not configured yet",
                        // 'male',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cubit.changeTheme();
                  },
                  icon: Icon(Icons.dark_mode),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            defaultButton(
              onPressed: () {
                cubit.userLogout(
                  accessToken: accessToken,
                );
              },
              text: 'Log out',
            ),
            SizedBox(
              height: height * 0.03,
            ),
          ],
        ),
      );
    });
  }
}
