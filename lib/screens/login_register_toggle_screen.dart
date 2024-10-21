import 'package:dental_clinic_mobile/screens/login_screen.dart';
import 'package:dental_clinic_mobile/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool isSwitchPage = true;

  void toggleScreens() {
    setState(() {
      isSwitchPage = !isSwitchPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSwitchPage) {
      return LoginScreen(function: toggleScreens);
    } else {
      return RegisterPage(function: toggleScreens);
    }
  }
}
