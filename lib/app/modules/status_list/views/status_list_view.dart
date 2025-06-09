import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/status_list_controller.dart';

class StatusListView extends GetView<StatusListController> {
  const StatusListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatusListView'),
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
