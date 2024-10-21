// ignore_for_file: deprecated_member_use

import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/controller/feedback_controller.dart';
import 'package:dental_clinic_mobile/data/feedback_vo.dart';
import 'package:dental_clinic_mobile/screens/add_feedback_screen.dart';
import 'package:dental_clinic_mobile/screens/feed_back_detail_screen.dart';
import 'package:dental_clinic_mobile/widgets/admin_access_info_widget.dart';
import 'package:dental_clinic_mobile/widgets/error_widget.dart';
import 'package:dental_clinic_mobile/widgets/load_fail_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _authController = Get.put(AuthController());
final _feedbackController = Get.put(FeedbackController());

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(
          child: Text(
            "Contact Us",
            style: titleStyle,
          ),
        ),
        Obx(() => _authController.currentUser.value == null
            ? const AdminAccessInfoWidget()
            : contactWidget(context)),
        const Gap(50)
      ],
    );
  }

  Widget contactWidget(BuildContext context) {
    return Column(
      children: [
        const Gap(70),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              item(
                context,
                Icons.monetization_on,
                () {},
              ),
              item(
                context,
                Icons.rate_review_outlined,
                () {
                  if (_authController.currentUser.value?.isBanned ?? false) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomErrorWidget(
                        errorMessage:
                            "You have been banned by admin. Please contact to us!",
                        function: () => Get.back(),
                      ),
                    );
                  } else {
                    Get.to(() => const AddFeedbackScreen());
                  }
                },
              ),
              item(
                context,
                Icons.message,
                () {},
              )
            ],
          ),
        ),
        const Gap(55),
        const Text(
          "Patient Feedbacks",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Gap(30),
        LoadingStateWidget(
            paddingTop: MediaQuery.of(context).size.height * 0.14,
            loadingState: _feedbackController.getLoadingState,
            loadingSuccessWidget: FeedbackList(
              feedbacks: _feedbackController.feedbackList,
            ),
            loadingInitWidget: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.14),
              child: LoadFailWidget(
                function: () {
                  _feedbackController.callFeedbacks();
                },
              ),
            )),
      ],
    );
  }

  Widget item(BuildContext context, IconData icon, VoidCallback function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: kBtnGrayColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 3, // Spread radius
              blurRadius: 4, // Blur radius
              offset: const Offset(0, 3), // Offset of the shadow
            ),
          ], //border corner radius
        ),
        child: Center(
          child: Icon(
            icon,
            color: kSecondaryColor,
            size: 35,
          ),
        ),
      ),
    );
  }
}

class FeedbackList extends StatelessWidget {
  const FeedbackList({super.key, required this.feedbacks});

  final List<FeedBackVO> feedbacks;

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
        itemCount: feedbacks.length,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () => Get.to(
                  () => FeedbackDetailScreen(feedback: feedbacks[index])),
              child: FeedbackCard(
                feedback: feedbacks[index],
              ),
            ));
  }
}

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({super.key, required this.feedback});

  final FeedBackVO feedback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
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
          SizedBox(
            height: 30,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: kRateColor,
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 5,
                    ),
                itemCount: feedback.rate),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "${feedback.patientName} : ",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: kFourthColor)),
          ])),
          const SizedBox(
            height: 15,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text:
                        "${feedback.body.length < 150 ? feedback.body : feedback.body.substring(0, 150)}...",
                    style: const TextStyle(color: kFourthColor)),
              ])),
        ],
      ),
    );
  }
}
