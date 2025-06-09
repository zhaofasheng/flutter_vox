import 'package:get/get.dart';
import '../../Untils/app_http_client.dart';
import '../views/video_model.dart';

class VideoListController extends GetxController {

  // 响应式视频列表
  final RxList<VideoModel> videoList = <VideoModel>[].obs;

  @override
  Future<void> onInit()async {
    super.onInit();
    loadVideoList(1);
  }

  /// 加载视频列表数据
  Future<void> loadVideoList(int pageNo) async {
    final client = AppHttpClient();

    try {
      final response = await client.get(
        'video/list',
        queryParameters: {'pageNo': pageNo},
        accept: 'application/vnd.shengxi.v5.8.0+json',
      );

      if (response.statusCode == 200) {
        final list = response.data['data'] as List;
        // 将 JSON 数据转换为 VideoModel 实例列表
        final videos = list.map((e) => VideoModel.fromJson(e)).toList();
        videoList.assignAll(videos); // 触发 Obx 响应
      } else {
        Get.snackbar('错误', '请求失败：${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('异常', '请求异常：$e');
    }
  }
}
