import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 在请求之前做一些处理，比如添加token等
    super.onRequest(options, handler);
  }
}

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 在请求出错时做一些处理
    super.onError(err, handler);
  }
}
