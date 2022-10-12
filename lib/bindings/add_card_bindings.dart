import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/add_card/add_card_controller.dart';

class AddCardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCardController(), fenix: true);

  }
}
