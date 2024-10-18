// ignore_for_file: must_be_immutable

import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/widgets/button_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:dental_clinic_mobile/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _authController = Get.put(AuthController());

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool showPassword = false;

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            Gap(MediaQuery.of(context).size.height * 0.2),
            const Center(
              child: Text(
                "Change Your Password",
                style: titleStyle,
              ),
            ),
            Gap(MediaQuery.of(context).size.height * 0.1),
            CustomTextField(
              controller: _passwordController,
              hintText: "Enter your Password",
              label: "Password",
              minLines: 1,
              maxLines: 1,
              isObsecure: showPassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
                  icon: showPassword
                      ? const Icon(
                          Icons.visibility_outlined,
                          color: kSecondaryColor,
                        )
                      : const Icon(
                          Icons.visibility_off_outlined,
                          color: kSecondaryColor,
                        )),
            ),
            const Gap(20),
            CustomTextField(
              controller: _newPasswordController,
              hintText: "Enter your new Password",
              label: "New Password",
              isObsecure: showPassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
                  icon: showPassword
                      ? const Icon(
                          Icons.visibility_outlined,
                          color: kSecondaryColor,
                        )
                      : const Icon(
                          Icons.visibility_off_outlined,
                          color: kSecondaryColor,
                        )),
            ),
            const Gap(20),
            CustomTextField(
              controller: _confirmPasswordController,
              hintText: "Confirm your Password",
              label: "Confirm Password",
              isObsecure: showPassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
                  icon: showPassword
                      ? const Icon(
                          Icons.visibility_outlined,
                          color: kSecondaryColor,
                        )
                      : const Icon(
                          Icons.visibility_off_outlined,
                          color: kSecondaryColor,
                        )),
            ),
            const Gap(35),
            Obx(
              () => LoadingStateWidget(
                paddingTop: 0,
                loadingState: _authController.getLoadingState,
                loadingSuccessWidget: CustomButton(
                  name: "Update",
                  function: () {
                    _authController.changePassword(
                        _passwordController,
                        _newPasswordController,
                        _confirmPasswordController,
                        context);
                  },
                ),
                loadingInitWidget: CustomButton(
                  name: "Update",
                  function: () {
                    _authController.changePassword(
                        _passwordController,
                        _newPasswordController,
                        _confirmPasswordController,
                        context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
