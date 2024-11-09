import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/images.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/appointment_controller.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/data/user_vo.dart';
import 'package:dental_clinic_mobile/screens/change_password_page.dart';
import 'package:dental_clinic_mobile/screens/profile_update_screen.dart';
import 'package:dental_clinic_mobile/widgets/banned_user_info.dart';
import 'package:dental_clinic_mobile/widgets/button_widget.dart';
import 'package:dental_clinic_mobile/widgets/confirmation_widget.dart';
import 'package:dental_clinic_mobile/widgets/error_widget.dart';
import 'package:dental_clinic_mobile/widgets/load_fail_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:dental_clinic_mobile/widgets/password_permission_widget.dart';
import 'package:dental_clinic_mobile/widgets/profile_image_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _authController = Get.put(AuthController());
  final _appointmentController = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(
          child: Text(
            "Personal Profile",
            style: titleStyle,
          ),
        ),
        Obx(
          () => LoadingStateWidget(
              paddingTop: MediaQuery.of(context).size.height * 0.35,
              loadingState: _authController.getLoadingState,
              loadingSuccessWidget: (_authController
                          .currentUser.value?.isBanned ??
                      false)
                  ? const BannedUserInfoWidget()
                  : profileWidget(context, _authController.currentUser.value),
              loadingInitWidget: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.35),
                child: LoadFailWidget(
                  function: () {
                    _authController.getUser();
                  },
                ),
              )),
        )
      ],
    );
  }

  Widget userCred(BuildContext context, String type, String value) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "$type : ",
              style: const TextStyle(
                  color: kFourthColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          TextSpan(
              text: value,
              style: const TextStyle(fontSize: 16, color: kSecondaryColor)),
        ],
      ),
    );
  }

  Widget profileWidget(BuildContext context, UserVO? user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(50),
        Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: kFourthColor, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(90))),
            child: ProfileImageWidget(img: user?.url ?? kPlaceHolderImage)),
        const Gap(35),
        userCred(context, "Name", user?.name ?? " - "),
        const Gap(15),
        userCred(context, "Age", (user?.age ?? "0").toString()),
        const Gap(15),
        userCred(context, "Email",
            FirebaseAuth.instance.currentUser?.email ?? " - "),
        const Gap(15),
        userCred(context, "Phone", (user?.phone ?? 0).toString()),
        const Gap(35),
        CustomButton(
            name: "Update Profile",
            function: () {
              showDialog(
                context: context,
                builder: (context) => PasswordPermissionWidget(
                    function: () => Get.to(() => const ProfileUpdatePage())),
              );
            }),
        const Gap(15),
        CustomButton(
            name: "Change Password",
            function: () {
              Get.to(() => const ChangePasswordPage());
            }),
        const Gap(15),
        CustomButton(
            name: "Delete Account",
            function: () {
              if (_authController.currentUser.value == null) {
                showDialog(
                  context: context,
                  builder: (context) => CustomErrorWidget(
                    errorMessage: "Admin does not have access to this feature.",
                    function: () => Get.back(),
                  ),
                );
              } else if (_appointmentController.appointmentList.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => CustomErrorWidget(
                    errorMessage:
                        "You are temporarily unable to delete your account since you have upcoming appointments.",
                    function: () => Get.back(),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => PasswordPermissionWidget(
                      function: () => showDialog(
                            context: context,
                            builder: (context) => ConfirmationWidget(
                                message:
                                    "Are you sure to delete your account? Action cannot be undone!",
                                function: () {
                                  _authController.deleteUserAccount(context);
                                }),
                          )),
                );
              }
            }),
        const Gap(15),
        CustomButton(
            name: "Logout", function: () => FirebaseAuth.instance.signOut()),
        const Gap(50),
      ],
    );
  }
}
