import 'package:sample_app_getx/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/routes/app_routes.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Get.toNamed(Routes.main);
      },
    );
  }
}
