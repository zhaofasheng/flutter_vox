import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vox_video/app/modules/Untils/net_logger.dart';
import 'package:vox_video/app/modules/Untils/user_storage_service.dart';
import 'package:vox_video/app/modules/video_list/views/user_info_model.dart';

import '../../Untils/app_http_client.dart';

class LoginViewController extends GetxController {
  final phone = ''.obs;
  final code = ''.obs;
  final canSendCode = true.obs;
  final sendCodeLabel = '获取验证码'.obs;
  final isLoginEnabled = false.obs;


  Timer? _timer;
  int _seconds = 60;

  void onPhoneChanged(String value) {
    phone.value = value;
    _updateLoginState();
  }

  void onCodeChanged(String value) {
    code.value = value;
    _updateLoginState();
  }

  void _updateLoginState() {
    isLoginEnabled.value = phone.value.length == 11 && code.value.length >= 4;
  }

  Future<void> sendCode() async {
    if (phone.value.length != 11) {
      Get.snackbar('提示', '请输入有效的手机号');
      return;
    }

    canSendCode.value = false;
    sendCodeLabel.value = '$_seconds s';

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds--;
      sendCodeLabel.value = '$_seconds s';
      if (_seconds == 0) {
        timer.cancel();
        _seconds = 60;
        canSendCode.value = true;
        sendCodeLabel.value = '获取验证码';
      }
    });

    final client = AppHttpClient();
    try {
      final response = await client.get(
        'users/code/CN/${phone.value}/3456789',
      );
      if (response.statusCode == 200) {
        Get.snackbar('验证码已发送','');
      } else {
        Get.snackbar('错误', '请求失败：${response.statusCode}');
      }
    }catch(e){
      Get.snackbar('异常', '请求异常：$e');
    }

  }

  Future<void> onLoginPressed() async {
    final client = AppHttpClient();
    try {
      final response = await client.post(
        'users/login',
        data: {
          'deviceInfo':'iOS',
          'appVersion':'6.0.0',
          'platformId':'2',
          'smsCode':code.value,
          'countryCode':'CN',
          'mobile':phone.value,
          'deviceId':'ghjklyghjk',
        }
      );
      if (response.statusCode == 200) {
        UserInfoModel userInfoModel = UserInfoModel.fromJson(response.data['data']);
        UserStorageService.saveUserInfo(userInfoModel);
        getUserInfo(userInfoModel);
      } else {
        NetLogger.logCustom('登录接口', response.statusCode);
      }
    }catch(e){
      NetLogger.logCustom('登录接口', '请求异常：$e');
    }
  }

  Future<void> getUserInfo(UserInfoModel userInfoModel) async {
    final client = AppHttpClient();
    try {
      final response = await client.get(
          'users/${userInfoModel.userId}',
      );
      if (response.statusCode == 200) {
        UserInfoModel userInfo = UserInfoModel.fromJson(response.data['data']);
        userInfo.userId = userInfoModel.userId;
        userInfo.token = userInfoModel.token;
        UserStorageService.saveUserInfo(userInfo);
        Get.back();
      } else {
        Get.snackbar('错误', '请求失败：${response.statusCode}');
        NetLogger.logCustom('登录接口', response.statusCode);
      }
    }catch(e){
      NetLogger.logCustom('登录接口', '请求异常：$e');
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
