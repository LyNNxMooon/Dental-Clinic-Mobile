import 'package:dental_clinic_mobile/controller/auth_controller.dart';
import 'package:dental_clinic_mobile/service/notification_scheduler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FcmService {
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  final _authController = Get.put(AuthController());

  void init() async {
    firebaseMessaging.requestPermission(sound: true, badge: true, alert: true);

    //Generate device token
    firebaseMessaging.getToken().then((value) {
      debugPrint("FcmToken ======> $value");
      _authController.fcmToken.value = value ?? "";
    });

    //foreground notification
    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      print(event.data);
      await showNotification(event.data);
    });

    //background and terminate notification
    FirebaseMessaging.onBackgroundMessage(onBackgroundNotification);
  }

  static Future<void> showNotification(Map<String, dynamic> data) async {
    NotificationScheduler().displayNotification(
        data['title'], data['description'], data['payload'], data['image']);
  }

  static Future<void> onBackgroundNotification(RemoteMessage message) async {
    print(message.data);
    await showNotification(message.data);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("notification", message.data['payload']);
  }
}
