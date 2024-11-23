// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/data/payment_vo.dart';
import 'package:dental_clinic_mobile/data/treatment_vo.dart';
import 'package:dental_clinic_mobile/firebase/firebase.dart';
import 'package:dental_clinic_mobile/utils/enums.dart';
import 'package:dental_clinic_mobile/utils/file_picker_utils.dart';
import 'package:dental_clinic_mobile/widgets/error_widget.dart';
import 'package:dental_clinic_mobile/widgets/success_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TreatmentController extends BaseController {
  Rxn<PaymentVO> selectedPayment = Rxn<PaymentVO>();

  Rxn<File> selectFile = Rxn<File>();

  RxList<TreatmentVO> treatmentList = <TreatmentVO>[].obs;

  final _firebaseService = FirebaseServices();

  String currentUserID = FirebaseAuth.instance.currentUser?.uid ?? "";

  final _filePickerUtil = FilePickerUtil();

  RxString date = DateFormat('yMMMMd').format(DateTime.now()).obs;

  RxList<TreatmentVO> filteredTreatmentsByDate = <TreatmentVO>[].obs;

  filterTreatments() {
    filteredTreatmentsByDate.value = [];

    for (TreatmentVO treatment in treatmentList) {
      if (treatment.date == date.value) {
        filteredTreatmentsByDate.add(treatment);
      }
    }
  }

  getTreatmentsOnSelectedDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      date.value = DateFormat('yMMMMd').format(pickedDate);
      filterTreatments();
    }
  }

  @override
  void onInit() {
    callTreatments();

    super.onInit();
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
                    (value) => selectFile.value = value,
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
                    (value) => selectFile.value = value,
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

  callTreatments() async {
    setLoadingState = LoadingState.loading;
    _firebaseService.getTreatmentListStream(currentUserID).listen(
      (event) {
        if (event == null || event.isEmpty) {
          setLoadingState = LoadingState.error;
        } else {
          treatmentList.value = event;
          filterTreatments();
          setLoadingState = LoadingState.complete;
        }
      },
    ).onError((error) {
      setLoadingState = LoadingState.error;
    });
    update();
  }

  Future updateTreatment(
      int id,
      String patientID,
      String patientName,
      int doctorID,
      String doctorName,
      String date,
      String treatment,
      String dosage,
      double cost,
      double discount,
      String time,
      String paymentStatus,
      BuildContext context) async {
    if (selectedPayment.value == null || selectFile.value == null) {
      setLoadingState = LoadingState.error;

      setErrorMessage = "Please put both payment and slip.";

      showDialog(
          context: context,
          builder: (context) => CustomErrorWidget(
                errorMessage: getErrorMessage,
                function: () => Get.back(),
              ));
    } else {
      double finalCost =
          discount == 0 ? cost : cost - (cost * (discount / 100));
      setLoadingState = LoadingState.loading;

      String url = "";

      url = await _uploadFileToFirebaseStorage();

      final treatmentVO = TreatmentVO(
          time: time,
          paymentStatus: paymentStatus,
          paymentType: selectedPayment.value!.type,
          slip: url,
          cost: finalCost,
          discount: discount,
          id: id,
          doctorID: doctorID,
          doctorName: doctorName,
          patientID: patientID,
          patientName: patientName,
          treatment: treatment,
          dosage: dosage,
          date: date);
      _firebaseService.saveTreatment(treatmentVO).then(
        (value) {
          setLoadingState = LoadingState.complete;

          callTreatments();

          selectedPayment.value = null;
          selectFile.value = null;

          showDialog(
            context: context,
            builder: (context) => const SuccessWidget(
              message: "Treatment Updated Successfully!",
            ),
          ).then(
            (value) {
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
                ));
      });
    }

    update();
  }

  Future _uploadFileToFirebaseStorage() {
    String path = 'image';
    String contentType = 'image/jpg';

    return FirebaseServices.uploadToFirebaseStorage(
        selectFile.value!, path, contentType);
  }
}
