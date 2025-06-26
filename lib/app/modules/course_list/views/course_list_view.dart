import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'package:get/get.dart';

import 'pay_video_cell.dart';
import '../controllers/course_list_controller.dart';

class CourseListView extends GetView<CourseListController> {
  const CourseListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('课程'),
        backgroundColor: HexColor('#F7F8FC'),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
      ),
      body:Obx((){
        final orders = controller.seriesList;
        if(orders.isEmpty){
          return const Center(child: Text('暂无课程'));
        }

        return ListView.builder(
            itemBuilder: (context,index){
              final series = controller.seriesList[index];
              return PayVideoCell(model: series);
            },
            itemCount: controller.seriesList.length
        );
      }),
    );
  }
}
