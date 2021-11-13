import 'package:fcm/ui/ui.dart';
import 'package:fcm/ui/main/home_page.dart';
import 'package:fcm/ui/splash/splash_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
    ),
    GetPage(
      name: Routes.UI,
      page: () => const UIPage(),
    ),
  ];
}
