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

  flutterLocalNotificationsPlugin.show(
    message.hashCode,
    message.data['title'],
    message.data['body'],
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
      iOS: IOSNotificationDetails(
        presentSound: true,
        presentAlert: true,
        presentBadge: true,
        subtitle: message.data['title'],
        sound: 'default',
      ),
    ),
  );
}

final AndroidNotificationChannel androidChannel = AndroidNotificationChannel(
  'vacancy_channel', // id
  'Application received', // title
  description:
      'THis channel is used for showing notifications about applications',
  importance: Importance.max,
);

class NotificationsService {
  NotificationsService._();

  static NotificationsService _instance = NotificationsService._();

  static NotificationsService get getInstance => _instance;

  Future<void> initialize() async {
    await Firebase.initializeApp();
    if (Platform.isIOS)
      await FirebaseMessaging.instance.requestPermission(
        announcement: true,
        provisional: false,
      );

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    AndroidInitializationSettings androidNotificationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidNotificationSettings,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) {
        print(payload ?? '' + 'eee');
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

    await FirebaseMessaging.onMessage.listen(
      (remoteMessage) {
        RemoteNotification? notification = remoteMessage.notification ?? null;
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
            iOS: IOSNotificationDetails(
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
