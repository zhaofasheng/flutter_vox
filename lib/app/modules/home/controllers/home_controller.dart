import 'package:get/get.dart';
import 'package:vox_video/app/modules/Untils/user_storage_service.dart';

import '../../Untils/app_http_client.dart';

class HomeController extends GetxController {

  Future<void> outLogin() async {
    print('哈哈1');
    final client = AppHttpClient();
    try {
      final response = await client.get(
        'logout',
        accept: 'application/vnd.shengxi.v5.5.2+json',
      );

      if (response.statusCode == 200) {
        UserStorageService.clearUserInfo();
      } else {
        Get.snackbar('错误', '请求失败：${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('异常', '请求异常：$e');
    }
  }
}
