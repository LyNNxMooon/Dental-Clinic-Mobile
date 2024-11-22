import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/appointment_controller.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/data/appointment_vo.dart';
import 'package:dental_clinic_mobile/screens/add_appointment_screen.dart';
import 'package:dental_clinic_mobile/widgets/admin_access_info_widget.dart';
import 'package:dental_clinic_mobile/widgets/banned_user_info.dart';
import 'package:dental_clinic_mobile/widgets/load_fail_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _authController = Get.put(AuthController());
final _appointmentController = Get.put(AppointmentController());

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Appointments",
                style: titleStyle,
              ),
              const Gap(5),
              Text("(${_appointmentController.date.value})")
            ],
          ),
        ),
        Obx(() => _authController.currentUser.value == null
            ? const AdminAccessInfoWidget()
            : (_authController.currentUser.value?.isBanned ?? false)
                ? const BannedUserInfoWidget()
                : appointmentWidget(context)),
        const Gap(50)
      ],
    );
  }

  Widget appointmentWidget(BuildContext context) {
    return Column(
      children: [
        const Gap(35),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Add Appointment",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.to(() => const AddAppointmentScreen()),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: kBtnGrayColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Icon(
                      Icons.add,
                      color: kFourthColor,
                    ),
                  ),
                ),
                const Gap(10),
                GestureDetector(
                  onTap: () => _appointmentController
                      .getAppointmentsOnSelectedDate(context),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: kBtnGrayColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Icon(
                      Icons.date_range,
                      color: kFourthColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const Gap(20),
        _appointmentController.filteredAppointmentsByDate.isEmpty
            ? Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                child: const Center(
                  child: Text(
                    "No appointments on this date!",
                    style: titleStyle,
                  ),
                ),
              )
            : LoadingStateWidget(
                paddingTop: MediaQuery.of(context).size.height * 0.25,
                loadingState: _appointmentController.getLoadingState,
                loadingSuccessWidget: AppointmentList(
                  appointments:
                      _appointmentController.filteredAppointmentsByDate,
                ),
                loadingInitWidget: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25),
                  child: LoadFailWidget(
                    function: () {
                      _appointmentController.callAppointments();
                    },
                  ),
                )),
      ],
    );
  }
}

class AppointmentList extends StatelessWidget {
  const AppointmentList({super.key, required this.appointments});

  final List<AppointmentVO> appointments;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5,
        mainAxisExtent: 265,
      ),
      itemCount: appointments.length,
      itemBuilder: (context, index) => AppointmentCard(
        appointment: appointments[index],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointment});

  final AppointmentVO appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(8), //border corner radius
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.date_range),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: appointment.date,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: kFourthColor)),
              ])),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: appointment.time,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: kFourthColor)),
              ])),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Doctor : ${appointment.doctorName}",
                            style: const TextStyle(color: kFourthColor)),
                      ])),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Patient : ${appointment.patientName}",
                            style: const TextStyle(color: kFourthColor)),
                      ])),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
