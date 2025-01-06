import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:pizza/navigation_menu.dart';

class FirebaseApi {
  //create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //fucntion to initialize notifpications
  Future<void> initNotification() async {
    //request permission for notification
    await _firebaseMessaging.requestPermission();

    // fetch FCM token
    final fCMToken = await _firebaseMessaging.getToken();
    log('Token: $fCMToken');

    initPushNotification();
  }

  //function to handle received messages
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    Get.offAll(() => const NavigaitionMenu());
  }

  //fucntion to initialize foreground and background settings
  Future initPushNotification() async {
    //handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    //attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
