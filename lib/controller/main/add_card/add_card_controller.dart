import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:get/get.dart';

class AddCardController extends BaseController
    with SingleGetTickerProviderMixin {
  LocalSource _localSource = LocalSource.getInstance();

  int _index = 0;

  @override
  void onInit() async {
    update();
    super.onInit();
  }

  void setIndex(int i) {
    _index = i;
    update();
  }

  int get index => _index;
}
