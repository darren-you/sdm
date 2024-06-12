import 'package:get/get.dart';
import 'package:sdm/business/account/basic_info/basic_info_controller.dart';
import 'package:sdm/business/account/basic_info/basic_info_page.dart';
import 'package:sdm/business/account/user_cover/cover_page.dart';
import 'package:sdm/business/account/user_cover/cover_page_controller.dart';
import 'package:sdm/business/chat/chat_ing/chat_ing_page.dart';
import 'package:sdm/business/login/login_page.dart';
import 'package:sdm/business/login/login_page_controller.dart';
import 'package:sdm/business/account/sign_in/signin_page.dart';
import 'package:sdm/business/chat/chat_list/chat_list_page_controller.dart';
import 'package:sdm/business/net_env/base_url_page_vm.dart';
import 'package:sdm/utils/routes_util.dart';

import '../business/account/sign_up/signup_page.dart';
import '../business/account/sign_up/signup_page_controller.dart';
import '../business/chat/chat_ing/chat_ing_page_controller.dart';
import '../business/demo/soun_demo.dart';
import '../business/home/home_page.dart';
import '../business/home/home_page_controller.dart';
import '../business/account/sign_in/signin_page_controller.dart';
import '../business/net_env/base_url_page.dart';
import '../business/net_env/repository/base_url_impl.dart';

class AppPages {
  static List<GetPage<dynamic>>? appRoutes = [
    // 主页导航页
    GetPage(
      name: RoutesPath.bottomNavPage,
      page: () => const HomePage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => HomePageController());
          Get.lazyPut(() => MessagePageController());
        },
      ),
    ),

    // 登陆页面
    GetPage(
      name: RoutesPath.loginPage,
      page: () => const LoginPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => LoginPageController());
        },
      ),
    ),

    // 注册账号
    GetPage(
      name: RoutesPath.signUpPage,
      page: () => const SignupPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => SignupPageController());
        },
      ),
    ),

    // 基本信息
    GetPage(
      name: RoutesPath.basicInfoPage,
      page: () => const BasicInfoPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => BasicInfoController());
        },
      ),
    ),

    // 选择头像
    GetPage(
      name: RoutesPath.coverPage,
      page: () => const CoverPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => CoverPageController());
        },
      ),
    ),

    // 登陆账号
    GetPage(
      name: RoutesPath.signInPage,
      page: () => const SigninPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => SigninPageController());
        },
      ),
    ),

    // 聊天界面
    GetPage(
      name: RoutesPath.chatIngPage,
      page: () => const ChatIngPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => ChatIngPageController());
        },
      ),
    ),

    // demo page ------------
    GetPage(
      name: RoutesPath.soundPage,
      page: () => const SoundRecorderPage(),
      binding: BindingsBuilder(
        () {},
      ),
    ),
    GetPage(
      name: RoutesPath.baseUrlPage,
      page: () => const BaseUrlPage(),
      binding: BindingsBuilder(
        () {
          Get.put(BaseUrlImpl());
          Get.lazyPut(() => BaseUrlPageViewModel());
        },
      ),
    ),
    // demo page ------------
  ];
}
