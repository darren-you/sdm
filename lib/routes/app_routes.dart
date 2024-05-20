import 'package:get/get.dart';
import 'package:sdm/business/account/sign_up/basic_info_controller.dart';
import 'package:sdm/business/account/sign_up/basic_info_page.dart';
import 'package:sdm/business/account/sign_up/cover_page.dart';
import 'package:sdm/business/account/sign_up/cover_page_controller.dart';
import 'package:sdm/business/login/login_page.dart';
import 'package:sdm/business/login/login_page_controller.dart';
import 'package:sdm/business/account/sign_in/signin_page.dart';
import 'package:sdm/utils/routes_util.dart';

import '../business/account/sign_up/signup_page.dart';
import '../business/account/sign_up/signup_page_controller.dart';
import '../business/home/home_page.dart';
import '../business/home/home_page_controller.dart';
import '../business/account/sign_in/signin_page_controller.dart';

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

    /// 注册账号
    GetPage(
      name: RoutesPath.signUpPage,
      page: () => const SignupPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => SignupPageController());
        },
      ),
    ),

    /// 基本信息
    GetPage(
      name: RoutesPath.basicInfoPage,
      page: () => const BasicInfoPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => BasicInfoController());
        },
      ),
    ),

    /// 选择头像
    GetPage(
      name: RoutesPath.coverPage,
      page: () => const CoverPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => CoverPageController());
        },
      ),
    ),

    /// 登陆账号
    GetPage(
      name: RoutesPath.signInPage,
      page: () => const SigninPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => SigninPageController());
        },
      ),
    ),
  ];
}
