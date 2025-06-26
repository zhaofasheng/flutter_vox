import 'package:get/get.dart';

import '../../Untils/app_http_client.dart';
import '../views/series_detail_model.dart';

class CourseListController extends GetxController {
  final RxList<SeriesDetailModel> seriesList = <SeriesDetailModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadList(1);
  }

  Future<void> loadList(int pageNo) async {
    final client = AppHttpClient();

    try {
      final response = await client.get(
        'video/series/list',
        queryParameters: {'pageNo': pageNo,'isLogined':'1'},
        accept: 'application/vnd.shengxi.v5.8.0+json',
      );

      if (response.statusCode == 200) {
        final list = response.data['data'] as List;
        final lists = list.map((e) => SeriesDetailModel.fromJson(e)).toList();
        seriesList.assignAll(lists);
      } else {
        Get.snackbar('错误', '请求失败：${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('异常', '请求异常：$e');
    }
  }
}
