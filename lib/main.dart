import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:sdm/utils/screen_util.dart';

import 'routes/app_routes.dart';
import 'routes/routing_callback_listener.dart';
import 'services/app_init_service.dart';
import 'utils/routes_util.dart';

// flutter build apk --split-per-abi

// Xcode编译问题
// delete Podfile
// run 【flutter clean】, 【flutter pub get】 in your Flutter program, then Podfile will be generated
// In new Podfile, adjust platform to 14.0 and Uncomment that line
// run 【pod install】 in your iOS program
void main() async {
  // 全局初始化
  await AppInitService.init();
  runApp(const SDMApp());
}

class SDMApp extends StatelessWidget {
  const SDMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          // navigatorKey: Toast.navigatorKey, //加上此配置
          //navigatorObservers: [FlutterSmartDialog.observer],
          // Dialog 初始化
          builder: FlutterSmartDialog.init(),
          initialRoute: RoutesPath.loginPage,
          getPages: AppPages.appRoutes,
          defaultTransition: Transition.native, // 页面跳转默认动画
          routingCallback: RoutingCallbackListener.routingListner,
          theme: ThemeData(platform: TargetPlatform.iOS),
          debugShowCheckedModeBanner: false,
          onInit: () {
            MyScreenUtil.getInstance().init(context);
          },
        );
      },
    );
  }
}
