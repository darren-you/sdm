import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdm/business/account/token/token_api.dart';
import 'package:sdm/config/app_config.dart';
import 'package:sdm/utils/routes_util.dart';

class SignupPageController extends GetxController {
  final tokenApi = Get.find<TokenApi>();

  var mindInfo = ''.obs;
  var emailCorrectState = false.obs;
  var passwordCorrectState = false.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// 注册账号下一步
  void nextStep() {
    if (!canNext()) return;
    Get.toNamed(RoutesPath.basicInfoPage);
  }

  /// 能否继续下一步
  bool canNext() {
    if (mindInfo.value.isEmpty &&
        emailCorrectState.value &&
        passwordCorrectState.value) {
      return true;
    }
    return false;
  }

  @override
  void onInit() {
    super.onInit();

    _initUiInputListener();
  }

  @override
  void onReady() async {
    await _getToken();

    super.onReady();
  }

  /// 初始化输入框监听
  void _initUiInputListener() {
    emailController.addListener(() {
      final emailContent = emailController.text;
      if (emailContent.isNotEmpty && emailContent.isEmail) {
        mindInfo.value = '';
        emailCorrectState.value = true;
      } else {
        emailCorrectState.value = false;
        mindInfo.value = 'Please input correct email';
      }
    });

    passwordController.addListener(() {
      final passwordContent = passwordController.text;
      if (passwordContent.isNotEmpty && passwordContent.trim().length < 6) {
        passwordCorrectState.value = false;
        mindInfo.value = 'Your password must be at least 6 characters.';
      } else if (passwordContent.isNotEmpty &&
          passwordContent.trim().length >= 6) {
        passwordCorrectState.value = true;
        mindInfo.value = '';
      }
    });
  }

  /// 获取Token
  Future<void> _getToken() async {
    final userToken = AppConfig.getAccessToken();
    if (userToken == null) await tokenApi.getToken();
  }
}
