import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Center(
          child: Text(
            "Contact Us",
            style: titleStyle,
          ),
        )
      ],
    );
  }
}
