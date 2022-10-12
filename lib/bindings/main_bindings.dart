import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/controller/main/main_controller.dart';
import 'package:sample_app_getx/data/provider/api_client.dart';
import 'package:sample_app_getx/data/repository/home/home_repository.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
  }
}
