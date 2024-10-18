import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:flutter/material.dart';

import 'package:dental_clinic_mobile/constants/colors.dart';

class LoadFailWidget extends StatelessWidget {
  const LoadFailWidget({super.key, required this.function});

  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "No Data Available",
          style: titleStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: TextButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(kBtnGrayColor)),
          onPressed: function,
          child: const Text("Try Again",
              style: TextStyle(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ))
      ],
    );
  }
}
