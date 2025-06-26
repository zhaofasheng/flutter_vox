import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../video_list/views/video_model.dart';


class VideoPlayerPageController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final Rx<VideoPlayerController?> videoController = Rx<VideoPlayerController?>(null);

  late PageController pageController;
  late List<VideoModel> videos;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments as Map<String, dynamic>?;

    videos = args?['list'] as List<VideoModel>? ?? [];
    final index = args?['index'] as int? ?? 0;

    currentIndex.value = index;
    pageController = PageController(initialPage: index);

    if (videos.isNotEmpty && (videos[index].videoUrl?.isNotEmpty ?? false)) {
      initializeVideo(videos[index].videoUrl!);
    }
  }

  Future<void> initializeVideo(String url) async {
    await videoController.value?.pause();
    await videoController.value?.dispose();

    final controller = VideoPlayerController.networkUrl(Uri.parse(url));
    await controller.initialize();
    controller.setLooping(true);
    await controller.play();

    videoController.value = controller;
  }

  void togglePlayPause() {
    final ctrl = videoController.value;
    if (ctrl == null) return;

    ctrl.value.isPlaying ? ctrl.pause() : ctrl.play();
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
    if (videos.isNotEmpty && (videos[index].videoUrl?.isNotEmpty ?? false)) {
      initializeVideo(videos[index].videoUrl!);
    }
  }

  @override
  void onClose() {
    videoController.value?.dispose();
    pageController.dispose();
    super.onClose();
  }
}
