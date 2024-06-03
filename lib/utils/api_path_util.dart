import 'package:get/get.dart';

import '../business/net_env/repository/base_url_service.dart';

class ApiPathUtil {
  static final baseUrlService = Get.find<BaseUrlService>();
  ApiPathUtil._();

  //static const String springBootBaseUrl = "https://singlestep.cn/wejinda";
  //static const String springBootBaseUrl = "http://192.168.27.5:8080/wejinda";

  static String getBaseUrl() {
    return baseUrlService.getURL();
  }

  static void setBaseUrl(String baseUrl) {
    return baseUrlService.saveURL(baseUrl);
  }
}
