// ignore_for_file: deprecated_member_use, avoid_print

import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/data/doctor_vo.dart';
import 'package:dental_clinic_mobile/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key, required this.doctor});

  final DoctorVO doctor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios)),
                const Text(
                  "Doctor Details",
                  style: titleStyle,
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            const Gap(30),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(width: 0.3),
                ),
                child: ProfileImageWidget(img: doctor.url),
              ),
            ),
            const Gap(40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kBtnGrayColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 3, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(0, 3), // Offset of the shadow
                  ),
                ], //border corner radius
              ),
              child: Column(
                children: [
                  userCred(context, "Name", doctor.name),
                  const Gap(20),
                  const Text("Biography : ",
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  const Gap(10),
                  Text(
                      textAlign: TextAlign.justify,
                      doctor.bio,
                      style: const TextStyle(
                        fontSize: 16,
                        color: kFourthColor,
                      )),
                  const Gap(20),
                  const Text("Specialist : ",
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  const Gap(10),
                  Text(doctor.specialist,
                      style: const TextStyle(
                        fontSize: 16,
                        color: kFourthColor,
                      )),
                  const Gap(20),
                  userCred(context, "Experience", doctor.experience),
                ],
              ),
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kBtnGrayColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 3, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(0, 3), // Offset of the shadow
                  ),
                ], //border corner radius
              ),
              child: Column(
                children: [
                  const Text("Availability : ",
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  const Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: doctor.availability.entries.map<Widget>((entry) {
                      String day = entry.key;
                      List<dynamic> times = entry.value;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              day,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Gap(10),
                            ...times.map((time) => Text(
                                  time,
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            const Gap(50),
          ],
        ),
      ),
    ));
  }
}

Widget userCred(BuildContext context, String type, String value) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
            text: "$type : ",
            style: const TextStyle(
                color: kSecondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17)),
        TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 16,
              color: kFourthColor,
            )),
      ],
    ),
  );
}
