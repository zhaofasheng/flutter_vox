import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'package:get/get.dart';
import 'package:vox_video/app/modules/order_list_view/views/order_item.dart';

import '../controllers/order_list_view_controller.dart';

class OrderListViewView extends GetView<OrderListViewController> {
  const OrderListViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F7F8FC'),
      appBar: AppBar(
        title: const Text('课程订单'),
        backgroundColor: HexColor('#F7F8FC'),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Obx((){
        final orders = controller.orderList;
        if(orders.isEmpty){
          return const Center(child: Text('暂无订单'));
        }

        return ListView.builder(
            itemBuilder: (context,index){
              final order = controller.orderList[index];
              return OrderItem(order: order);
            },
            itemCount: controller.orderList.length
        );
      }),
    );
  }
}
