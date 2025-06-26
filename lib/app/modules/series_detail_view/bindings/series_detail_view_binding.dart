import 'package:get/get.dart';

import '../controllers/series_detail_view_controller.dart';

class SeriesDetailViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeriesDetailViewController>(
      () => SeriesDetailViewController(),
    );
  }
}
