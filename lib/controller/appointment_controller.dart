// ignore_for_file: use_build_context_synchronously

import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/data/appointment_vo.dart';
import 'package:dental_clinic_mobile/data/doctor_vo.dart';
import 'package:dental_clinic_mobile/firebase/firebase.dart';
import 'package:dental_clinic_mobile/utils/enums.dart';
import 'package:dental_clinic_mobile/widgets/error_widget.dart';
import 'package:dental_clinic_mobile/widgets/success_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentController extends BaseController {
  RxList<AppointmentVO> appointmentList = <AppointmentVO>[].obs;
  RxList<AppointmentVO> filteredAppointmentsByDate = <AppointmentVO>[].obs;

  Rxn<DoctorVO> doctor = Rxn<DoctorVO>();

  RxString date = DateFormat('yMMMMd').format(DateTime.now()).obs;

  final _authController = Get.put(AuthController());
  final _firebaseService = FirebaseServices();

  @override
  void onInit() {
    callAppointments();
    super.onInit();
  }

  filterAppointments() {
    filteredAppointmentsByDate.value = [];

    for (AppointmentVO appointment in appointmentList) {
      if (appointment.date == date.value) {
        filteredAppointmentsByDate.add(appointment);
      }
    }
  }

  getAppointmentsOnSelectedDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      date.value = DateFormat('yMMMMd').format(pickedDate);
      filterAppointments();
    }
  }

  Future addAppointment(
      String? date, String? time, BuildContext context) async {
    if (date == null ||
        time == null ||
        _authController.currentUser.value == null ||
        doctor.value == null) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Please select the doctor to make appointment!";

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

      final appointment = AppointmentVO(
          rejectReason: "",
          status: "Pending",
          id: id,
          doctorId: doctor.value!.id,
          doctorName: doctor.value!.name,
          patientId: _authController.currentUser.value!.id,
          patientName: _authController.currentUser.value!.name,
          patientPhone: _authController.currentUser.value!.phone,
          date: date,
          time: time);
      return _firebaseService.saveAppointment(appointment).then(
        (value) {
          setLoadingState = LoadingState.complete;

          showDialog(
            context: context,
            builder: (context) =>
                const SuccessWidget(message: "New Appointment Added!"),
          ).then(
            (value) => Get.back(),
          );

          callAppointments();
          doctor.value = null;
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

  callAppointments() async {
    String patientId = FirebaseAuth.instance.currentUser?.uid ?? "";
    setLoadingState = LoadingState.loading;
    _firebaseService.getAppointmentListStream(patientId).listen(
      (event) {
        if (event == null || event.isEmpty) {
          setLoadingState = LoadingState.error;
        } else {
          appointmentList.value = event;
          filterAppointments();
          setLoadingState = LoadingState.complete;
        }
      },
    ).onError((error) {
      setLoadingState = LoadingState.error;
    });

    update();
  }
}
