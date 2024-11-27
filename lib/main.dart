import 'package:dental_clinic_mobile/firebase_options.dart';
import 'package:dental_clinic_mobile/persistent/hive_constant.dart';
import 'package:dental_clinic_mobile/screens/splash_screen.dart';
import 'package:dental_clinic_mobile/service/fcm_service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  await Hive.openBox<String>(kHiveBoxForUserPassword);
  FcmService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Ubuntu"),
        home: const SplashPage(),
      ),
    );
  }
}
