// ignore_for_file: avoid_print, use_build_context_synchronously, invalid_use_of_protected_member

import 'dart:io';

import 'package:dental_clinic_mobile/constants/colors.dart';
import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/controller/order_controller.dart';
import 'package:dental_clinic_mobile/data/cart_item_vo.dart';
import 'package:dental_clinic_mobile/data/order_vo.dart';
import 'package:dental_clinic_mobile/data/payment_vo.dart';
import 'package:dental_clinic_mobile/data/pharmacy_vo.dart';
import 'package:dental_clinic_mobile/firebase/firebase.dart';
import 'package:dental_clinic_mobile/utils/enums.dart';
import 'package:dental_clinic_mobile/utils/file_picker_utils.dart';
import 'package:dental_clinic_mobile/widgets/error_widget.dart';
import 'package:dental_clinic_mobile/widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PharmacyController extends BaseController {
  RxList<CartItemVO> cartList = <CartItemVO>[].obs;

  final _firebaseService = FirebaseServices();

  RxList<PharmacyVO> pharmacies = <PharmacyVO>[].obs;

  RxDouble totalPrice = 0.0.obs;

  void calculateTotalPrice() {
    totalPrice.value = 0.0;
    for (CartItemVO item in cartList) {
      totalPrice.value += item.price;
    }
  }

  addItemToCart(String name, String url, double initPrice) {
    CartItemVO item = CartItemVO(
        name: name, price: initPrice, qty: 1, url: url, initPrice: initPrice);

    print("----Triggered");

    bool isFound = false;
    int index = 0;

    for (CartItemVO citem in cartList) {
      if (item.url == citem.url) {
        isFound = true;
        index = cartList.indexOf(citem);
      } else {}
    }

    if (isFound) {
      cartList[index].price = cartList[index].price + initPrice;
      cartList[index].qty++;
    } else {
      cartList.add(item);
    }

    for (CartItemVO item in cartList) {
      print(item.name);
    }

    update();
  }

  Rxn<PaymentVO> selectedPayment = Rxn<PaymentVO>();

  final Rxn<File> imageFile = Rxn<File>();

  final _filePickerUtil = FilePickerUtil();

  final _authController = Get.put(AuthController());

  final _orderController = Get.put(OrderController());

  RxList<PharmacyVO> searchList = <PharmacyVO>[].obs;
  RxList<PharmacyVO> searchedPharmacy = <PharmacyVO>[].obs;

  callSearch(Function def) {
    _firebaseService.getSearchPharmacyStream().then((value) {
      searchList.value = value;
    });

    def;
    update();
  }

  @override
  void onInit() {
    callPharmacy();
    super.onInit();
  }

  showPictureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text(
          "Choose an option",
          style: TextStyle(
              color: kSecondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        children: [
          SimpleDialogOption(
            onPressed: () {
              _filePickerUtil.getImage(true).then(
                    (value) => imageFile.value = value,
                  );
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.camera, size: 30),
                Gap(10),
                Text(
                  "Open Camera",
                )
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              _filePickerUtil.getImage(false).then(
                    (value) => imageFile.value = value,
                  );
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.photo_rounded, size: 30),
                Gap(10),
                Text(
                  "Choose From Gallery",
                )
              ],
            ),
          ),
        ],
      ),
    );

    update();
  }

  callPharmacy() async {
    setLoadingState = LoadingState.loading;
    _firebaseService.getPharmacyListStream().listen(
      (event) {
        if (event == null || event.isEmpty) {
          setLoadingState = LoadingState.error;
        } else {
          pharmacies.value = event;
          setLoadingState = LoadingState.complete;
        }
      },
    ).onError((error) {
      setLoadingState = LoadingState.error;
    });

    update();
  }

  Future addOrder(BuildContext context) async {
    if (selectedPayment.value == null) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Select a payment";
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
    } else if (selectedPayment.value?.accountName != "Cash on Deli" &&
        imageFile.value == null) {
      setLoadingState = LoadingState.error;
      setErrorMessage = "Upload a payment slip to Order";
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
    } else {
      setLoadingState = LoadingState.loading;
      int id = DateTime.now().millisecondsSinceEpoch;

      String fileURL = "";

      if (selectedPayment.value?.accountName != "Cash on Deli") {
        fileURL = await _uploadFileToFirebaseStorage();
      }

      double totalPrice = 0;

      for (CartItemVO item in cartList) {
        totalPrice += item.price;
      }

      final orderVo = OrderVO(
          patientfcm: _authController.fcmToken.value,
          orderRejectReason: "",
          deliveryFees: 0,
          date: DateFormat('yMMMMd').format(DateTime.now()),
          id: id,
          items: cartList.value,
          totalPrice: totalPrice,
          orderStatus: "Pending",
          payment: selectedPayment.value?.type ?? "",
          slip: fileURL,
          patientID: _authController.currentUser.value?.id ?? "",
          patientName: _authController.currentUser.value?.name ?? "",
          patientPhone: _authController.currentUser.value?.phone ?? 0,
          patientAddress: _authController.currentUser.value?.address ?? "");
      return _firebaseService.saveOrder(orderVo).then(
        (value) {
          setLoadingState = LoadingState.complete;

          showDialog(
            context: context,
            builder: (context) =>
                const SuccessWidget(message: "Ordered Successfully!"),
          ).then(
            (value) => Get.back(),
          );

          imageFile.value = null;
          selectedPayment.value = null;
          cartList.clear();
          _orderController.callOrders();
        },
      ).catchError((error) {
        print(error);
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

    update();
  }

  Future _uploadFileToFirebaseStorage() {
    String path = 'image';
    String contentType = 'image/jpg';

    return FirebaseServices.uploadToFirebaseStorage(
        imageFile.value!, path, contentType);
  }
}
