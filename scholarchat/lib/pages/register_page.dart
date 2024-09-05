import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholarchat/constant.dart';
import 'package:scholarchat/helper/show_snack_bar.dart';
import 'package:scholarchat/pages/cubits/register_cubit/register_cubit.dart';
import 'package:scholarchat/pages/login_page.dart';
import 'package:scholarchat/widgets/custom_button.dart';
import 'package:scholarchat/widgets/email_textfield.dart';
import 'package:scholarchat/widgets/password_textfield.dart';

class RegisterPage extends StatelessWidget {
  static String id = "RegisterPage";
  final GlobalKey<FormState> globalKey = GlobalKey();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoding) {
          BlocProvider.of<RegisterCubit>(context).isLoding = true;
        } else if (state is RegisterSuccess) {
          BlocProvider.of<RegisterCubit>(context).isLoding = false;
          showSncakBar(context, "Registered Successfully.");
          Navigator.pushReplacementNamed(context, LoginPage.id);
        } else if (state is RegisterFailure) {
          showSncakBar(context, state.errMessage);
          BlocProvider.of<RegisterCubit>(context).isLoding = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: BlocProvider.of<RegisterCubit>(context).isLoding,
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
                          "Register",
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
                        BlocProvider.of<RegisterCubit>(context).email = data;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    PasswordTextfield(
                      onChanged: (data) {
                        BlocProvider.of<RegisterCubit>(context).password = data;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                      width: double.infinity,
                      hight: 45,
                      onTap: () async {
                        final List<ConnectivityResult> connectivityResult =
                            await (Connectivity().checkConnectivity());

                        if (connectivityResult
                            .contains(ConnectivityResult.none)) {
                          if (context.mounted) {
                            showSncakBar(context,
                                "Please check your internet connection.");
                          }
                          return;
                        } else {
                          if (globalKey.currentState!.validate()) {
                            if (context.mounted) {
                              BlocProvider.of<RegisterCubit>(context)
                                  .registerUser();
                            }
                          }
                        }
                      },
                      text: "Register",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? ",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(" Login",
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
        );
      },
    );
  }
}
