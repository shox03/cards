import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/edit_page/edit_page_controller.dart';

class EditCardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditCardController(), fenix: true);

  }
}
