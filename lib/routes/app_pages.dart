import 'package:get/get.dart';
import 'package:sample_app_getx/bindings/add_card_bindings.dart';
import 'package:sample_app_getx/bindings/edit_card_bindings.dart';
import 'package:sample_app_getx/bindings/main_bindings.dart';
import 'package:sample_app_getx/bindings/splash_bindings.dart';
import 'package:sample_app_getx/routes/app_routes.dart';
import 'package:sample_app_getx/ui/internet_connection/internet_connection_page.dart';
import 'package:sample_app_getx/ui/main/home/add_card/add_card_page.dart';
import 'package:sample_app_getx/ui/main/home/edit_page/edit_page.dart';
import 'package:sample_app_getx/ui/main/main/main_page.dart';
import 'package:sample_app_getx/ui/splash/splash_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      binding: MainBindings(),
    ),
    GetPage(
      name: Routes.addCard,
      page: () => const AddCardPage(),
      binding: AddCardBindings(),
    ),
    GetPage(
      name: Routes.editCard,
      page: () => const EditCardPage(),
      binding: EditCardBindings(),
    ),
    GetPage(
      name: Routes.internetConnection,
      page: () => const InternetConnectionPage(),
    ),
  ];
}
