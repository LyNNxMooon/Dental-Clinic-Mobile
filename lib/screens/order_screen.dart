// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/constants/text.dart';
import 'package:dental_clinic_mobile/controller/order_controller.dart';
import 'package:dental_clinic_mobile/data/order_vo.dart';
import 'package:dental_clinic_mobile/widgets/load_fail_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_state_widget.dart';
import 'package:dental_clinic_mobile/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

final _orderController = Get.put(OrderController());

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Map<int, bool> isDropMap = {};
  bool isCompleted = false;

  @override
  void initState() {
    _orderController.filterOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const Gap(25),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios)),
                  Text(
                    _orderController.date.value,
                    style: titleStyle,
                  ),
                  IconButton(
                      onPressed: () =>
                          _orderController.getOrdersOnSelectedDate(context),
                      icon: const Icon(Icons.date_range)),
                ],
              ),
            ),
            const Gap(30),
            Obx(
              () => _orderController.filteredOrdersByDate.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.35),
                      child: const Center(
                        child: Text(
                          "No orders on this date!",
                          style: titleStyle,
                        ),
                      ),
                    )
                  : LoadingStateWidget(
                      loadingState: _orderController.getLoadingState,
                      loadingSuccessWidget: orderList(
                          context, _orderController.filteredOrdersByDate),
                      loadingInitWidget: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.35,
                            bottom: MediaQuery.of(context).size.height * 0.0),
                        child: LoadFailWidget(
                          function: () {
                            _orderController.callOrders();
                          },
                        ),
                      ),
                      paddingTop: MediaQuery.of(context).size.height * 0.35),
            ),
            const Gap(20),
          ],
        ),
      ),
    ));
  }

  Widget orderList(BuildContext context, List<OrderVO> orders) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) =>
            orderTile(context, orders[index], index),
        separatorBuilder: (context, index) => const Gap(20),
        itemCount: orders.length);
  }

  Widget orderTile(BuildContext context, OrderVO order, int index) {
    bool isExpanded = isDropMap[index] ?? false;
    return GestureDetector(
      onTap: () => setState(() {
        isDropMap[index] = !isExpanded;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(order.date),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "/ Total - ",
                          style: TextStyle(color: kFourthColor)),
                      TextSpan(
                          text: order.totalPrice.toString(),
                          style: const TextStyle(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold)),
                      const TextSpan(
                          text: " Ks",
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold)),
                    ])),
                  ],
                ),
                isExpanded
                    ? const Icon(Icons.arrow_drop_up)
                    : const Icon(Icons.arrow_drop_down)
              ],
            ),
            !isExpanded
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(15),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "Order Status - ",
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: order.orderStatus,
                            style: TextStyle(
                                color: order.orderStatus == "Pending"
                                    ? kThirdColor
                                    : order.orderStatus == "Delivered"
                                        ? kFourthColor
                                        : order.orderStatus == "Rejected"
                                            ? kErrorColor
                                            : kSecondaryColor)),
                      ])),
                      const Gap(15),
                      Text(
                        order.orderStatus == "Pending"
                            ? "*Your order is being placed and preparing to deliver"
                            : order.orderStatus == "Delivered"
                                ? "*Your order has been delivered by the clinic and the deliver-man will contact to you."
                                : order.orderStatus == "Completed"
                                    ? "*Your order has been completed."
                                    : "*Your order has been rejected by admin for the following reason.",
                        style: TextStyle(
                            color: order.orderStatus == "Rejected"
                                ? kErrorColor
                                : kFourthColor),
                      ),
                      order.orderRejectReason.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: RichText(
                                  text: TextSpan(children: [
                                const TextSpan(
                                    text: "Order reject reason - ",
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: order.orderRejectReason,
                                    style: const TextStyle(color: kErrorColor)),
                              ])),
                            ),
                      order.orderStatus == "Delivered"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      activeColor: kSecondaryColor,
                                      value: isCompleted,
                                      onChanged: (value) {
                                        setState(() {
                                          isCompleted = !isCompleted;
                                        });
                                      },
                                    ),
                                    //const Gap(20),
                                    const Text(
                                      "Order Completed",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const Gap(5),
                                const Text(
                                  "*Select only when your order has completely arrived",
                                  style: TextStyle(color: kErrorColor),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const Gap(15),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "Payment Method - ",
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: order.payment,
                            style: const TextStyle(color: kFourthColor)),
                      ])),
                      const Gap(15),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "Order No. - ",
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: order.id.toString(),
                            style: const TextStyle(color: kThirdColor)),
                      ])),
                      const Gap(15),
                      order.slip.isEmpty
                          ? const SizedBox()
                          : Row(
                              children: [
                                const Text("Slip",
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontWeight: FontWeight.bold)),
                                const Gap(10),
                                TextButton(
                                    style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(60, 20)),
                                        backgroundColor:
                                            const WidgetStatePropertyAll(
                                                kSecondaryColor)),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: SizedBox(
                                            width: 100,
                                            height: 300,
                                            child: CachedNetworkImage(
                                              imageUrl: order.slip,
                                              fit: BoxFit.contain,
                                              placeholder: (context, url) =>
                                                  const LoadingWidget(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Center(
                                                child: Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "View",
                                      style: TextStyle(
                                          color: kFourthColor, fontSize: 10),
                                    ))
                              ],
                            ),
                      const Divider(
                        color: kThirdColor,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                      const Gap(15),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "${order.items[index].name} × ",
                                    style:
                                        const TextStyle(color: kFourthColor)),
                                TextSpan(
                                    text: order.items[index].qty.toString(),
                                    style: const TextStyle(
                                        color: kFourthColor,
                                        fontWeight: FontWeight.bold)),
                                const TextSpan(
                                    text: " - ",
                                    style: TextStyle(color: kFourthColor)),
                                TextSpan(
                                    text:
                                        "${order.items[index].price.toString()} Ks",
                                    style: const TextStyle(
                                        color: kSecondaryColor,
                                        fontWeight: FontWeight.bold)),
                              ])),
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount: order.items.length),
                      const Gap(15),
                      const Divider(
                        color: kThirdColor,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                      const Gap(15),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "Delivery Fees - ",
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "${order.deliveryFees.toString()} Ks",
                            style: const TextStyle(color: kFourthColor)),
                      ])),
                      const Gap(15),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "Total + Delivery - ",
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "${(order.totalPrice + order.deliveryFees).toString()} Ks",
                            style: const TextStyle(color: kFourthColor)),
                      ])),
                      order.orderStatus == "Delivered"
                          ? Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextButton(
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          kSecondaryColor)),
                                  onPressed: () {
                                    _orderController.updateOrder(
                                        context,
                                        order.id,
                                        order.items,
                                        order.totalPrice,
                                        isCompleted
                                            ? "Completed"
                                            : order.orderStatus,
                                        order.payment,
                                        order.slip,
                                        order.patientID,
                                        order.patientName,
                                        order.patientPhone,
                                        order.patientAddress,
                                        order.deliveryFees,
                                        order.date,
                                        order.orderRejectReason,
                                        order.patientfcm);
                                    setState(() {
                                      isDropMap[index] = !isExpanded;
                                      isCompleted = false;
                                    });
                                  },
                                  child: const Text(
                                    "Update",
                                    style: TextStyle(color: kPrimaryColor),
                                  )),
                            )
                          : const SizedBox()
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
