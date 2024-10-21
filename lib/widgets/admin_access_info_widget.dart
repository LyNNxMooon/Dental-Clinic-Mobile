import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

class AdminAccessInfoWidget extends StatelessWidget {
  const AdminAccessInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
      child: const Center(
        child: Text(
          textAlign: TextAlign.center,
          "Admin does not have access to this feature.",
          style: TextStyle(color: kErrorColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
