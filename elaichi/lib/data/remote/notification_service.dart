import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  factory NotificationService() => _notificationService;
  NotificationService._privateConstructor();

  static final NotificationService _notificationService =
      NotificationService._privateConstructor();

  static final FirebaseMessaging _instance = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  ///Fetch the `RemoteMessaage` that was used to open the app.
  Future<RemoteMessage?> get initialMessage async {
    return _instance.getInitialMessage();
  }

  Future<bool> setupNotifications() async {
    await _instance.requestPermission();
    await _instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
    await _createHighPriorityChannel();
    return true;
  }

  Future<void> _createHighPriorityChannel() async {
    await _flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('notification_icon'),
      ),
    );
    const channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null &&
          android != null &&
          message.data['priority'] == 'High') {
        _flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
            ),
          ),
          payload: json.encode(message.data),
        );
      }
    });
  }

  void notificationRedirect(String? payload) {
    final data = json.decode(payload!) as Map<String, dynamic>;

    // RemoteRouting().navigate(data);
  }

  ///Removes FCM token
  Future<void> deleteToken() {
    return _instance.deleteToken();
  }
}
