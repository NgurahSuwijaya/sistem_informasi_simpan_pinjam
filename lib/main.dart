import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/core/interfaces/notification_repository_impl.dart';
import 'domain/entities/notification.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'infrastructure/theme/app_color.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('id_ID', null);

  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      RemoteNotification notification = message.notification!;
      // Menyimpan notifikasi ke database SQLite
      NotificationEntity newNotification = NotificationEntity(
        id: 0,
        notifTitle: notification.title!,
        notifContent: notification.body!,
        isReaded: false,
      );

      // ignore: unrelated_type_equality_checks

      final titleNotif = notification.title;

      // if (isNotificationOn) {

      Map<String, dynamic> data = message.data;
      print(data);
      String id = data['additionalData'];
      print(id);
      if (id != "") {
        print("aaaa");
        Get.dialog(CupertinoAlertDialog(
            title: Text(titleNotif!),
            content: Text("Lanjutkan ke menu kontrol penarikan simpanan"),
            actions: <Widget>[
              // CupertinoDialogAction(
              //   child: Text('Cancel'),
              //   onPressed: () {
              //     Get.back();
              //   },
              // ),
              CupertinoDialogAction(
                child: Text('Oke'),
                onPressed: () {
                  Get.back();
                  Get.toNamed("/kontrol-penarikan",
                      arguments: [notification.body, id]);
                },
              ),
            ]));
      } else {
        Get.dialog(CupertinoAlertDialog(
            title: Text(titleNotif!),
            content: Text(notification.body!),
            actions: <Widget>[
              // CupertinoDialogAction(
              //   child: Text('Cancel'),
              //   onPressed: () {
              //     Get.back();
              //   },
              // ),
              CupertinoDialogAction(
                child: Text('Oke'),
                onPressed: () {
                  Get.back();
                },
              ),
            ]));
      }
    }
  });
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: ThemeData(
        fontFamily: "Poppins",
        primaryColor: AppColor.green1,
        colorScheme: AppColor.kColorScheme,
      ),
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
