import 'package:dio/dio.dart';
import 'net_logger.dart';

class AppHttpClient {
  static final AppHttpClient _instance = AppHttpClient._internal();
  factory AppHttpClient() => _instance;

  final Dio _dio;

  // 基础地址
  static const String _baseUrl = 'https://sx.byebyetext.com/api/app/';

  AppHttpClient._internal()
      : _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
    ),
  ) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // 设置通用头部参数
        options.headers['Content-Type'] = 'application/x-www-form-urlencoded';

        final languageType = _getLanguageType();
        options.headers['Lang'] = languageType;

        final token = _getToken();
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        NetLogger.logRequest(options);
        handler.next(options);
      },
      onResponse: (response, handler) {
        NetLogger.logResponse(response);
        handler.next(response);
      },
      onError: (e, handler) {
        NetLogger.logError(e);
        handler.next(e);
      },
    ));
  }

  /// GET 请求封装
  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        String? accept,
      }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          if (accept != null) 'Accept': accept,
        },
      ),
    );
  }

  /// POST 请求封装
  Future<Response> post(
      String path, {
        Map<String, dynamic>? data,
        String? accept,
      }) {
    return _dio.post(
      path,
      data: data,
      options: Options(
        headers: {
          if (accept != null) 'Accept': accept,
        },
      ),
    );
  }

  /// 模拟获取语言类型（0: 中文, 1: 英文, 2: 日文）
  String _getLanguageType() {
    const localType = 0; // 你可以换成本地缓存读取
    if (localType == 1) return 'en';
    if (localType == 2) return 'jp';
    return 'cn';
  }

  /// 模拟获取 Token
  String _getToken() {
    // 实际使用时替换为用户登录后的 token
    return ''; // 例如 'abc123'
  }
}