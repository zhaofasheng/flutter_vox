import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vox_video/app/modules/course_list/views/course_list_view.dart';
import 'package:vox_video/app/modules/home/views/home_view.dart';
import 'package:vox_video/app/modules/status_list/views/status_list_view.dart';
import 'package:vox_video/app/modules/video_list/views/video_list_view.dart';
import '../../course_list/controllers/course_list_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../status_list/controllers/status_list_controller.dart';
import '../../video_list/controllers/video_list_controller.dart';
import '../controllers/tabbar_view_controller.dart';

class TabbarViewView extends GetView<TabbarViewController> {
  TabbarViewView({super.key}) {
    Get.put(VideoListController());
    Get.put(CourseListController());
    Get.put(StatusListController());
    Get.put(HomeController());
  }

  final List<Widget> _pages = [
    const VideoListView(),
    const CourseListView(),
    const StatusListView(),
    const HomeView(),
  ];

  final List<String> _titles = ['视频', '课程', '咨询', '我的'];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: _pages,
          ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: SafeArea(
            child: SizedBox(
              height: kBottomNavigationBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_titles.length, (index) {
                  final isSelected = controller.selectedIndex.value == index;
                  return Expanded(child: GestureDetector(
                    onTap: () => controller.changeTab(index),
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _titles[index],
                          style: TextStyle(
                            color: isSelected ? Colors.blue : Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          height: 2,
                          width: 20,
                          color: isSelected ? Colors.blue : Colors.transparent,
                        ),
                      ],
                    ),
                  ));
                }),
              ),
            ),
          ),
        ),
      );
    });
  }
}


