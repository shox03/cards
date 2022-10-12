import 'package:get/get.dart';
import 'package:sample_app_getx/controller/splash/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
