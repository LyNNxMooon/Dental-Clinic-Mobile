import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:shared_preferences/shared_preferences.dart';

class NotificationScheduler {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const kChannelID = "NotificationID";
  static const kChannelName = "NotificationName";
  static const kChannelDescription = "ChannelDescription";

  static final NotificationScheduler _scheduler =
      NotificationScheduler.internal();

  NotificationScheduler.internal() {
    init();
  }

  factory NotificationScheduler() => _scheduler;

  void init() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings("@drawable/ic_launcher");
    const initializationSettingsIos = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIos);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) async {
        SharedPreferences.getInstance().then((value) {
          value.setString("notification", "");
        });
      },
    );
  }

  Future displayNotification(
      String title, String body, String payload, String? imgURL) async {
    const iosNotificationDetails = DarwinNotificationDetails();
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        kChannelID, kChannelName,
        channelDescription: kChannelDescription,
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: (imgURL != null && (imgURL.isNotEmpty)
            ? null
            : const BigTextStyleInformation('')));
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);

    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: payload);
  }
}
