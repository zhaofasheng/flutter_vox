
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sp_util/sp_util.dart';

import '../video_list/views/user_info_model.dart';

class UserStorageService {
  static const _userInfoKey = 'user_info';

  static final RxBool isLoggedInRx = RxBool(isLoggedIn());

  // 保存用户信息
  static Future<void> saveUserInfo(UserInfoModel model) async {
    final jsonStr = jsonEncode(model.toJson());
    await SpUtil.putString(_userInfoKey, jsonStr);
    isLoggedInRx.value = true;
  }

  // 获取用户信息
  static UserInfoModel? getUserInfo() {
    final jsonStr = SpUtil.getString(_userInfoKey);
    if (jsonStr == null || jsonStr.isEmpty) return null;
    try {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
      return UserInfoModel.fromJson(jsonMap);
    } catch (e) {
      if (kDebugMode) {
        print('❌ 解析用户信息失败: $e');
      }
      return null;
    }
  }

  // 清除用户信息（如退出登录）
  static Future<void> clearUserInfo() async {
    await SpUtil.remove(_userInfoKey);
    isLoggedInRx.value = false;
  }

  // 判断是否已登录（依据 token）
  static bool isLoggedIn() {
    final user = getUserInfo();
    return user?.token != null && user!.token!.isNotEmpty;
  }

  // 获取 token（可用于网络请求）
  static String? getToken() {
    return getUserInfo()?.token;
  }
}