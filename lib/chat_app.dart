import 'package:chating_app/authintication/views/view/login_view.dart';
import 'package:chating_app/authintication/views/view/register_view.dart';
import 'package:chating_app/home/views/home_view.dart';
import 'package:flutter/material.dart';

class MyChatApp extends StatelessWidget {
  const MyChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter chat app',
        theme: ThemeData(scaffoldBackgroundColor: Colors.black12),
        initialRoute: LoginView.id,
        routes: {
          LoginView.id: (BuildContext context) => const LoginView(),
          RegisterView.id: (BuildContext context) => const RegisterView(),
          HomeView.id: (BuildContext context) => const HomeView(),
        },
        home: const LoginView());
  }
}
