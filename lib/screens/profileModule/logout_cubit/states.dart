
abstract class LogoutStates {}

class LogoutInitialState extends LogoutStates {}

class LogoutLoadingState extends LogoutStates {}

class LogoutSuccessState extends LogoutStates {}

class LogoutErrorState extends LogoutStates {
  final String error;
  LogoutErrorState( this.error);
}

