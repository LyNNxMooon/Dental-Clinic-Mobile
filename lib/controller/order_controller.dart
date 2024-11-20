// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/data/cart_item_vo.dart';
import 'package:dental_clinic_mobile/data/order_vo.dart';
import 'package:dental_clinic_mobile/firebase/firebase.dart';
import 'package:dental_clinic_mobile/utils/enums.dart';
import 'package:dental_clinic_mobile/widgets/error_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class OrderController extends BaseController {
  RxList<OrderVO> orderList = <OrderVO>[].obs;

  final _firebaseService = FirebaseServices();

  @override
  void onInit() {
    callOrders();
    super.onInit();
  }

  callOrders() async {
    String patientId = FirebaseAuth.instance.currentUser?.uid ?? "";
    setLoadingState = LoadingState.loading;
    _firebaseService.getOrderListStream(patientId).listen(
      (event) {
        if (event == null || event.isEmpty) {
          setLoadingState = LoadingState.error;
        } else {
          orderList.value = event;
          setLoadingState = LoadingState.complete;
        }
      },
    ).onError((error) {
      print(error);
      setLoadingState = LoadingState.error;
    });

    update();
  }

  Future updateOrder(
      BuildContext context,
      int id,
      List<CartItemVO> items,
      num totalPrice,
      String status,
      String payment,
      String url,
      String patientId,
      String patientName,
      int patientPhone,
      String patientAddress,
      num fees,
      String date,
      String rejectReason) async {
    setLoadingState = LoadingState.loading;

    final orderVo = OrderVO(
        orderRejectReason: rejectReason,
        deliveryFees: fees,
        date: date,
        id: id,
        items: items,
        totalPrice: totalPrice,
        orderStatus: status,
        payment: payment,
        slip: url,
        patientID: patientId,
        patientName: patientName,
        patientPhone: patientPhone,
        patientAddress: patientAddress);
    return _firebaseService.saveOrder(orderVo).then(
      (value) {
        setLoadingState = LoadingState.complete;

        callOrders();

        showToast("Your order has been updated!",
            position: const ToastPosition(align: Alignment.bottomCenter),
            backgroundColor: kSecondaryColor,
            textStyle: const TextStyle(color: kPrimaryColor));
      },
    ).catchError((error) {
      setLoadingState = LoadingState.error;
      setErrorMessage = error;
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomErrorWidget(
          errorMessage: getErrorMessage,
          function: () {
            Get.back();
          },
        ),
      );
    });
  }
}
