import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Center(
          child: Text(
            "Appointments",
            style: titleStyle,
          ),
        )
      ],
    );
  }
}
