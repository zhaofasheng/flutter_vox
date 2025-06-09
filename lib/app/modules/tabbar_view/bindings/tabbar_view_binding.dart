import 'package:get/get.dart';

import '../controllers/tabbar_view_controller.dart';

class TabbarViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabbarViewController>(
      () => TabbarViewController(),
    );
  }
}
