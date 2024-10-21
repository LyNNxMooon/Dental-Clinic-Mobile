import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/feedback_controller.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:dental_clinic_mobile/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _feedBackController = Get.put(FeedbackController());

class AddFeedbackScreen extends StatefulWidget {
  const AddFeedbackScreen({super.key});

  @override
  State<AddFeedbackScreen> createState() => _AddFeedbackScreenState();
}

class _AddFeedbackScreenState extends State<AddFeedbackScreen> {
  final _bodyController = TextEditingController(text: " ");

  List<bool> rates = <bool>[false, false, false, false, false];

  int rateCalculation() {
    int rateNumber = 0;
    for (bool isRated in rates) {
      if (isRated) {
        rateNumber++;
      }
    }

    return rateNumber;
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
                  "Write Feedback",
                  style: titleStyle,
                ),
                const Gap(30)
              ],
            ),
            Gap(MediaQuery.of(context).size.height * 0.14),
            CustomTextField(
              hintText: "Enter your feedback",
              label: "Feedback",
              minLines: 10,
              maxLines: 20,
              controller: _bodyController,
            ),
            const Gap(30),
            Center(
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => IconButton(
                        onPressed: () {
                          setState(() {
                            rates[index] = !rates[index];
                          });
                        },
                        icon: rates[index]
                            ? const Icon(
                                Icons.star,
                                color: kRateColor,
                              )
                            : const Icon(Icons.star_border)),
                    separatorBuilder: (context, index) => const Gap(0),
                    itemCount: rates.length),
              ),
            ),
            const Gap(30),
            Obx(() => LoadingStateWidget(
                loadingState: _feedBackController.getLoadingState,
                loadingSuccessWidget: addBtn(
                  context,
                  () {
                    _feedBackController.addFeedback(
                        _bodyController, rateCalculation(), context);
                  },
                ),
                loadingInitWidget: addBtn(
                  context,
                  () {
                    _feedBackController.addFeedback(
                        _bodyController, rateCalculation(), context);
                  },
                ),
                paddingTop: 0))
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
