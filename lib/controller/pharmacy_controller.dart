import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/data/pharmacy_vo.dart';
import 'package:get/get.dart';

class PharmacyController extends BaseController {
  RxList<PharmacyVO> cartList = <PharmacyVO>[].obs;
}
