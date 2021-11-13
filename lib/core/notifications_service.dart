import 'dart:io';

import 'package:fcm/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Firebase.apps.isEmpty) await Firebase.initializeApp();
  RemoteNotification? notification = message.notification;

  flutterLocalNotificationsPlugin.show(
    message.hashCode,
    notification?.title,
    notification?.body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        androidChannel.id,
        androidChannel.name,
        channelDescription: androidChannel.description,
        icon: '@mipmap/ic_launcher',
        playSound: true,
        importance: Importance.max,
        priority: Priority.max,
      ),
      iOS: const IOSNotificationDetails(
        presentSound: true,
        presentAlert: true,
        presentBadge: true,
        sound: 'default',
      ),
    ),
    payload: message.data['screen'],
  );
}

const AndroidNotificationChannel androidChannel = AndroidNotificationChannel(
  'fcm', // id
  'Application received', // title
  description:
      'THis channel is used for showing notifications about applications',
  importance: Importance.max,
);

class NotificationsService {
  NotificationsService._();

  static final NotificationsService _instance = NotificationsService._();

  static NotificationsService get getInstance => _instance;

  Future<void> initialize() async {
    await Firebase.initializeApp();
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission(
        announcement: true,
        provisional: false,
      );
    }

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    AndroidInitializationSettings androidNotificationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidNotificationSettings,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) {
        if (payload == '/ui') {
          Get.toNamed(Routes.UI);
        }
      },
    );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen(
      (remoteMessage) {
        RemoteNotification? notification = remoteMessage.notification;
        flutterLocalNotificationsPlugin.show(
          0,
          notification?.title,
          notification?.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              androidChannel.id,
              androidChannel.name,
              channelDescription: androidChannel.description,
              icon: '@mipmap/ic_launcher',
              priority: Priority.max,
              importance: Importance.max,
              playSound: true,
            ),
            iOS: const IOSNotificationDetails(
              presentSound: true,
              presentAlert: true,
              presentBadge: true,
              sound: 'default',
            ),
          ),
          payload: remoteMessage.data['screen'],
        );
      },
    );
  }
}
