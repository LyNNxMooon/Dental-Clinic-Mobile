import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/payment_controller.dart';
import 'package:dental_clinic_mobile/controller/treatment_controller.dart';
import 'package:dental_clinic_mobile/data/payment_vo.dart';
import 'package:dental_clinic_mobile/data/treatment_vo.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _treatmentController = Get.put(TreatmentController());
final _paymentController = Get.put(PaymentController());

class TreatmentDetailScreen extends StatefulWidget {
  const TreatmentDetailScreen({super.key, required this.treatment});

  final TreatmentVO treatment;

  @override
  State<TreatmentDetailScreen> createState() => _TreatmentDetailScreenState();
}

class _TreatmentDetailScreenState extends State<TreatmentDetailScreen> {
  bool isDrop = false;

  List<PaymentVO> payments = [];

  double initCost = 0.0;

  @override
  void initState() {
    populatePayments();
    initCost = widget.treatment.discount == 0
        ? widget.treatment.cost
        : widget.treatment.cost / (1 - (widget.treatment.discount / 100));
    super.initState();
  }

  populatePayments() {
    payments.clear();

    payments = _paymentController.payments;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  "Treatment Details",
                  style: titleStyle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.treatment.date,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " , ${widget.treatment.time}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Doctor : ${widget.treatment.doctorName}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " , Patient : ${widget.treatment.patientName}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Final Cost : ${widget.treatment.cost}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " , Payment : ${widget.treatment.paymentType.isEmpty && widget.treatment.paymentStatus == "Paid" ? "Cash" : widget.treatment.paymentType.isEmpty && widget.treatment.paymentStatus == "Un-paid" ? "Un-paid" : widget.treatment.paymentType}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Status : ",
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  TextSpan(
                      text: widget.treatment.paymentStatus == "Un-paid" &&
                              widget.treatment.slip.isNotEmpty
                          ? "In Review"
                          : widget.treatment.paymentStatus,
                      style: const TextStyle(
                          color: kFourthColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17))
                ])),
              ),
              const Gap(15),
              const Divider(
                height: 20,
                thickness: 2,
                color: kThirdColor,
                endIndent: 30,
                indent: 30,
              ),
              const Gap(15),
              const Center(
                  child: Text(
                "Treatment Name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
              infoBox(widget.treatment.treatment),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                "Medical Information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
              infoBox(widget.treatment.dosage),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  infoBox("Cost : $initCost"),
                  const Gap(10),
                  infoBox("Discount : ${widget.treatment.discount} %")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              selectPaymentTile(context),
              const Gap(10),
              isDrop
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          paymentTile(context, payments[index]),
                      separatorBuilder: (context, index) => const Gap(10),
                      itemCount: payments.length)
                  : const SizedBox(),
              Obx(
                () => GestureDetector(
                  onTap: () => _treatmentController.showPictureDialog(context),
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1)),
                      child: _treatmentController.selectFile.value == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                widget.treatment.slip.isEmpty
                                    ? "https://thumbs.dreamstime.com/b/sad-document-no-data-file-icon-white-334021734.jpg"
                                    : widget.treatment.slip,
                                fit: BoxFit.contain,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                _treatmentController.selectFile.value!,
                                fit: BoxFit.contain,
                              ),
                            )),
                ),
              ),
              const Gap(20),
              Obx(
                () => LoadingStateWidget(
                    loadingState: _treatmentController.getLoadingState,
                    loadingSuccessWidget: Center(
                      child: TextButton(
                        onPressed: () {
                          _treatmentController.updateTreatment(
                              widget.treatment.id,
                              widget.treatment.patientID,
                              widget.treatment.patientName,
                              widget.treatment.doctorID,
                              widget.treatment.doctorName,
                              widget.treatment.date,
                              widget.treatment.treatment,
                              widget.treatment.dosage,
                              initCost,
                              widget.treatment.discount,
                              widget.treatment.time,
                              widget.treatment.paymentStatus,
                              context,
                              widget.treatment.patientfcm);
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(kSecondaryColor)),
                        child: const Text(
                          "Update",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ),
                    loadingInitWidget: Center(
                      child: TextButton(
                        onPressed: () {
                          _treatmentController.updateTreatment(
                              widget.treatment.id,
                              widget.treatment.patientID,
                              widget.treatment.patientName,
                              widget.treatment.doctorID,
                              widget.treatment.doctorName,
                              widget.treatment.date,
                              widget.treatment.treatment,
                              widget.treatment.dosage,
                              initCost,
                              widget.treatment.discount,
                              widget.treatment.time,
                              widget.treatment.paymentStatus,
                              context,
                              widget.treatment.patientfcm);
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(kSecondaryColor)),
                        child: const Text(
                          "Update",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ),
                    paddingTop: 0),
              ),
              const Gap(30)
            ],
          ),
        ),
      ),
    );
  }

  Widget selectPaymentTile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _treatmentController.selectedPayment.value == null
              ? const Text(
                  "Select Payment to update",
                  style: TextStyle(color: kThirdColor),
                )
              : SizedBox(
                  width: 180,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 0.3),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              _treatmentController.selectedPayment.value!.url,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(_treatmentController
                            .selectedPayment.value!.accountName),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                            "/ ${_treatmentController.selectedPayment.value!.accountNumber}"),
                      ],
                    ),
                  ),
                ),
          IconButton(
              onPressed: () {
                setState(() {
                  isDrop = !isDrop;
                });
              },
              icon: isDrop
                  ? const Icon(Icons.arrow_drop_up)
                  : const Icon(Icons.arrow_drop_down))
        ],
      ),
    );
  }

  Widget paymentTile(BuildContext context, PaymentVO payment) {
    return GestureDetector(
      onTap: () {
        _treatmentController.selectedPayment.value = payment;
        setState(() {
          isDrop = !isDrop;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1)),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 0.3),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    payment.url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(payment.accountName),
              const SizedBox(
                width: 15,
              ),
              Text("/ ${payment.accountNumber}"),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoBox(String body) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1)),
      child: Text(
        body,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
