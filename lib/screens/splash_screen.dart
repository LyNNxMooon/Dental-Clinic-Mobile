// ignore_for_file: must_be_immutable

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/screens/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          const Gap(20),
          SizedBox(
              width: 220,
              height: 220,
              child: Lottie.asset("assets/animations/splash.json",
                  fit: BoxFit.fill)),
          const Gap(30),
          const Center(
              child: Text(
            "Dental Clinic",
            style: titleStyle,
          ))
        ],
      ),
      nextScreen: const AuthPage(),
      duration: 5000,
      backgroundColor: kPrimaryColor,
      splashIconSize: 320,
    );
  }
}
