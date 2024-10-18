import 'package:dental_clinic_mobile/persistent/hive_constant.dart';
import 'package:hive/hive.dart';

class HiveDao {
  HiveDao._();
  static final HiveDao _singleton = HiveDao._();
  factory HiveDao() => _singleton;

  Box<String> userPasswordBox() => Hive.box<String>(kHiveBoxForUserPassword);

  void saveUserPassword(String password) {
    userPasswordBox().put(kHiveKeyForUserPassword, password);
  }

  String? get getUserPassword => userPasswordBox().get(kHiveKeyForUserPassword);
}
