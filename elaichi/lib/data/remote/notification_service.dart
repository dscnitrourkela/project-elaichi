import 'dart:convert';

import 'package:elaichi/presentation/core/router/remote_routing.dart';
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

  Future<String?> get token => _instance.getToken();

  Future<bool> setupNotifications() async {
    await _instance.requestPermission();
    await _instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await _createHighPriorityChannel();

    final initialMessage = await _instance.getInitialMessage();

    if (initialMessage != null) {
      final payload = initialMessage.data;
      await RemoteRouting().navigate(payload);
    }
    return true;
  }

  // Future<void> backgroundHandler(RemoteMessage message) async {
  //   FirebaseMessaging.onBackgroundMessage((message) async {
  //     await RemoteRouting().navigate(message.data);
  //   });
  // }

  Future<void> _createHighPriorityChannel() async {
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
      if (notification != null && android != null) {
        _flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
            ),
          ),
          payload: json.encode(message.data),
        );
      }
    });
  }
}
