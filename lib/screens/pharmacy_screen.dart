// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/pharmacy_controller.dart';
import 'package:dental_clinic_mobile/data/pharmacy_vo.dart';
import 'package:dental_clinic_mobile/screens/order_screen.dart';
import 'package:dental_clinic_mobile/widgets/button_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

final _pharmacyController = Get.put(PharmacyController());

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

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
                  "Buy Pharmacy",
                  style: titleStyle,
                ),
                const Gap(20)
              ],
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                item(
                  context,
                  "Search",
                  Icons.search,
                  () {},
                ),
                item(
                  context,
                  "Order history",
                  Icons.history,
                  () => Get.to(() => const OrderScreen()),
                )
              ],
            ),
            const Gap(30),
            const PharmacyList(),
            const Gap(25),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Cart",
                    style: titleStyle,
                  ),
                  const Gap(20),
                  Obx(() => _pharmacyController.cartList.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SizedBox(
                              width: 250,
                              height: 220,
                              child: Lottie.asset(
                                  "assets/animations/empty_cart.json",
                                  fit: BoxFit.fill)),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => const SizedBox(),
                          separatorBuilder: (context, index) => const Gap(20),
                          itemCount: _pharmacyController.cartList.length))
                ],
              ),
            )),
            const Gap(20),
            Obx(() => _pharmacyController.cartList.isEmpty
                ? const SizedBox()
                : CustomButton(
                    name: "Order",
                    function: () {},
                  ))
          ],
        ),
      ),
    ));
  }

  Widget item(
      BuildContext context, String name, IconData icon, VoidCallback function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 3, // Spread radius
            blurRadius: 4, // Blur radius
            offset: const Offset(0, 3), // Offset of the shadow
          ),
        ], borderRadius: BorderRadius.circular(20), color: kBtnGrayColor),
        child: Row(
          children: [Icon(icon), const Gap(10), Text(name)],
        ),
      ),
    );
  }
}

class PharmacyList extends StatelessWidget {
  const PharmacyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 25,
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {},
            child: PharmacyCard(
                pharmacy: PharmacyVO(
                    id: 1,
                    url:
                        "https://medsgo.ph/images/detailed/35/Biogesic_43iz-v8_18kn-2w.png",
                    name: "Biogesic 500mg",
                    price: 1500.0))),
        itemCount: 5,
      ),
    );
  }
}

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({super.key, required this.pharmacy});

  final PharmacyVO pharmacy;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 180,
      decoration: BoxDecoration(
        color: kBtnGrayColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 3, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 3), // Offset of the shadow
          ),
        ], //border corner radius
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(width: 0.3),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: CachedNetworkImage(
                    imageUrl: pharmacy.url,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const LoadingWidget(),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error),
                    ),
                  )),
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
                  TextSpan(
                      text: pharmacy.name,
                      style: const TextStyle(color: kFourthColor)),
                ])),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 70,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: pharmacy.price.toString(),
                            style: const TextStyle(color: kFourthColor)),
                        const TextSpan(
                            text: "Ks", style: TextStyle(color: kFourthColor)),
                      ])),
                    ],
                  ),
                ),
              ),
              const Icon(Icons.add)
            ],
          ),
        ],
      ),
    );
  }
}
