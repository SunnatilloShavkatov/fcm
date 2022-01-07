import 'package:fcm/core/notifications_service.dart';
import 'package:fcm/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  var storage = GetStorage();
  await NotificationsService.getInstance.initialize();
  if (!storage.hasData('fcmToken')) {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    storage.write('fcmToken', fcmToken);
  }
  print(storage.read('fcmToken'));
  runApp(const MyRoot());
}

class MyRoot extends StatelessWidget {
  const MyRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
