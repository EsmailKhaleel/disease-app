import 'package:first_app/models/auth_model.dart';
import 'package:first_app/screens/layoutModule/layoutScreen.dart';
import 'package:first_app/screens/loginModule/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/components/components.dart';
import '../../../models/user_model.dart';
import '../../../network/remote/dio_helper.dart';
import '../../../network/remote/endPoints.dart';
import '../../../shared/shared_preference/cacheHelper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  AuthModel? model;

  void userLogin({
    required String email,
    required String password,
    context,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      model = AuthModel.fromJson(value.data);
      accessToken = model!.authToken;
      CacheHelper.saveData(key: 'token', value: accessToken ??= "");
      emit(LoginSuccessState(model!));
      print(accessToken);
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
 

  //__________________________________Login with Firebase_______________________

  // final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: email, password: password).then((value) {
  //       emit(LoginSuccessState());
  //       print(value.user!.email);
  //     }).catchError((error){
  //       emit(LoginErrorState(error.toString()));
  //       print(error.toString());
  //     });

}
