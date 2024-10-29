import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';

import 'package:dental_clinic_mobile/widgets/button_widget.dart';
import 'package:dental_clinic_mobile/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../widgets/loading_state_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.function});

  final VoidCallback function;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = Get.put(AuthController());
  bool? showPassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            Gap(MediaQuery.of(context).size.height * 0.15),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.27),
              child: SizedBox(
                height: 130,
                child: Image.asset(
                  "assets/images/dental.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Gap(20),
            const Center(
              child: Text(
                "Dental Clinic",
                style: titleStyle,
              ),
            ),
            const Gap(10),
            const Center(
              child: Text(
                "Login to start",
                style: subtitleStyle,
              ),
            ),
            const Gap(40),
            CustomTextField(
              hintText: "Enter your Email",
              label: "Email",
              controller: _emailController,
            ),
            const Gap(20),
            CustomTextField(
              controller: _passwordController,
              hintText: "Enter your Password",
              label: "Password",
              minLines: 1,
              maxLines: 1,
              isObsecure: showPassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    showPassword = !showPassword!;
                    setState(() {});
                  },
                  icon: showPassword!
                      ? const Icon(
                          Icons.visibility_outlined,
                          color: kSecondaryColor,
                        )
                      : const Icon(
                          Icons.visibility_off_outlined,
                          color: kSecondaryColor,
                        )),
            ),
            const Gap(10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    _authController.resetPassword(
                        _emailController.text, context);
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: kSecondaryColor),
                  )),
            ),
            const Gap(25),
            Obx(
              () => LoadingStateWidget(
                  paddingTop: 0,
                  loadingState: _authController.getLoadingState,
                  loadingSuccessWidget: CustomButton(
                    name: "Login",
                    function: () {
                      _authController.login(_emailController.text,
                          _passwordController.text, context);
                    },
                  ),
                  loadingInitWidget: CustomButton(
                    name: "Login",
                    function: () {
                      _authController.login(_emailController.text,
                          _passwordController.text, context);
                    },
                  )),
            ),
            const Gap(60),
            GestureDetector(
              onTap: widget.function,
              child: const Column(
                children: [
                  Icon(
                    Icons.rocket_launch_sharp,
                    color: kSecondaryColor,
                    size: 45,
                  ),
                  Gap(10),
                  Center(
                      child: Text(
                    "Tap to create account",
                    style: TextStyle(fontSize: 12),
                  ))
                ],
              ),
            ),
            const Gap(70),
          ],
        ),
      ),
    ));
  }
}
