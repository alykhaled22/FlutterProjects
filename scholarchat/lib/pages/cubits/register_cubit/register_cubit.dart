import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  String? email;
  String? password;
  bool isLoding = false;

  Future<void> registerUser() async {
    emit(RegisterLoding());

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'This Email already exists.'));
      } else if (e.code == 'invalid-email') {
        emit(RegisterFailure(errMessage: 'Invalid Email.'));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: "error!"));
    }
  }
}
