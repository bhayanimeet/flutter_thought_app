import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalPushNotificationHelper {
  LocalPushNotificationHelper._();

  static final LocalPushNotificationHelper localPushNotificationHelper =
  LocalPushNotificationHelper._();

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initializeLocalPushNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
    const AndroidInitializationSettings('mipmap/ic_launcher');
    DarwinInitializationSettings darwinInitializationSettings =
    const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showSimpleNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
      'Thought',
      'Your thought added...',
      priority: Priority.max,
      importance: Importance.max,
    );
    DarwinNotificationDetails darwinNotificationDetails =
    const DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Thought',
      'Your thought added...',
      notificationDetails,
      payload: "Simple notification payload...",
    );
  }
}
