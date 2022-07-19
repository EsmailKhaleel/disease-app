import 'package:first_app/models/auth_model.dart';
import 'package:first_app/network/remote/dio_helper.dart';
import 'package:first_app/network/remote/endPoints.dart';
import 'package:first_app/screens/signupModule/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/remote/exceptions_handler.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  AuthModel? model;

  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    required int id,
  }) async {
    // emit(SignUpLoadingState());

    DioHelper.postData(url: REGISTER, data: {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'firstName': firstName,
      'lastName': lastName,
      'id': id,
    }).then((value) {
      model = AuthModel.fromJson(value.data);
      // print(model!.authToken);
      emit(SignUpSuccessState(model!));
    }).catchError((error) {
      print(error.toString());
      emit(SignUpErrorState(error.toString()));
    });
  }
}

  // firebase register
  // final authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email, password: password).then((value) {
  //         emit(SignUpSuccessState());
  //         print(value.user!.email);
  //       }).catchError((error){
  //         emit(SignUpErrorState(error.toString()));
  //         print(error.toString());
  //       });



