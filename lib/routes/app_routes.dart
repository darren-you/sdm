import 'package:get/get.dart';
import 'package:sdm/business/login/login_page.dart';
import 'package:sdm/business/login/login_page_controller.dart';
import 'package:sdm/utils/routes_util.dart';

import '../business/home/home_page.dart';
import '../business/home/home_page_controller.dart';

class AppPages {
  static List<GetPage<dynamic>>? appRoutes = [
    /// 主页导航页
    GetPage(
      name: RoutesPath.bottomNavPage,
      page: () => const HomePage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => HomePageController());
        },
      ),
    ),

    /// 登陆页面
    GetPage(
      name: RoutesPath.loginPage,
      page: () => const LoginPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => LoginPageController());
        },
      ),
    ),
  ];
}
