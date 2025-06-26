import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'package:get/get.dart';
import 'package:vox_video/app/modules/course_list/views/series_detail_model.dart';
import 'package:vox_video/app/modules/series_detail_view/views/series_header_view.dart';

import '../controllers/series_detail_view_controller.dart';

class SeriesDetailViewView extends GetView<SeriesDetailViewController> {

  SeriesDetailViewView({super.key})
      : seriesDetailModel = Get.arguments;

  final SeriesDetailModel seriesDetailModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F7F8FC'),
      appBar: AppBar(
        backgroundColor: HexColor('#F7F8FC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SeriesHeaderView(seriesDetailModel: seriesDetailModel),
          ],
        ),
      ),
    );
  }
}
