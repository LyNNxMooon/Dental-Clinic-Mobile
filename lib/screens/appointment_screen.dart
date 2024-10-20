import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/widgets/banned_user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _authController = Get.put(AuthController());

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(
          child: Text(
            "Appointments",
            style: titleStyle,
          ),
        ),
        Obx(() => _authController.currentUser.value == null
            ? Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.35),
                child: const Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Admin does not have access to this feature.",
                    style: TextStyle(
                        color: kErrorColor, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : (_authController.currentUser.value?.isBanned ?? false)
                ? const BannedUserInfoWidget()
                : const SizedBox())
      ],
    );
  }
}
