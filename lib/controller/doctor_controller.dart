import 'package:dental_clinic_mobile/controller/base_controller.dart';
import 'package:dental_clinic_mobile/data/doctor_vo.dart';
import 'package:dental_clinic_mobile/firebase/firebase.dart';
import 'package:dental_clinic_mobile/utils/enums.dart';
import 'package:get/get.dart';

class DoctorController extends BaseController {
  RxList<DoctorVO> doctorsList = <DoctorVO>[].obs;

  final _firebaseService = FirebaseServices();

  RxList<DoctorVO> searchList = <DoctorVO>[].obs;
  RxList<DoctorVO> searchedDoctors = <DoctorVO>[].obs;

  callSearch(Function def) {
    _firebaseService.getSearchDoctorsStream().then((value) {
      searchList.value = value;
    });

    def;
    update();
  }

  @override
  void onInit() {
    callDoctors();

    super.onInit();
  }

  callDoctors() async {
    setLoadingState = LoadingState.loading;
    _firebaseService.getDoctorListStream().listen(
      (event) {
        if (event == null || event.isEmpty) {
          setLoadingState = LoadingState.error;
        } else {
          doctorsList.value = event;
          setLoadingState = LoadingState.complete;
        }
      },
    ).onError((error) {
      setLoadingState = LoadingState.error;
    });

    update();
  }
}
