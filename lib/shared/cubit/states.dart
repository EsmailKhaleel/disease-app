abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeNavigationBarState extends AppStates {}

class AppChangeBottomSheetState extends AppStates {}

class AppCreateDataBaseState extends AppStates {}

class AppInsertDataBaseState extends AppStates {}

class AppGetDataBaseState extends AppStates {}

class AppGetDataBaseLoadingState extends AppStates {}

class AppUpdateDataBaseState extends AppStates {}

class AppDeleteDataBaseState extends AppStates {}


class AppOpenDrawerSuccessState extends AppStates {}

class AppOpenDrawerErrorState extends AppStates {}


class LogoutInitialState extends AppStates {}

class LogoutLoadingState extends AppStates {}

class LogoutSuccessState extends AppStates {}

class LogoutErrorState extends AppStates {
  final String error;
  LogoutErrorState( this.error);
}
class AppGetUserDataSuccessState extends AppStates {}

class AppGetUserDataErrorState extends AppStates {}

class AppGetUserDataLoadingState extends AppStates {}

class AppChangeTheme extends AppStates {}

