import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/video_player_page_controller.dart';
class VideoPlayerPageView extends GetView<VideoPlayerPageController> {
  const VideoPlayerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        return PageView.builder(
          controller: controller.pageController,
          scrollDirection: Axis.vertical,
          onPageChanged: controller.onPageChanged,
          itemCount: controller.videos.length,
          itemBuilder: (context, index) {
            final video = controller.videos[index];
            final isCurrent = controller.currentIndex.value == index;

            return GestureDetector(
              onTap: controller.togglePlayPause,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 🎯 只在当前页面 且视频未初始化时显示封面
                  if (!isCurrent ||
                      controller.videoController.value?.value.isInitialized != true)
                    Positioned.fill(
                      child: Image.network(
                        video.videoCoverUrl ?? '',
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Center(
                          child: Icon(Icons.broken_image, color: Colors.white),
                        ),
                      ),
                    ),

                  // 🎥 当前页面的视频播放器
                  if (isCurrent)
                    Obx(() {
                      final videoCtrl = controller.videoController.value;
                      final isInitialized = videoCtrl?.value.isInitialized == true;

                      if (!isInitialized) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return AspectRatio(
                        aspectRatio: videoCtrl!.value.aspectRatio,
                        child: VideoPlayer(videoCtrl),
                      );
                    }),

                  // ▶️ 当前页视频已初始化且未播放时显示播放按钮
                  if (isCurrent &&
                      controller.videoController.value?.value.isInitialized == true &&
                      controller.videoController.value?.value.isPlaying == false)
                    const Icon(Icons.play_arrow, color: Colors.white, size: 60),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}