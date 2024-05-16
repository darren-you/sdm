import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicInfoController extends GetxController {
  var mindInfo = ''.obs;
  var usernameCorrectState = false.obs;
  var locationCorrectState = false.obs;
  var ageValue = 0.obs;
  var radioValue = 'Male'.obs;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  /// 能否继续下一步
  bool canNext() {
    if (usernameCorrectState.value && locationCorrectState.value) return true;
    return false;
  }

  /// 注册账号下一步
  void nextStep() {
    return;
  }
}
