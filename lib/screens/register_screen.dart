import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/register_controller.dart';
import 'package:dental_clinic_mobile/widgets/button_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:dental_clinic_mobile/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

final _registerController = Get.put(RegisterController());
String? _selectedGender;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.function});

  final VoidCallback function;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPassword = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _allergicMedicineController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _allergicMedicineController.dispose();
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
              const Gap(30),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    _registerController.showPictureDialog(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.22),
                    height: 160,
                    decoration: BoxDecoration(
                        border: Border.all(color: kFourthColor, width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(90))),
                    child: _registerController.imageFile.value == null
                        ? const Center(
                            child: Icon(
                              Icons.add,
                              size: 40,
                            ),
                          )
                        : ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(90)),
                            child: Image.file(
                              _registerController.imageFile.value!,
                              fit: BoxFit.cover,
                            )),
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
                  "Register to start",
                  style: subtitleStyle,
                ),
              ),
              const Gap(40),
              CustomTextField(
                hintText: "Enter your Name",
                label: "Name",
                controller: _nameController,
              ),
              const Gap(20),
              CustomTextField(
                hintText: "Enter your Email",
                label: "Email",
                controller: _emailController,
              ),
              const Gap(20),
              CustomTextField(
                hintText: "Enter your Age",
                label: "Age",
                controller: _ageController,
                keyboardType: TextInputType.number,
              ),
              const Gap(20),
              CustomTextField(
                hintText: "Enter your Phone",
                label: "Phone",
                controller: _phoneController,
                keyboardType: TextInputType.number,
              ),
              const Gap(20),
              CustomTextField(
                hintText: "Enter your Address",
                label: "Address",
                controller: _addressController,
                minLines: 2,
                maxLines: 3,
              ),
              const Gap(20),
              CustomTextField(
                hintText: "Enter what are you allergic to",
                label: "Allergic to",
                controller: _allergicMedicineController,
                minLines: 3,
                maxLines: 6,
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Male'),
                      value: 'Male',
                      groupValue: _selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Female'),
                      value: 'Female',
                      groupValue: _selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Gap(40),
              Obx(
                () => LoadingStateWidget(
                    paddingTop: 0,
                    loadingState: _registerController.getLoadingState,
                    loadingSuccessWidget: CustomButton(
                        name: "Register",
                        function: () {
                          _registerController.register(
                              _phoneController.text,
                              _addressController.text,
                              _allergicMedicineController.text,
                              _emailController.text,
                              _passwordController.text,
                              _confirmPasswordController.text,
                              _nameController.text,
                              _ageController.text,
                              _selectedGender ?? "",
                              context);
                        }),
                    loadingInitWidget: CustomButton(
                        name: "Register",
                        function: () {
                          _registerController.register(
                              _phoneController.text,
                              _addressController.text,
                              _allergicMedicineController.text,
                              _emailController.text,
                              _passwordController.text,
                              _confirmPasswordController.text,
                              _nameController.text,
                              _ageController.text,
                              _selectedGender ?? "",
                              context);
                        })),
              ),
              const Gap(50),
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
                      "Already have account? Login",
                      style: TextStyle(fontSize: 12),
                    ))
                  ],
                ),
              ),
              const Gap(60),
            ],
          ),
        ),
      ),
    );
  }
}
