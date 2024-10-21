import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/data/feedback_vo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackDetailScreen extends StatelessWidget {
  const FeedbackDetailScreen({super.key, required this.feedback});

  final FeedBackVO feedback;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Text(
                    textAlign: TextAlign.start,
                    "Feedbacks Details",
                    style: titleStyle,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
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
                height: 30,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "${feedback.patientName} : ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: kFourthColor)),
              ])),
              const SizedBox(
                height: 30,
              ),
              RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(children: [
                    TextSpan(
                        text: feedback.body,
                        style:
                            const TextStyle(fontSize: 18, color: kFourthColor)),
                  ])),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
