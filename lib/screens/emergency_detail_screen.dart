import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/data/emergency_saving_vo.dart';
import 'package:dental_clinic_mobile/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EmergencyDetailScreen extends StatelessWidget {
  const EmergencyDetailScreen({super.key, required this.saving});

  final EmergencySavingVO saving;

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
                  "Emergency Saving Details",
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
                child: ProfileImageWidget(img: saving.url),
              ),
            ),
            const Gap(40),
            const Center(
                child: Text(
              "Title",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1)),
              child: Center(
                child: Text(
                  saving.title,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Gap(20),
            const Center(
                child: Text(
              "Methods",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1)),
              child: Center(
                child: Text(
                  saving.body,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const Gap(50),
          ],
        ),
      ),
    ));
  }
}
