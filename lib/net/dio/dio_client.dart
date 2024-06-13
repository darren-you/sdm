import 'package:dio/dio.dart';

import '../../services/app_init_service.dart';
import '../../utils/api_path_util.dart';

class DioClient {
  static final Dio _normalDio = Dio();
  static Dio? _baseUrlDio;

  static late BaseOptions _defaultOptions;

  DioClient._();

  static Dio getInstance({bool? useBaseUrlDio}) {
    if (useBaseUrlDio!) {
      if (_baseUrlDio == null) {
        _initBaseUrlDio();
      }

      return _baseUrlDio!;
    }

    return _normalDio;
  }

  /// dio初始化配置 https://github.com/cfug/dio/blob/main/dio/README-ZH.md -> 【请求配置】
  static void _initBaseUrlDio() {
    _defaultOptions = BaseOptions(
        baseUrl: ApiPathUtil.getBaseUrl(),
        contentType: Headers.jsonContentType);

    _baseUrlDio = Dio(_defaultOptions);

    logger.d("初始化Dio✅ 带BASE_URL > > > ${ApiPathUtil.getBaseUrl()}");
  }
}
