// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/data/user_vo.dart';
import 'package:dental_clinic_mobile/firebase/firebase.dart';
import 'package:dental_clinic_mobile/persistent/hive_dao.dart';
import 'package:dental_clinic_mobile/utils/enums.dart';
import 'package:dental_clinic_mobile/utils/file_picker_utils.dart';
import 'package:dental_clinic_mobile/widgets/error_widget.dart';
import 'package:dental_clinic_mobile/widgets/success_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AuthController extends BaseController {
  final _firebaseService = FirebaseServices();

  Rxn<UserVO> currentUser = Rxn<UserVO>();

  final _hiveDAO = HiveDao();

  final Rxn<File> imageFile = Rxn<File>();

  final _filePickerUtil = FilePickerUtil();

  RxList<String> adminUID = <String>[].obs;

  @override
  void onInit() {
    getUser();
    callAdmin();
    super.onInit();
  }

  callAdmin() async {
    setLoadingState = LoadingState.loading;
    _firebaseService.getAdminUID().listen(
      (event) {
        if (event == null || event.isEmpty) {
          setLoadingState = LoadingState.error;
        } else {
          adminUID.add(event.first.id);
          setLoadingState = LoadingState.complete;
        }
      },
    ).onError((error) {
      setLoadingState = LoadingState.error;
    });

    update();
  }

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

  Future getUser() async {
    String id = FirebaseAuth.instance.currentUser?.uid ?? '';
    print("Trigger");
    setLoadingState = LoadingState.loading;

    _firebaseService.getPatient(id).then(
      (value) {
        currentUser.value = value;

        print(value?.name);
        print(currentUser.value?.name);

        setLoadingState = LoadingState.complete;
      },
    ).catchError((error) {
      setLoadingState = LoadingState.error;
    });

    update();
  }

  Future login(String email, String password, BuildContext context) async {
    setLoadingState = LoadingState.loading;

    if (email.isEmpty && password.isEmpty) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please enter both email and password!";

      showDialog(
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
      setErrorMessage = "Please enter your password!";

      showDialog(
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else {
      _firebaseService.firebaseSignIn(email, password).then(
        (value) {
          getUser();

          _hiveDAO.saveUserPassword(password);
          setLoadingState = LoadingState.complete;
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

  Future changePassword(
      TextEditingController oldPassword,
      TextEditingController newPassword,
      TextEditingController confirmPassword,
      BuildContext context) async {
    setLoadingState = LoadingState.loading;
    if (oldPassword.text.isEmpty ||
        newPassword.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Fill all the fields!";

      showDialog(
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () => Get.back(),
        ),
      );
    } else if (oldPassword.text != _hiveDAO.getUserPassword) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Old password does not match!";

      showDialog(
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () => Get.back(),
        ),
      );
    } else if (newPassword.text != confirmPassword.text) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Passwords do not match!";

      showDialog(
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () => Get.back(),
        ),
      );
    } else {
      _firebaseService
          .firebaseSignIn(
              FirebaseAuth.instance.currentUser?.email ?? "", oldPassword.text)
          .then(
        (value) {
          try {
            FirebaseAuth.instance.currentUser
                ?.updatePassword(newPassword.text)
                .then(
              (value) {
                _hiveDAO.saveUserPassword(newPassword.text);
                oldPassword.clear();
                newPassword.clear();
                confirmPassword.clear();
                setLoadingState = LoadingState.complete;
                showDialog(
                  context: context,
                  builder: (context) => const SuccessWidget(
                      message: "Password Updated Successfully!"),
                );
              },
            );
          } on FirebaseAuthException catch (error) {
            setLoadingState = LoadingState.error;
            setErrorMessage = error.message ?? "Something went wrong!";

            showDialog(
              context: context,
              builder: (context) => CustomErrorWidget(
                errorMessage: getErrorMessage,
                function: () => Get.back(),
              ),
            );
          }
        },
      );
    }

    update();
  }

  Future updateProfile(
      String phone,
      String address,
      String allergicMedicine,
      String id,
      String name,
      String age,
      String gender,
      bool isBanned,
      String url,
      BuildContext context) async {
    if (currentUser.value == null) {
      setLoadingState = LoadingState.error;

      setErrorMessage = "Admin does not have access to this feature.";

      showDialog(
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () => Get.back(),
        ),
      );
    } else {
      if (name.isEmpty) {
        setLoadingState = LoadingState.error;

        setErrorMessage = "PLease enter your name to update!";

        showDialog(
          context: context,
          builder: (context) => CustomErrorWidget(
            errorMessage: getErrorMessage,
            function: () => Get.back(),
          ),
        );
      } else if (age.isEmpty) {
        setLoadingState = LoadingState.error;

        setErrorMessage = "PLease enter your age to update!";

        showDialog(
          context: context,
          builder: (context) => CustomErrorWidget(
            errorMessage: getErrorMessage,
            function: () => Get.back(),
          ),
        );
      } else if (phone.isEmpty) {
        setLoadingState = LoadingState.error;

        setErrorMessage = "PLease enter your phone to update!";

        showDialog(
          context: context,
          builder: (context) => CustomErrorWidget(
            errorMessage: getErrorMessage,
            function: () => Get.back(),
          ),
        );
      } else if (address.isEmpty) {
        setLoadingState = LoadingState.error;

        setErrorMessage = "PLease enter your address to update!";

        showDialog(
          context: context,
          builder: (context) => CustomErrorWidget(
            errorMessage: getErrorMessage,
            function: () => Get.back(),
          ),
        );
      } else {
        setLoadingState = LoadingState.loading;
        String fileURL = imageFile.value == null
            ? url
            : await _uploadFileToFirebaseStorage();
        final patient = UserVO(
            id: id,
            name: name,
            isBanned: isBanned,
            url: fileURL,
            age: int.parse(age),
            gender: gender,
            address: address,
            allergicMedicine:
                allergicMedicine.isEmpty ? "Non" : allergicMedicine,
            phone: int.parse(phone));

        return _firebaseService.savePatient(patient).then(
          (value) {
            setLoadingState = LoadingState.complete;
            imageFile.value = null;
            getUser();
            showDialog(
              context: context,
              builder: (context) =>
                  const SuccessWidget(message: "Profile Updated Successfully!"),
            ).then(
              (value) => Get.back(),
            );
          },
        ).catchError((error) {
          print(error);
          setLoadingState = LoadingState.error;
          setErrorMessage = error;

          showDialog(
            context: context,
            builder: (context) => CustomErrorWidget(
              errorMessage: getErrorMessage,
              function: () => Get.back(),
            ),
          );
        });
      }
    }

    update();
  }

  Future deleteUserAccount(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    setLoadingState = LoadingState.loading;

    _firebaseService.deleteUser(user?.uid ?? "").then(
      (value) {
        user?.delete().then(
          (value) {
            setLoadingState = LoadingState.complete;
            Get.back();
          },
        );
      },
    ).catchError((error) {
      print(error);
      setLoadingState = LoadingState.error;
      setErrorMessage = error;

      showDialog(
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () => Get.back(),
        ),
      );
    });
    update();
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    setLoadingState = LoadingState.loading;

    if (email.isEmpty) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please input your email.";

      showDialog(
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    } else {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
          (value) {
            setLoadingState = LoadingState.complete;
            showDialog(
              context: context,
              builder: (context) => const SuccessWidget(
                  message:
                      "Please check your Email. We have sent the password reset link"),
            );
          },
        );
      } catch (e) {
        setLoadingState = LoadingState.error;
        setErrorMessage = "$e";
        showDialog(
          context: context,
          builder: (context) => CustomErrorWidget(
            errorMessage: getErrorMessage,
            function: () {
              Get.back();
            },
          ),
        );
      }
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
