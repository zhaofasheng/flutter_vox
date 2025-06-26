import 'package:get/get.dart';

import '../modules/course_list/bindings/course_list_binding.dart';
import '../modules/course_list/views/course_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_view/bindings/login_view_binding.dart';
import '../modules/login_view/views/login_view_view.dart';
import '../modules/order_list_view/bindings/order_list_view_binding.dart';
import '../modules/order_list_view/views/order_list_view_view.dart';
import '../modules/series_detail_view/bindings/series_detail_view_binding.dart';
import '../modules/series_detail_view/views/series_detail_view_view.dart';
import '../modules/status_list/bindings/status_list_binding.dart';
import '../modules/status_list/views/status_list_view.dart';
import '../modules/tabbar_view/bindings/tabbar_view_binding.dart';
import '../modules/tabbar_view/views/tabbar_view_view.dart';
import '../modules/video_list/bindings/video_list_binding.dart';
import '../modules/video_list/views/video_list_view.dart';
import '../modules/video_player_page/bindings/video_player_page_binding.dart';
import '../modules/video_player_page/views/video_player_page_view.dart';

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
    GetPage(
      name: _Paths.VIDEO_PLAYER_PAGE,
      page: () => const VideoPlayerPageView(),
      binding: VideoPlayerPageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_VIEW,
      page: () => const LoginViewView(),
      binding: LoginViewBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_LIST_VIEW,
      page: () => const OrderListViewView(),
      binding: OrderListViewBinding(),
    ),
    GetPage(
      name: _Paths.SERIES_DETAIL_VIEW,
      page: () => SeriesDetailViewView(),
      binding: SeriesDetailViewBinding(),
    ),
  ];
}
