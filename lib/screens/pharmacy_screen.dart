// ignore_for_file: deprecated_member_use, avoid_print

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/pharmacy_controller.dart';
import 'package:dental_clinic_mobile/data/pharmacy_vo.dart';
import 'package:dental_clinic_mobile/screens/order_screen.dart';
import 'package:dental_clinic_mobile/screens/place_order_screen.dart';
import 'package:dental_clinic_mobile/screens/search_pharmacy_screen.dart';
import 'package:dental_clinic_mobile/widgets/button_widget.dart';
import 'package:dental_clinic_mobile/widgets/load_fail_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

final _pharmacyController = Get.put(PharmacyController());

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({super.key});

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      getCarts();
    });
  }

  void getCarts() {
    setState(() {
      print("--Updated--");
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
                  () {
                    Get.to(() => const SearchPharmacyScreen());
                  },
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
            Obx(
              () => LoadingStateWidget(
                  loadingState: _pharmacyController.getLoadingState,
                  loadingSuccessWidget: SizedBox(
                    height: 200,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 25,
                      ),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            if (_pharmacyController
                                    .pharmacies[index].isOutOfStock ==
                                "InStock") {
                              setState(() {
                                _pharmacyController.addItemToCart(
                                    _pharmacyController.pharmacies[index].name,
                                    _pharmacyController.pharmacies[index].url,
                                    _pharmacyController
                                        .pharmacies[index].price);
                              });
                            }
                          },
                          child: PharmacyCard(
                              pharmacy: _pharmacyController.pharmacies[index])),
                      itemCount: _pharmacyController.pharmacies.length,
                    ),
                  ),
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
                  paddingTop: 0),
            ),
            const Gap(25),
            SingleChildScrollView(
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
                          itemBuilder: (context, index) =>
                              cartItemTile(context, index),
                          separatorBuilder: (context, index) => const Gap(20),
                          itemCount: _pharmacyController.cartList.length))
                ],
              ),
            ),
            const Gap(20),
            Obx(() => _pharmacyController.cartList.isEmpty
                ? const SizedBox()
                : CustomButton(
                    name: "Order",
                    function: () {
                      _pharmacyController.calculateTotalPrice();
                      Get.to(() => const PlaceOrderScreen());
                    })),
            const Gap(30),
          ],
        ),
      ),
    ));
  }

  Widget cartItemTile(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 70,
      decoration: BoxDecoration(
        color: kBtnGrayColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 3, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 3), // Offset of the shadow
          ),
        ], //border corner radius
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 0.3),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: _pharmacyController.cartList[index].url,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const LoadingWidget(),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      ),
                    )),
              ),
              const Gap(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 70,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(_pharmacyController.cartList[index].name),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 70,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                              "${_pharmacyController.cartList[index].price} Ks"),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_pharmacyController.cartList[index].qty > 1) {
                        --_pharmacyController.cartList[index].qty;
                        _pharmacyController.cartList[index].price =
                            _pharmacyController.cartList[index].price -
                                _pharmacyController.cartList[index].initPrice;
                      }
                    });
                  },
                  child: const Icon(CupertinoIcons.minus_circle)),
              const Gap(10),
              Text(_pharmacyController.cartList[index].qty.toString()),
              const Gap(10),
              GestureDetector(
                  onTap: () => _pharmacyController.cartList
                      .remove(_pharmacyController.cartList[index]),
                  child: const Icon(Icons.delete_outline_outlined)),
            ],
          )
        ],
      ),
    );
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
              pharmacy.isOutOfStock == "InStock"
                  ? const Icon(Icons.add)
                  : const Text(
                      "(Out of Stock)",
                      style: TextStyle(color: kErrorColor, fontSize: 9),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
