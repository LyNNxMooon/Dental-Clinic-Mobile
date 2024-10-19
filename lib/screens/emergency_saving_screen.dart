import 'package:cached_network_image/cached_network_image.dart';
import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/emergency_saving_controller.dart';
import 'package:dental_clinic_mobile/data/emergency_saving_vo.dart';
import 'package:dental_clinic_mobile/screens/emergency_detail_screen.dart';
import 'package:dental_clinic_mobile/widgets/load_fail_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _emergencySavingController = Get.put(EmergencySavingController());

class EmergencySavingScreen extends StatelessWidget {
  const EmergencySavingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(
          child: Text(
            "Emergency Saving",
            style: titleStyle,
          ),
        ),
        const Gap(30),
        Obx(
          () => LoadingStateWidget(
              paddingTop: MediaQuery.of(context).size.height * 0.3,
              loadingState: _emergencySavingController.getLoadingState,
              loadingSuccessWidget: EmergencySavingList(
                savings: _emergencySavingController.emergencySavingList,
              ),
              loadingInitWidget: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.22),
                child: LoadFailWidget(
                  function: () {
                    _emergencySavingController.callEmergencySavings();
                  },
                ),
              )),
        ),
        const Gap(50),
      ],
    );
  }
}

class EmergencySavingList extends StatelessWidget {
  const EmergencySavingList({super.key, required this.savings});

  final List<EmergencySavingVO> savings;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 0.0,
        mainAxisExtent: 200,
      ),
      itemCount: _emergencySavingController.emergencySavingList.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Get.to(() => EmergencyDetailScreen(saving: savings[index]));
        },
        child: SavingCard(
          saving: savings[index],
        ),
      ),
    );
  }
}

class SavingCard extends StatelessWidget {
  const SavingCard({super.key, required this.saving});

  final EmergencySavingVO saving;

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
        crossAxisAlignment: CrossAxisAlignment.center,
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
                child: CachedNetworkImage(
                  imageUrl: saving.url,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const LoadingWidget(),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error),
                  ),
                ),
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
                        text: saving.title,
                        style:
                            const TextStyle(fontSize: 14, color: kFourthColor)),
                  ])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
