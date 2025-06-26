import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

import 'package:get/get.dart';
import 'package:vox_video/app/modules/Untils/user_storage_service.dart';
import 'package:vox_video/app/modules/login_view/views/cell_item.dart';
import 'package:vox_video/app/modules/video_list/views/user_info_model.dart';

import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F7F8FC'),
      appBar: AppBar(
        backgroundColor: HexColor('#F7F8FC'),
      ),
      body: Obx((){
        return UserStorageService.isLoggedInRx.value ?
        mineView()
            :
        noLoginWidget();
      }),
    );
  }

  Widget items1(){
    return Container(
      margin: const EdgeInsets.only(left: 15,right: 15,top: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: HexColor('#FFFFFF'),
      ),
      child: Column(
        children: [
          CellItem(imageWidget: Assets.images.orderList.image(width: 24,height: 24),title: '课程订单',onTap: (){
            Get.toNamed(Routes.ORDER_LIST_VIEW);
          },),
          CellItem(imageWidget: Assets.images.buyList.image(width: 24,height: 24),title: '我的课程',),
          CellItem(imageWidget: Assets.images.liCard.image(width: 24,height: 24),title: '礼品卡',),
        ],
      ),
    );
  }

  Widget mineView(){
    UserInfoModel? userInfoModel = UserStorageService.getUserInfo();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    userInfoModel?.avatarUrl ?? '',
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userInfoModel?.nickName ?? '',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#14151A')
                      ),
                    ),
                    Text(
                      userInfoModel?.frequencyNo ?? '',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#8A8F99')
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          items1(),

          Container(
            margin: const EdgeInsets.only(left: 15,right: 15,top: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: HexColor('#FFFFFF'),
            ),
            child: CellItem(title: '退出登录',onTap: (){
              print('哈哈');
              controller.outLogin();
            },
            ),
          ),
        ],
      ),
    );
  }

  Widget noLoginWidget(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.noLogin.image(width: 258,height: 212),
          const SizedBox(height: 60,),
          GestureDetector(
            onTap: (){
              Get.toNamed(Routes.LOGIN_VIEW);
            },
            child: Container(
              width: 140,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.black,
              ),
              child:const Center(child: Text('登录',style: TextStyle(fontSize: 18,color: Colors.white),),),
            ),
          ),
        ],
      ),
    );
  }
}
