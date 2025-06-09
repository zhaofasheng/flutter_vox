import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';


/// 网络日志打印工具类（格式化 + 分段防止截断）
class NetLogger {
  static const String _tag = '网络日志';
  static const int _chunkSize = 800; // 每段最大长度

  /// 打印请求日志
  static void logRequest(RequestOptions options) {
    if (!kDebugMode) return;

    _log('✅ 请求开始');
    _log('▶️ 请求方法：${options.method}');
    _log('📍 请求地址：${options.uri}');
    _log('🧾 请求头：${jsonEncode(options.headers)}');
    if (options.queryParameters.isNotEmpty) {
      _log('❓ Query参数：${jsonEncode(options.queryParameters)}');
    }
    if (options.data != null) {
      _log('📝 请求体：');
      _logJson(options.data);
    }
    _log('✅ 请求结束\n');
  }

  /// 打印响应日志
  static void logResponse(Response response) {
    if (!kDebugMode) return;

    _log('📦 响应开始');
    _log('🏁 请求地址：${response.requestOptions.uri}');
    _log('📄 响应状态码：${response.statusCode}');
    _log('📃 响应数据：');
    _logJson(response.data);
    _log('📦 响应结束\n');
  }

  /// 打印错误日志
  static void logError(DioException e) {
    if (!kDebugMode) return;

    _log('❌ 请求失败');
    _log('📍 请求地址：${e.requestOptions.uri}');
    _log('🚫 错误信息：${e.message}');
    if (e.response != null) {
      _log('📄 状态码：${e.response?.statusCode}');
      _log('📃 错误数据：');
      _logJson(e.response?.data);
    }
    _log('❌ 错误结束\n');
  }

  /// 打印普通日志（自动带 tag）
  static void _log(String msg) {
    if (kDebugMode) print('$_tag $msg');
  }

  /// 分段打印格式化后的 JSON（防止被 Logcat 裁剪）
  static void _logJson(dynamic data) {
    try {
      String jsonStr;
      if (data is String) {
        jsonStr = const JsonEncoder.withIndent('  ').convert(json.decode(data));
      } else {
        jsonStr = const JsonEncoder.withIndent('  ').convert(data);
      }

      // 分段打印
      while (jsonStr.isNotEmpty) {
        if (jsonStr.length > _chunkSize) {
          _log(jsonStr.substring(0, _chunkSize));
          jsonStr = jsonStr.substring(_chunkSize);
        } else {
          _log(jsonStr);
          break;
        }
      }
    } catch (e) {
      _log('⚠️ JSON 解析失败，原始数据：$data');
    }
  }
}