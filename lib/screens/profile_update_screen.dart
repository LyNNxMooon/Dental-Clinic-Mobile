import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/images.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/widgets/button_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:dental_clinic_mobile/widgets/profile_image_widget.dart';
import 'package:dental_clinic_mobile/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _authController = Get.put(AuthController());

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  final _nameController = TextEditingController(
      text: _authController.currentUser.value?.name ?? "");
  final _ageController = TextEditingController(
      text: (_authController.currentUser.value?.age ?? 0).toString());
  final _phoneController = TextEditingController(
      text: (_authController.currentUser.value?.phone ?? 0).toString());
  final _addressController = TextEditingController(
      text: _authController.currentUser.value?.address ?? "");
  final _allergicMedicineController = TextEditingController(
      text: _authController.currentUser.value?.allergicMedicine ?? "");

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();

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
            const Center(
              child: Text(
                "Update Your Profile",
                style: titleStyle,
              ),
            ),
            const Gap(50),
            Obx(
              () => GestureDetector(
                onTap: () {
                  _authController.showPictureDialog(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.22),
                  height: 160,
                  decoration: BoxDecoration(
                      border: Border.all(color: kFourthColor, width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(90))),
                  child: _authController.imageFile.value == null
                      ? ProfileImageWidget(
                          img: _authController.currentUser.value?.url ??
                              kPlaceHolderImage)
                      : ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(90)),
                          child: Image.file(
                            _authController.imageFile.value!,
                            fit: BoxFit.cover,
                          )),
                ),
              ),
            ),
            const Gap(30),
            CustomTextField(
                hintText: "Enter name to update",
                label: "Name",
                controller: _nameController),
            const Gap(20),
            CustomTextField(
              hintText: "Enter age to update",
              label: "Age",
              controller: _ageController,
              keyboardType: TextInputType.number,
            ),
            const Gap(20),
            CustomTextField(
              hintText: "Enter phone to update",
              label: "Phone",
              controller: _phoneController,
              keyboardType: TextInputType.number,
            ),
            const Gap(20),
            CustomTextField(
              hintText: "Enter address to update",
              label: "Address",
              controller: _addressController,
              minLines: 2,
              maxLines: 3,
            ),
            const Gap(20),
            CustomTextField(
              hintText: "Enter allergic to update",
              label: "Allergic to",
              controller: _allergicMedicineController,
              minLines: 3,
              maxLines: 6,
            ),
            const Gap(30),
            Obx(
              () => LoadingStateWidget(
                  paddingTop: 0,
                  loadingState: _authController.getLoadingState,
                  loadingSuccessWidget: CustomButton(
                    name: "Update",
                    function: () {
                      _authController.updateProfile(
                          _phoneController.text,
                          _addressController.text,
                          _allergicMedicineController.text,
                          _authController.currentUser.value?.id ?? "",
                          _nameController.text,
                          _ageController.text,
                          _authController.currentUser.value?.gender ?? "",
                          _authController.currentUser.value?.isBanned ?? false,
                          context);
                    },
                  ),
                  loadingInitWidget: CustomButton(
                    name: "Update",
                    function: () {
                      _authController.updateProfile(
                          _phoneController.text,
                          _addressController.text,
                          _allergicMedicineController.text,
                          _authController.currentUser.value?.id ?? "",
                          _nameController.text,
                          _ageController.text,
                          _authController.currentUser.value?.gender ?? "",
                          _authController.currentUser.value?.isBanned ?? false,
                          context);
                    },
                  )),
            ),
            const Gap(30),
          ],
        ),
      ),
    ));
  }
}
