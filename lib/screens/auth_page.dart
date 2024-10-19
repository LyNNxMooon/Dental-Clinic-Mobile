import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/screens/login_screen.dart';
import 'package:dental_clinic_mobile/screens/navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //Navigator.pop(context);
            Fluttertoast.showToast(
                msg: "Authentication Success!",
                backgroundColor: kPrimaryColor,
                textColor: kSecondaryColor);
            return const NavigationScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
