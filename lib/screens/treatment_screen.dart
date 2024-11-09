import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';

import 'package:dental_clinic_mobile/controller/auth_controller.dart';

import 'package:dental_clinic_mobile/controller/treatment_controller.dart';

import 'package:dental_clinic_mobile/data/treatment_vo.dart';
import 'package:dental_clinic_mobile/screens/treatment_detail_screen.dart';

import 'package:dental_clinic_mobile/widgets/admin_access_info_widget.dart';
import 'package:dental_clinic_mobile/widgets/banned_user_info.dart';
import 'package:dental_clinic_mobile/widgets/load_fail_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _authController = Get.put(AuthController());
final _treatmentController = Get.put(TreatmentController());

class TreatmentScreen extends StatelessWidget {
  const TreatmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(
          child: Text(
            "Treatments",
            style: titleStyle,
          ),
        ),
        Obx(() => _authController.currentUser.value == null
            ? const AdminAccessInfoWidget()
            : (_authController.currentUser.value?.isBanned ?? false)
                ? const BannedUserInfoWidget()
                : treatmentWidget(context)),
        const Gap(50)
      ],
    );
  }

  Widget treatmentWidget(BuildContext context) {
    return Column(
      children: [
        const Gap(35),
        LoadingStateWidget(
            paddingTop: MediaQuery.of(context).size.height * 0.25,
            loadingState: _treatmentController.getLoadingState,
            loadingSuccessWidget: TreatmentList(
              treatments: _treatmentController.treatmentList,
            ),
            loadingInitWidget: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25),
              child: LoadFailWidget(
                function: () {
                  _treatmentController.callTreatments();
                },
              ),
            )),
      ],
    );
  }
}

class TreatmentList extends StatelessWidget {
  const TreatmentList({super.key, required this.treatments});

  final List<TreatmentVO> treatments;

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
      itemCount: treatments.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Get.to(
          () => TreatmentDetailScreen(treatment: treatments[index]),
        ),
        child: TreatmentCard(
          treatment: treatments[index],
        ),
      ),
    );
  }
}

class TreatmentCard extends StatelessWidget {
  const TreatmentCard({super.key, required this.treatment});

  final TreatmentVO treatment;

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
              const Icon(Icons.medication_outlined),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: treatment.date,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: kFourthColor)),
              ])),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: treatment.time,
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
                            text: "Doctor : ${treatment.doctorName}",
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
                            text: "Patient : ${treatment.patientName}",
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
                            text: treatment.treatment,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kFourthColor)),
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
