import 'package:dio/dio.dart';
import 'package:sdm/net/dio/dio_client.dart';
import '../../services/app_init_service.dart';
import 'error_handler.dart';
import 'interceptors.dart';
import '../models.dart';

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
  static Future<ApiResponse<T>> get<T>(String url,
      {bool useDefaultBaseUrl = true,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      logger.i(
          '< < <   Get请求   > > > \n------baseUrl: ${_dio.options.baseUrl} \n------path:$url \n------header(请求头信息):$options \n------query(url参数):$queryParameters \n------body:$data');

      final response = await _dio.get(url,
          data: data, queryParameters: queryParameters, options: options);

      logger.i('< < <   Get结果   > > > \n------result:${response.data}');

      return ApiResponse<T>(
        statusCode: response.statusCode,
        data: response.data as T,
        message: '请求成功',
      );
    } catch (error) {
      logger.e(
          '< < <   Get请求失败   > > > \n------错误类型:${(error as DioException).type} \n------错误信息:$error');
      ErrorHandler.handleError(error);

      return ApiResponse<T>(
        statusCode: -1,
        message: '请求失败',
        data: null,
      );
    }
  }

  /// Post 请求
  ///
  /// data - 请求体
  /// queryParameters - 请求参数
  /// options - 请求配置
  static Future<ApiResponse<T>> post<T>(String url,
      {bool useDefaultBaseUrl = true,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      logger.i(
          '< < <   Post请求   > > > \n------baseUrl: ${_dio.options.baseUrl} \n------path:$url \n------header(请求头信息):$options \n------query(url参数):$queryParameters \n------body:$data');

      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      logger.i('< < <   Post结果   > > > \n------result:${response.data}');

      return ApiResponse<T>(
        statusCode: response.statusCode,
        data: response.data as T,
        message: '请求成功',
      );
    } catch (error) {
      logger.e(
          '< < <   Post请求失败   > > > \n------错误类型:${(error as DioException).type} \n------ 错误信息:$error');
      ErrorHandler.handleError(error);

      return ApiResponse<T>(
        statusCode: -1,
        message: '请求失败',
        data: null,
      );
    }
  }
}
