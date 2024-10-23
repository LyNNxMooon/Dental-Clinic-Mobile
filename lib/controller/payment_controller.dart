import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/data/payment_vo.dart';
import 'package:dental_clinic_mobile/firebase/firebase.dart';
import 'package:dental_clinic_mobile/utils/enums.dart';
import 'package:get/get.dart';

class PaymentController extends BaseController {
  final _firebaseService = FirebaseServices();

  RxList<PaymentVO> payments = <PaymentVO>[].obs;

  @override
  void onInit() {
    callPayments();
    super.onInit();
  }

  callPayments() async {
    setLoadingState = LoadingState.loading;
    _firebaseService.getPaymentListStream().listen(
      (event) {
        if (event == null || event.isEmpty) {
          setLoadingState = LoadingState.error;
        } else {
          payments.value = event;
          setLoadingState = LoadingState.complete;
        }
      },
    ).onError((error) {
      setLoadingState = LoadingState.error;
    });

    update();
  }
}
