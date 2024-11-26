import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/widgets/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _authController = Get.put(AuthController());

class BannedUserInfoWidget extends StatelessWidget {
  const BannedUserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(MediaQuery.of(context).size.height * 0.35),
        const Center(
          child: Text(
            textAlign: TextAlign.center,
            "You have been banned by admin. Please contact to us",
            style: TextStyle(color: kErrorColor, fontWeight: FontWeight.bold),
          ),
        ),
        const Gap(5),
        Obx(
          () => Center(
            child: Text(
              "Reason : ${_authController.currentUser.value?.banReason ?? ""}",
              style: const TextStyle(
                  color: kErrorColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Gap(30),
        CustomButton(
            name: "Logout", function: () => FirebaseAuth.instance.signOut()),
      ],
    );
  }
}
