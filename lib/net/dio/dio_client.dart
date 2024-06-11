import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sdm/config/app_config.dart';
import 'package:sdm/services/app_init_service.dart';
import 'package:sdm/utils/match_util.dart';
import 'package:uuid/uuid.dart';

import '../../utils/api_path_util.dart';

class DioClient {
  static final Dio _normalDio = Dio();
  static Dio? _baseUrlDio;

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

    _defaultOptions.headers.addAllIf(true, firstHeaderParamMap());
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

  /// 存在Token时
  static Map<String, dynamic> headerParamMap() {
    final headerMap = <String, dynamic>{};

    // 获取当前时间
    int currentTimeStep = (DateTime.now().millisecondsSinceEpoch) ~/ 1000;
    String nonce = MatchUtil.randomBit(4);
    String signKey = '';
    int deviceType = AppConfig.platfrom == 'ANDROID' ? 2 : 1;
    signKey = AppConfig.getSignSecret(
        appId: AppConfig.appID, time: currentTimeStep, nonce: nonce);

    headerMap.addAll({
      'AppId': AppConfig.appID,
      'TimeStamp': currentTimeStep,
      'Signature': signKey,
      'Nonce': nonce,
      'devicetype': deviceType,
      'clientversion': '2.0',
      'UUID': const Uuid().v1()
    });

    logger.e('map: $headerMap');

    return headerMap;
  }

  /// 获取Token
  static Map<String, dynamic> firstHeaderParamMap() {
    final firstHeaderMap = <String, dynamic>{};

    // 获取当前时间
    int currentTimeStep = (DateTime.now().millisecondsSinceEpoch) ~/ 1000;
    String nonce = MatchUtil.randomBit(4);
    String signKey = '';
    int deviceType = AppConfig.platfrom == 'ANDROID' ? 2 : 1;
    signKey = AppConfig.getSignKey(
        appId: AppConfig.appID,
        appSecret: AppConfig.secret,
        time: currentTimeStep,
        nonce: nonce);

    firstHeaderMap.addAll({
      'AppId': AppConfig.appID,
      'TimeStamp': currentTimeStep,
      'Signature': signKey,
      'Nonce': nonce,
      'devicetype': deviceType,
      'clientversion': '2.0',
      'UUID': const Uuid().v1()
    });

    logger.e('firstHeaderMap: $firstHeaderMap');

    return firstHeaderMap;
  }
}
