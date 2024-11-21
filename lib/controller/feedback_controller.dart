// ignore_for_file: use_build_context_synchronously

import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/data/feedback_vo.dart';
import 'package:dental_clinic_mobile/firebase/firebase.dart';
import 'package:dental_clinic_mobile/utils/enums.dart';
import 'package:dental_clinic_mobile/widgets/error_widget.dart';
import 'package:dental_clinic_mobile/widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends BaseController {
  RxList<FeedBackVO> feedbackList = <FeedBackVO>[].obs;

  final _authController = Get.put(AuthController());

  final _firebaseService = FirebaseServices();

  @override
  void onInit() {
    callFeedbacks();
    super.onInit();
  }

  callFeedbacks() async {
    setLoadingState = LoadingState.loading;
    _firebaseService.getFeedBackListStream().listen(
      (event) {
        if (event == null || event.isEmpty) {
          setLoadingState = LoadingState.error;
        } else {
          feedbackList.value = event;
          setLoadingState = LoadingState.complete;
        }
      },
    ).onError((error) {
      setLoadingState = LoadingState.error;
    });

    update();
  }

  Future addFeedback(TextEditingController bodyController, int rate,
      BuildContext context) async {
    if (bodyController.text == " " && rate == 0) {
      setLoadingState = LoadingState.error;
      setErrorMessage =
          "Please write the feedback and select the number of your rate to give feedback!";

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
    } else if (bodyController.text == " ") {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please write the feedback  to give feedback!";

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
    } else if (rate == 0) {
      setLoadingState = LoadingState.error;
      setErrorMessage =
          "Please select the number of your rate to give feedback!";

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
      int id = DateTime.now().millisecondsSinceEpoch;

      final feedback = FeedBackVO(
          body: bodyController.text,
          id: id,
          patientID: _authController.currentUser.value?.id ?? "",
          display: false,
          patientName: _authController.currentUser.value?.name ?? "",
          rate: rate);
      return _firebaseService.saveFeedback(feedback).then(
        (value) {
          setLoadingState = LoadingState.complete;

          showDialog(
            context: context,
            builder: (context) =>
                const SuccessWidget(message: "New Feedback Added!"),
          ).then(
            (value) => Get.back(),
          );
          bodyController.clear();
        },
      ).catchError((error) {
        setLoadingState = LoadingState.error;
        setErrorMessage = error;
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
      });
    }

    update();
  }
}
