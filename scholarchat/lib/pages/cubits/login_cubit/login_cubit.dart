import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String? email;
  String? password;
  bool isLoding = false;
  
  Future<void> loginUser() async {
    emit(LoginLoding());

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: "User not found!"));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errMessage: "Wrong password!"));
      } else if (e.code == 'too-many-requests') {
        emit(LoginFailure(
            errMessage: "Too many requests,please try again later"));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: "error!"));
    }
  }
}
