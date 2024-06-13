import 'package:dio/dio.dart';
import 'package:sdm/services/app_init_service.dart';
import 'package:uuid/uuid.dart';

import '../../config/app_config.dart';
import '../../utils/match_util.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 添加Token
    final localUserToken = AppConfig.getAccessToken();
    if (null != localUserToken) {
      var accessToken = {'access_token': localUserToken};
      options.headers.addAll(accessToken);
    }

    // 添加公共请求头
    if (null == localUserToken) {
      options.headers.addAll(_firstHeaderParamMap());
    } else {
      options.headers.addAll(_headerParamMap());
    }

    logger.d('request header: ${options.headers}');

    super.onRequest(options, handler);
  }

  /// 存在Token时
  static Map<String, dynamic> _headerParamMap() {
    final headerMap = <String, dynamic>{};
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

    return headerMap;
  }

  /// 不存在Token
  static Map<String, dynamic> _firstHeaderParamMap() {
    final firstHeaderMap = <String, dynamic>{};
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

    return firstHeaderMap;
  }
}

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 在请求出错时做一些处理
    super.onError(err, handler);
  }
}
