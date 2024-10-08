import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:scholarchat/firebase_options.dart';
import 'package:scholarchat/pages/chat_page.dart';
import 'package:scholarchat/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholarchat/pages/cubits/login_cubit/login_cubit.dart';
import 'package:scholarchat/pages/cubits/register_cubit/register_cubit.dart';
import 'package:scholarchat/pages/home_page.dart';
import 'package:scholarchat/pages/login_page.dart';
import 'package:scholarchat/pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: GetMaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        routes: {
          RegisterPage.id: (context) => RegisterPage(),
          LoginPage.id: (context) => LoginPage(),
          ChatPage.id: (context) => ChatPage(),
          AuthGate.id: (context) => const AuthGate(),
          HomePage.id: (context) => const HomePage()
        },
        debugShowCheckedModeBanner: false,
        initialRoute: AuthGate.id,
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  static String id = 'AuthGate';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getValidation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data == true) {
          return  ChatPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}

Future<bool> getValidation() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  return sharedPreferences.getBool("isLoggedIn") ?? false;
}
