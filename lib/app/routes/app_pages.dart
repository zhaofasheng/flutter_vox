import 'package:get/get.dart';

import '../modules/course_list/bindings/course_list_binding.dart';
import '../modules/course_list/views/course_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/status_list/bindings/status_list_binding.dart';
import '../modules/status_list/views/status_list_view.dart';
import '../modules/tabbar_view/bindings/tabbar_view_binding.dart';
import '../modules/tabbar_view/views/tabbar_view_view.dart';
import '../modules/video_list/bindings/video_list_binding.dart';
import '../modules/video_list/views/video_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TABBAR_VIEW,
      page: () => TabbarViewView(),
      binding: TabbarViewBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_LIST,
      page: () => const VideoListView(),
      binding: VideoListBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_LIST,
      page: () => const CourseListView(),
      binding: CourseListBinding(),
    ),
    GetPage(
      name: _Paths.STATUS_LIST,
      page: () => const StatusListView(),
      binding: StatusListBinding(),
    ),
  ];
}
