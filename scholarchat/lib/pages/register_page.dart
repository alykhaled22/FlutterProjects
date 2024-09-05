import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholarchat/constant.dart';
import 'package:scholarchat/helper/show_snack_bar.dart';
import 'package:scholarchat/widgets/custom_button.dart';
import 'package:scholarchat/widgets/email_textfield.dart';
import 'package:scholarchat/widgets/password_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static String id = "RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  GlobalKey<FormState> globalKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
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
                  width: double.infinity,
                  hight: 45,
                  onTap: () async {
                    final List<ConnectivityResult> connectivityResult =
                        await (Connectivity().checkConnectivity());

                    if (connectivityResult.contains(ConnectivityResult.none)) {
                      if (context.mounted) {
                        showSncakBar(context,
                            "No internet connection. Please try again.");
                      }
                      return;
                    } else {
                      if (globalKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await registerUser();
                          if (context.mounted) {
                            showSncakBar(context, 'Registered Succsefully.');
                          }
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'email-already-in-use') {
                            if (context.mounted) {
                              showSncakBar(
                                  context, 'This Email already exists.');
                            }
                          } else if (e.code == 'invalid-email') {
                            if (context.mounted) {
                              showSncakBar(context, 'Invalid Email.');
                            }
                          }
                        } catch (e) {
                          if (context.mounted) {
                            showSncakBar(context,
                                "There was an error, Please try again");
                          }
                        }
                        isLoading = false;
                        setState(() {});
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
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
