import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationService {
  //firebase messaging
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  //initialize the local notification
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//take user permission for allow notification
  void takePermission() async {
    await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
  }

  //local notification

  //receive notification and response the notification
  static void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) {
    Get.toNamed(notificationResponse.payload!);
  }

  static Future<void> init() async {
    //define the initialize for android settings
    const AndroidInitializationSettings androidInitializeSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    //define tbe initialize for the ios settings
    const DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();

    //combine the initialize settings
    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: androidInitializeSettings,
            iOS: darwinInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse:
            onDidReceiveNotificationResponse,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

    //request for permission for android notification
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  //show notification
  static Future<void> showNotification(
      {required String title, required String body, String? payload}) async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            priority: Priority.high, importance: Importance.high),
        iOS: DarwinNotificationDetails());

    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  //get fcm token
  static Future<String?> getFcmToken() {
    return _firebaseMessaging.getToken();
  }

  //firebase push notification
  Future<void> initialize() async {
    FirebaseMessaging.onBackgroundMessage(_messageHandler);
    FirebaseMessaging.onMessage.listen(_messageHandler);
    RemoteMessage? message = await _firebaseMessaging.getInitialMessage();
    if (message != null) {
      _messageHandler(message);
    }
  }

  Future<void> _messageHandler(RemoteMessage remoteMessage) async {
    return showNotification(
        title: '${remoteMessage.notification!.title}',
        body: '${remoteMessage.notification!.body}',
        payload: remoteMessage.notification!.android!.clickAction!);
  }
}
