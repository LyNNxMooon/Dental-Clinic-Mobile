// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/data/user_vo.dart';
import 'package:dental_clinic_mobile/firebase/firebase.dart';
import 'package:dental_clinic_mobile/persistent/hive_dao.dart';
import 'package:dental_clinic_mobile/utils/enums.dart';
import 'package:dental_clinic_mobile/utils/file_picker_utils.dart';
import 'package:dental_clinic_mobile/widgets/error_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterController extends BaseController {
  final _hiveDAO = HiveDao();

  final Rxn<File> imageFile = Rxn<File>();

  final _filePickerUtil = FilePickerUtil();

  final _authController = Get.put(AuthController());

  final _firebaseService = FirebaseServices();

  showPictureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text(
          "Choose an option",
          style: TextStyle(
              color: kSecondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        children: [
          SimpleDialogOption(
            onPressed: () {
              _filePickerUtil.getImage(true).then(
                    (value) => imageFile.value = value,
                  );
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.camera, size: 30),
                Gap(10),
                Text(
                  "Open Camera",
                )
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              _filePickerUtil.getImage(false).then(
                    (value) => imageFile.value = value,
                  );
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.photo_rounded, size: 30),
                Gap(10),
                Text(
                  "Choose From Gallery",
                )
              ],
            ),
          ),
        ],
      ),
    );

    update();
  }

  Future register(
      String phone,
      String address,
      String allergicMedicine,
      String email,
      String password,
      String confirmPassword,
      String name,
      String age,
      String gender,
      BuildContext context) async {
    if (name.isEmpty &&
        email.isEmpty &&
        password.isEmpty &&
        confirmPassword.isEmpty &&
        age.isEmpty &&
        gender.isEmpty &&
        imageFile.value == null &&
        phone.isEmpty &&
        address.isEmpty) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please fill all your information above!";

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else if (imageFile.value == null) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please upload your photo!";
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else if (name.isEmpty) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please enter your name!";

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else if (email.isEmpty) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please enter your email!";

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else if (age.isEmpty) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please enter your age!";

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else if (phone.isEmpty) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please enter your phone!";

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else if (address.isEmpty) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please enter your address!";

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else if (password.isEmpty) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please enter the password you want to set!";

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else if (password != confirmPassword) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Passwords do not match!";

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else if (gender.isEmpty) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please select your gender!";

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else {
      setLoadingState = LoadingState.loading;
      String fileURL = await _uploadFileToFirebaseStorage();
      return _firebaseService.firebaseSignUp(email, password).then(
        (value) {
          String id = FirebaseAuth.instance.currentUser?.uid ?? '';
          final patientVo = UserVO(
              banReason: "",
              id: id,
              name: name,
              isBanned: false,
              url: fileURL,
              age: int.parse(age),
              gender: gender,
              address: address,
              allergicMedicine:
                  allergicMedicine.isEmpty ? " Non " : allergicMedicine,
              phone: int.parse(phone));

          _firebaseService.savePatient(patientVo).then(
            (value) {
              _authController.getUser();
              imageFile.value = null;
              _hiveDAO.saveUserPassword(password);
              setLoadingState = LoadingState.complete;
            },
          );
        },
      ).catchError((error) {
        setLoadingState = LoadingState.error;
        setErrorMessage = error.message;

        showDialog(
          context: context,
          builder: (context) => CustomErrorWidget(
            errorMessage: getErrorMessage,
            function: () {
              Get.back();
            },
          ),
        );
      });
    }
    update();
  }

  Future _uploadFileToFirebaseStorage() {
    String path = 'image';
    String contentType = 'image/jpg';

    return FirebaseServices.uploadToFirebaseStorage(
        imageFile.value!, path, contentType);
  }
}
