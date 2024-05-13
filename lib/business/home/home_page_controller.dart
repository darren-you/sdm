import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var currentNavTab = 1.obs;
  final pageController = PageController(initialPage: 1);

  void selectBottomNavTab(int index) {
    currentNavTab.value = index;
    pageController.jumpToPage(index);
  }
}
