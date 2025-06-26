import 'package:get/get.dart';

import '../controllers/order_list_view_controller.dart';

class OrderListViewBinding extends Bindings {
  @override
  void dependencies() {
    print("⚙️ Binding 被执行了");
    Get.lazyPut<OrderListViewController>(
      () => OrderListViewController(),
    );
  }
}
