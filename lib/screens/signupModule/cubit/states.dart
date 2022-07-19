import 'package:first_app/models/auth_model.dart';

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  final AuthModel model;

  SignUpSuccessState(this.model);
}

class SignUpErrorState extends SignUpStates {
  final String error;
  SignUpErrorState(this.error);
}
