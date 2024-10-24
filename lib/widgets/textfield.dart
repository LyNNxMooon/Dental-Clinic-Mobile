import 'package:flutter/material.dart';
import 'package:dental_clinic_mobile/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.label,
      this.isObsecure,
      this.suffixIcon,
      this.minLines,
      this.maxLines,
      this.keyboardType,
      required this.controller});

  final String hintText;
  final String label;
  final bool? isObsecure;
  final IconButton? suffixIcon;
  final TextEditingController controller;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isObsecure ?? false,
        controller: controller,
        minLines: minLines,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelText: label,
          labelStyle: const TextStyle(color: kFourthColor),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: kFourthColor),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: kFourthColor),
              borderRadius: BorderRadius.circular(10)),
        ));
  }
}
