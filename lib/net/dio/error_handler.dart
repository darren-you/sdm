import 'package:dio/dio.dart';

class ErrorHandler {
  static void handleError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      // 处理连接超时错误
      case DioExceptionType.sendTimeout:
      // 处理发送超时错误
      case DioExceptionType.receiveTimeout:
      // 处理接收超时错误
      case DioExceptionType.badCertificate:
      // 证书错误
      case DioExceptionType.badResponse:
      // 响应错误
      case DioExceptionType.cancel:
      // 取消
      case DioExceptionType.connectionError:
      // 连接错误
      case DioExceptionType.unknown:
      // 未知错误
      default:
        break;
    }
  }
}
