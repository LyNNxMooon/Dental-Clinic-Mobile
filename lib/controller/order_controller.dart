import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/data/order_vo.dart';
import 'package:dental_clinic_mobile/firebase/firebase.dart';
import 'package:dental_clinic_mobile/utils/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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
}
