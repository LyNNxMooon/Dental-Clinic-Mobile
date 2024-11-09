import 'package:dental_clinic_mobile/screens/login_register_toggle_screen.dart';

import 'package:dental_clinic_mobile/screens/navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

            return const NavigationScreen();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
