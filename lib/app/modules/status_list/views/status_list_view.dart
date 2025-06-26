import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'package:get/get.dart';

import '../controllers/status_list_controller.dart';

class StatusListView extends GetView<StatusListController> {
  const StatusListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('咨询'),
        backgroundColor: HexColor('#F7F8FC'),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StatusListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
