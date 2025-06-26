import 'package:get/get.dart';

import '../../Untils/app_http_client.dart';
import '../views/order_model.dart';

class OrderListViewController extends GetxController {
  final RxList<OrderModel> orderList = <OrderModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadList(1);
  }

  Future<void> loadList(int pageNo) async {
    final client = AppHttpClient();

    try {
      final response = await client.get(
        'series/order/list',
        queryParameters: {'pageNo': pageNo,'payStatus':'0'},
        accept: 'application/vnd.shengxi.v5.8.5+json',
      );

      if (response.statusCode == 200) {
        final list = response.data['data'] as List;
        final lists = list.map((e) => OrderModel.fromJson(e)).toList();
        orderList.assignAll(lists);
      } else {
        Get.snackbar('错误', '请求失败：${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('异常', '请求异常：$e');
    }
  }
}
