import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/data/local_data_source/notification_local_data_source.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/notification_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/notification_usecase.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/utils/helpers/database_helper.dart';

import 'domain/core/interfaces/notification_repository_impl.dart';
import 'domain/entities/notification.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('id_ID', null);

  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  DatabaseHelper databaseHelper = DatabaseHelper();
  LocalNotificationDataSourceImpl localNotificationDataSource =
      LocalNotificationDataSourceImpl(databaseHelper);
  NotificationRepository notificationRepository =
      NotificationRepositoryImpl(localNotificationDataSource);
  NotificationUseCase notificationUseCase =
      NotificationUseCase(notificationRepository);

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

      final result =
          await notificationUseCase.onInsertNotification(newNotification);
      result.fold((l) => print(l.message), (r) => print('Berhasil'));
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final isNotificationOn =
          // preferences.getBool('isNotification')!
          true;
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
