// ignore_for_file: avoid_function_literals_in_foreach_calls, deprecated_member_use

import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/appointment_controller.dart';
import 'package:dental_clinic_mobile/controller/doctor_controller.dart';
import 'package:dental_clinic_mobile/data/doctor_vo.dart';
import 'package:dental_clinic_mobile/widgets/error_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final _appointmentController = Get.put(AppointmentController());
final _doctorController = Get.put(DoctorController());

bool isSearchDoctor = false;

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({super.key});

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  String getDayOfWeek(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  String formatTime(TimeOfDay time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  String convertTimeFormat(String time) {
    final DateFormat dateFormat12Hour =
        DateFormat("h:mm a"); // Input format (e.g., "6:00 PM")
    final DateFormat dateFormat24Hour =
        DateFormat("HH:mm"); // Output format (e.g., "18:00")
    return dateFormat24Hour.format(dateFormat12Hour.parse(time));
  }

  List<DoctorVO> availableDoctorList = [];

  bool _isTimeInSlot(String selectedTime, String slot) {
    List<String> times = slot.split("-");

    String timeSelected = selectedTime;
    String startTime = convertTimeFormat(times[0].trim());
    String endTime = convertTimeFormat(times[1].trim());

    return checkTimeBetween(timeSelected, startTime, endTime);
  }

  bool checkTimeBetween(String timeSelected, String startTime, String endTime) {
    // Parse the time strings into DateTime objects
    DateTime selectedTime = DateTime.parse("1970-01-01 $timeSelected");
    DateTime start = DateTime.parse("1970-01-01 $startTime");
    DateTime end = DateTime.parse("1970-01-01 $endTime");

    // Check if the selected time is between start and end time
    return selectedTime.isAfter(start) && selectedTime.isBefore(end);
  }

  showDoctors() {
    availableDoctorList.clear();
    _doctorController.doctorsList.forEach((doctorData) {
      if (doctorData.availability != null &&
          doctorData.availability[getDayOfWeek(selectedDate!)] != null) {
        List<String> timeSlots = List<String>.from(
            doctorData.availability[getDayOfWeek(selectedDate!)]);

        // Check if the selected time falls within any of the available time slots
        for (String slot in timeSlots) {
          if (_isTimeInSlot(formatTime(selectedTime!), slot) &&
              !availableDoctorList.contains(doctorData)) {
            availableDoctorList.add(doctorData);
          } else {}
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios)),
                const Text(
                  "Add Appointment",
                  style: titleStyle,
                ),
                const Gap(30)
              ],
            ),
            Gap(MediaQuery.of(context).size.height * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      selectedDate == null
                          ? 'Select Date'
                          : DateFormat('yMMMMd').format(selectedDate!),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      selectedTime == null
                          ? ', Select Time'
                          : ", ${selectedTime!.format(context)}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: const Icon(Icons.date_range)),
                    IconButton(
                        onPressed: () {
                          _selectTime(context);
                        },
                        icon: const Icon(Icons.timelapse)),
                  ],
                )
              ],
            ),
            const Gap(20),
            Obx(
              () => Container(
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                  color: kBtnGrayColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Shadow color
                      spreadRadius: 3, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: const Offset(0, 3), // Offset of the shadow
                    ),
                  ], //border corner radius
                ),
                child: Center(
                  child: Text(_appointmentController.doctor.value == null
                      ? "Select Doctor"
                      : "Doctor: ${_appointmentController.doctor.value!.name}"),
                ),
              ),
            ),
            const Gap(20),
            const Center(
              child: Text(
                "Available Doctors",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor),
              ),
            ),
            const Gap(20),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: kBtnGrayColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 3, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(0, 3), // Offset of the shadow
                  ),
                ], //border corner radius
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("See Doctors"),
                  GestureDetector(
                      onTap: () {
                        showDoctors();
                        setState(() {
                          isSearchDoctor = !isSearchDoctor;
                        });
                      },
                      child: const Icon(Icons.search)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            isSearchDoctor && availableDoctorList.isEmpty
                ? const Center(
                    child: Text(
                      "No doctors available!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                : !isSearchDoctor
                    ? const SizedBox()
                    : DoctorList(availableDoctorList: availableDoctorList),
            const Gap(30),
            Obx(
              () => LoadingStateWidget(
                  loadingState: _appointmentController.getLoadingState,
                  loadingSuccessWidget: addBtn(
                    context,
                    () {
                      if (selectedDate == null || selectedTime == null) {
                        showDialog(
                          context: context,
                          builder: (context) => CustomErrorWidget(
                              errorMessage: "Pick date and time",
                              function: () {
                                Get.back();
                              }),
                        );
                      } else {
                        _appointmentController.addAppointment(
                            DateFormat('yMMMMd').format(selectedDate!),
                            selectedTime!.format(context),
                            context);
                      }
                    },
                  ),
                  loadingInitWidget: addBtn(
                    context,
                    () {
                      if (selectedDate == null || selectedTime == null) {
                        showDialog(
                          context: context,
                          builder: (context) => CustomErrorWidget(
                              errorMessage: "Pick date and time",
                              function: () {
                                Get.back();
                              }),
                        );
                      } else {
                        _appointmentController.addAppointment(
                            DateFormat('yMMMMd').format(selectedDate!),
                            selectedTime!.format(context),
                            context);
                      }
                    },
                  ),
                  paddingTop: 0),
            )
          ],
        ),
      ),
    ));
  }

  Widget addBtn(BuildContext context, VoidCallback function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 80),
        height: 40,
        decoration: BoxDecoration(
            color: kSecondaryColor, borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text("Add"),
        ),
      ),
    );
  }
}

class DoctorList extends StatelessWidget {
  const DoctorList({super.key, required this.availableDoctorList});

  final List<DoctorVO> availableDoctorList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                _appointmentController.doctor.value =
                    availableDoctorList[index];
              },
              child: Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: kBtnGrayColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Shadow color
                      spreadRadius: 3, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: const Offset(0, 3), // Offset of the shadow
                    ),
                  ], //border corner radius
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 25,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 0.3),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          availableDoctorList[index].url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Gap(15),
                    Text(availableDoctorList[index].name)
                  ],
                ),
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: availableDoctorList.length);
  }
}
