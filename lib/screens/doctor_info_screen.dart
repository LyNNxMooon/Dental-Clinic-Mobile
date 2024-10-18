import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/doctor_controller.dart';
import 'package:dental_clinic_mobile/data/doctor_vo.dart';
import 'package:dental_clinic_mobile/widgets/load_fail_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _doctorController = Get.put(DoctorController());

class DoctorInfoScreen extends StatelessWidget {
  const DoctorInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(
          child: Text(
            "Available Doctors",
            style: titleStyle,
          ),
        ),
        const Gap(30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: kThirdColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: const Row(
            children: [
              Icon(
                Icons.search,
                color: kSecondaryColor,
              ),
              Gap(20),
              Text(
                "Search Doctor...",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        const Gap(20),
        Obx(
          () => LoadingStateWidget(
              paddingTop: MediaQuery.of(context).size.height * 0.3,
              loadingState: _doctorController.getLoadingState,
              loadingSuccessWidget: DoctorList(
                doctors: _doctorController.doctorsList,
              ),
              loadingInitWidget: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.22),
                child: LoadFailWidget(
                  function: () {
                    _doctorController.callDoctors();
                  },
                ),
              )),
        ),
        const Gap(50),
      ],
    );
  }
}

class DoctorList extends StatelessWidget {
  const DoctorList({super.key, required this.doctors});

  final List<DoctorVO> doctors;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 0.0,
        mainAxisExtent: 220,
      ),
      itemCount: _doctorController.doctorsList.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: DoctorCard(
          doctor: doctors[index],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctor});

  final DoctorVO doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(8), //border corner radius
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  border: Border.all(width: 0.3)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.network(
                  doctor.url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Name : ",
                      style: TextStyle(fontSize: 14, color: kFourthColor)),
                  TextSpan(
                      text: doctor.name,
                      style:
                          const TextStyle(fontSize: 14, color: kFourthColor)),
                ])),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Specialist : ",
                      style: TextStyle(fontSize: 12, color: kThirdColor)),
                  TextSpan(
                      text: doctor.specialist,
                      style: const TextStyle(fontSize: 12, color: kThirdColor)),
                ])),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          RichText(
              text: TextSpan(children: [
            const TextSpan(
                text: "Experience : ",
                style: TextStyle(fontSize: 12, color: kThirdColor)),
            TextSpan(
                text: doctor.experience,
                style: const TextStyle(fontSize: 12, color: kThirdColor)),
          ])),
        ],
      ),
    );
  }
}
