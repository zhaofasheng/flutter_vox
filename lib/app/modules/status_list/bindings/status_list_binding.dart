import 'package:get/get.dart';

import '../controllers/status_list_controller.dart';

class StatusListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusListController>(
      () => StatusListController(),
    );
  }
}
