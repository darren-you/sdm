import 'package:dio/dio.dart';
import 'package:sdm/services/app_init_service.dart';

import '../../utils/api_path_util.dart';

class DioClient {
  static final Dio _normalDio = Dio();
  static Dio? _baseUrlDio = null;

  static late BaseOptions _defaultOptions;

  DioClient._();

  static Dio getInstance({bool? useBaseUrlDio, String? loginToken}) {
    if (useBaseUrlDio!) {
      if (_baseUrlDio == null) {
        _initBaseUrlDio();
      }

      return _baseUrlDio!;
    }

    return _normalDio;
  }

  /// dio初始化配置 https://github.com/cfug/dio/blob/main/dio/README-ZH.md -> 【请求配置】
  static void _initBaseUrlDio({String? loginToken}) {
    logger.i("初始化Dio✅ 带BASE_URL > > > ${ApiPathUtil.getBaseUrl()}");
    _defaultOptions = BaseOptions(
        baseUrl: ApiPathUtil.getBaseUrl(),
        contentType: Headers.jsonContentType);
    _baseUrlDio = Dio(_defaultOptions);
    if (null != loginToken) {
      // 添加拦截器
      _baseUrlDio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            var customHeaders = {'loginToken': loginToken};
            options.headers.addAll(customHeaders);
            return handler.next(options);
          },
        ),
      );
    }
  }
}
