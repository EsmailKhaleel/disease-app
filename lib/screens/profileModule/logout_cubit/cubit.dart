import 'package:first_app/network/remote/endPoints.dart';
import 'package:first_app/screens/profileModule/logout_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../network/remote/dio_helper.dart';
import '../../../shared/shared_preference/cacheHelper.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit() : super(LogoutInitialState());

  static LogoutCubit get(context) => BlocProvider.of(context);

  void userLogout({
    required String? accessToken,
    required String? refreshToken,
  }) {
    emit(LogoutLoadingState());
    DioHelper.postData(
      url: LOGOUT,
      data: {
        'jwtToken': accessToken,
        'refreshToken': refreshToken,
      },
    ).then((value) {
      String? message = value.data.toString();
      print(message);
      CacheHelper.removeData(key: 'token');
      CacheHelper.removeData(key: 'refreshToken');
      emit(LogoutSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LogoutErrorState(error.toString()));
    });
  }
}
