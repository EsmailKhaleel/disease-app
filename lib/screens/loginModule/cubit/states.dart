import 'package:first_app/models/auth_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final AuthModel model;

  LoginSuccessState(this.model);
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

