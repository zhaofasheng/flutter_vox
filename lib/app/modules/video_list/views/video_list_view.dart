import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vox_video/app/modules/video_list/views/video_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/video_list_controller.dart';

class VideoListView extends StatelessWidget {
  const VideoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VideoListController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('最新视频'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.videoList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          padding: const EdgeInsets.all(8),
          itemCount: controller.videoList.length,
          itemBuilder: (context, index) {
            final video = controller.videoList[index];
            return _buildVideoCard(video, controller);
          },
        );
      }),
    );
  }

  Widget _buildVideoCard(VideoModel video,VideoListController controller) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isVertical = video.screen == 2;
        final height = isVertical ? width * 4 / 3 : width * 3 / 4;

        return GestureDetector(
          onTap: (){
            final index = controller.videoList.indexOf(video);
            Get.toNamed(Routes.VIDEO_PLAYER_PAGE, arguments: {
              'list': controller.videoList,
              'index': index,
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Material(
              color: Colors.white,
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width,
                    height: height,
                    child: Image.network(
                      video.videoCoverUrl ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),

                  // 标题
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      video.title ?? '',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // 作者或标签
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      video.userInfo?.nickName ?? '',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
