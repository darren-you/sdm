import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';

import '../business/service_environment/repository/base_url_impl.dart';
import '../business/service_environment/repository/base_url_service.dart';
import '../utils/dio_util.dart';

final Logger logger = Logger();

class AppInitService {
  static Future<void> init() async {
    debugPrint('< < <   全局初始化 start...   > > >');
    // 初始化 WidgetsFlutterBinding
    WidgetsFlutterBinding.ensureInitialized();

    // 初始化状态栏、导航栏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarContrastEnforced: false,
    ));

    // 初始化本地存储服务
    final getStorage = await GetStorage.init();
    getStorage
        ? debugPrint("初始化全局单例 GetStorage 完成✅")
        : debugPrint("初始化全局单例 GetStorage 失败❌");

    // 初始化本地时间服务
    initializeDateFormatting(); // 初始化日期格式化信息
    debugPrint("初始化日期格式化信息 完成✅");
    Get.put<BaseUrlService>(BaseUrlImpl());
    DioUtil.init();

    // 初始化用户信息ViewModel

    debugPrint('< < <   全局初始化 end...   > > >');
  }
}
