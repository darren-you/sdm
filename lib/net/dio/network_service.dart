import 'package:dio/dio.dart';
import 'package:sdm/net/dio/dio_client.dart';
import '../../services/app_init_service.dart';

import 'error_handler.dart';
import 'interceptors.dart';

class NetworkService {
  NetworkService._();

  static final Dio _dio = DioClient.getInstance(useBaseUrlDio: true);

  static void init() {
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
  }

  /// Get 请求
  ///
  /// data - 请求体
  /// queryParameters - 请求参数
  /// options - 请求配置
  static Future<Response<T>> get<T>(
    String url, {
    bool useDefaultBaseUrl = true,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      logger.i(
          '< < <   Get请求   > > > \n------baseUrl: ${_dio.options.baseUrl} \n------path:$url \n------header(请求头信息):${_dio.options.headers} \n------query(url参数):$queryParameters \n------body:$data');
      final Response<T> response = await _dio.get<T>(url,
          data: data, queryParameters: queryParameters, options: options);
      logger.i('< < <   Get结果   > > > \n------result:${response.data}');

      return response;
    } on DioException catch (error) {
      logger.e(
          '< < <   Get请求失败   > > > \n------错误类型:${error.runtimeType} \n------错误信息:$error');
      ErrorHandler.handleError(error);
      return Response<T>(
        requestOptions: error.requestOptions,
        data: null,
        statusCode: error.response?.statusCode ?? 500,
        statusMessage: error.message,
      );
    } catch (e) {
      throw Exception('Unknown error occurred: $e');
    }
  }

  /// Post 请求
  ///
  /// data - 请求体
  /// queryParameters - 请求参数
  /// options - 请求配置
  static Future<Response<T>> post<T>(String url,
      {bool useDefaultBaseUrl = true,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      logger.i(
          '< < <   Post请求   > > > \n------baseUrl: ${_dio.options.baseUrl} \n------path:$url \n------header(请求头信息):${_dio.options.headers} \n------query(url参数):$queryParameters \n------body:$data');

      final Response<T> response = await _dio.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      logger.i('< < <   Post结果   > > > \n------result:${response.data}');
      return response;
    } on DioException catch (error) {
      logger.e(
          '< < <   Post请求失败   > > > \n------错误类型:${error.runtimeType} \n------ 错误信息:$error');
      ErrorHandler.handleError(error);
      // 返回一个表示错误的响应，默认构造或根据需要定制
      return Response<T>(
        requestOptions: error.requestOptions,
        data: null,
        statusCode: error.response?.statusCode ?? 500,
        statusMessage: error.message,
      );
    } catch (e) {
      throw Exception('Unknown error occurred: $e');
    }
  }
}
