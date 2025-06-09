import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_list_controller.dart';

class VideoListView extends StatelessWidget {
  const VideoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoListController>(
      init: VideoListController(), // 绑定控制器，onInit 会自动调用
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('VideoListView'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text(
              'VideoListView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
