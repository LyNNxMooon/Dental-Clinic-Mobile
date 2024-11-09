import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/payment_controller.dart';
import 'package:dental_clinic_mobile/controller/pharmacy_controller.dart';
import 'package:dental_clinic_mobile/data/payment_vo.dart';
import 'package:dental_clinic_mobile/widgets/button_widget.dart';
import 'package:dental_clinic_mobile/widgets/load_fail_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _pharmacyController = Get.put(PharmacyController());
final _paymentController = Get.put(PaymentController());

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  @override
  void initState() {
    _pharmacyController.calculateTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            const Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios)),
                const Text(
                  "Select Payment",
                  style: titleStyle,
                ),
                const Gap(20)
              ],
            ),
            const Gap(40),
            Obx(
              () => RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Total - ",
                    style: TextStyle(
                        color: kSecondaryColor, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "${_pharmacyController.totalPrice.value} Ks",
                    style: const TextStyle(color: kFourthColor)),
              ])),
            ),
            const Gap(15),
            Obx(
              () => LoadingStateWidget(
                  loadingState: _paymentController.getLoadingState,
                  loadingSuccessWidget:
                      paymentList(context, _paymentController.payments),
                  loadingInitWidget: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.07,
                        bottom: MediaQuery.of(context).size.height * 0.07),
                    child: LoadFailWidget(
                      function: () {
                        _pharmacyController.callPharmacy();
                      },
                    ),
                  ),
                  paddingTop: MediaQuery.of(context).size.height * 0.07),
            ),
            const Gap(20),
            Obx(
              () => paymentTile(
                  context,
                  PaymentVO(
                      id: 0,
                      accountName: "Cash on Deli",
                      accountNumber: "",
                      type: "Cash on Deli",
                      url:
                          "https://www.shutterstock.com/image-vector/transparent-money-icon-png-vector-600nw-1946627578.jpg")),
            ),
            const Gap(30),
            Obx(() => _pharmacyController.selectedPayment.value?.accountName !=
                    "Cash on Deli"
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        _pharmacyController.showPictureDialog(context);
                      },
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                            border: Border.all(color: kFourthColor, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: _pharmacyController.imageFile.value == null
                            ? const Center(
                                child: Icon(Icons.add),
                              )
                            : ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Image.file(
                                  _pharmacyController.imageFile.value!,
                                  fit: BoxFit.contain,
                                )),
                      ),
                    ),
                  )
                : const SizedBox()),
            Obx(() => LoadingStateWidget(
                loadingState: _pharmacyController.getLoadingState,
                loadingSuccessWidget: CustomButton(
                  name: "Order",
                  function: () {
                    _pharmacyController.addOrder(context);
                  },
                ),
                loadingInitWidget: CustomButton(
                  name: "Order",
                  function: () {
                    _pharmacyController.addOrder(context);
                  },
                ),
                paddingTop: 0)),
            const Gap(50)
          ],
        ),
      ),
    ));
  }

  Widget paymentList(BuildContext context, List<PaymentVO> payments) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => paymentTile(context, payments[index]),
        separatorBuilder: (context, index) => const Gap(20),
        itemCount: payments.length);
  }

  Widget paymentTile(BuildContext context, PaymentVO payment) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _pharmacyController.selectedPayment.value = payment;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: _pharmacyController.selectedPayment.value?.accountName ==
                    payment.accountName
                ? Border.all(width: 2, color: kSecondaryColor)
                : Border.all(width: 1)),
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
}
