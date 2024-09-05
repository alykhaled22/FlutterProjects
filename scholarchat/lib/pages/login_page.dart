import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholarchat/constant.dart';
import 'package:scholarchat/helper/show_snack_bar.dart';
import 'package:scholarchat/pages/chat_page.dart';
import 'package:scholarchat/pages/cubits/login_cubit/login_cubit.dart';
import 'package:scholarchat/pages/register_page.dart';
import 'package:scholarchat/widgets/custom_button.dart';
import 'package:scholarchat/widgets/email_textfield.dart';
import 'package:scholarchat/widgets/password_textfield.dart';

class LoginPage extends StatelessWidget {
  String? email;
  String? password;
  static String id = "LoginPage";

  GlobalKey<FormState> globalKey = GlobalKey();

  bool isLoading = false;

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          isLoading = false;
          Navigator.pushReplacementNamed(context, ChatPage.id);
        } else if (state is LoginLoding) {
          isLoading = true;
        } else if (state is LoginFailure) {
          isLoading = false;
          showSncakBar(context, state.errMessage);
        }
      },
      builder:(context,state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: globalKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    "assets/images/scholar.png",
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Scolar Chat",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontFamily: "Pacifico",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EmailTextfield(
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PasswordTextfield(
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    hight: 45,
                    width: double.infinity,
                    onTap: () async {
                      final List<ConnectivityResult> connectivityResult =
                          await (Connectivity().checkConnectivity());

                      if (connectivityResult
                          .contains(ConnectivityResult.none)) {
                        if (context.mounted) {
                          showSncakBar(context,
                              "Please check your internet connection.");
                        }
                      } else {
                        if (globalKey.currentState!.validate()) {
                          if (context.mounted) {
                            BlocProvider.of<LoginCubit>(context)
                                .loginUser(email: email!, password: password!);
                          }
                        }
                      }
                    },
                    text: "Login",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: const Text(" Register now",
                            style: TextStyle(
                              color: Color(0xffC7EDE6),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
