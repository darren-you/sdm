import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sdm/business/home/home_page_controller.dart';
import 'package:sdm/business/me/me_page.dart';
import 'package:sdm/business/message/message_page.dart';
import 'package:sdm/business/voice/voice_page.dart';
import 'package:sdm/components/container/custom_container.dart';
import 'package:sdm/components/keep_alive_wrapper.dart';
import 'package:sdm/enumm/color_enum.dart';

import '../../components/view/bottom_nav_painter.dart';
import '../../utils/assert_util.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.color,
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Stack(
          children: [
            /// PageView
            viewPagerContents(controller),

            /// 底部导航栏
            bottomNavWidget(context, controller),
          ],
        ),
      ),
    );
  }
}

/// ViewPager中页面
Widget viewPagerContents(HomePageController controller) {
  return PageView(
    controller: controller.pageController,
    physics: const NeverScrollableScrollPhysics(),
    children: const [
      KeepAliveWrapper(
        child: MePage(),
      ),
      KeepAliveWrapper(
        child: VoicePage(),
      ),
      KeepAliveWrapper(
        child: MessagePage(),
      ),
    ],
  );
}

/// 底部导航栏
Widget bottomNavWidget(BuildContext context, HomePageController controller) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      width: context.width,
      height: 107.h,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            //alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(375.w, 84.5.h),
                  painter: NavPainter(),
                  //foregroundPainter: NavPainter(),
                ),
                Positioned(
                  left: (context.width / 2 - 33.w - 36.w) / 2,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    child: SizedBox(
                      width: 36.w,
                      height: 36.w,
                      child: Obx(() => controller.currentNavTab.value == 0
                          ? SvgPicture.asset(AssertUtil.iconTabMeSelect)
                          : SvgPicture.asset(AssertUtil.iconTabMe)),
                    ),
                    onTap: () => controller.selectBottomNavTab(0),
                  ),
                ),
                Positioned(
                  right: (context.width / 2 - 33.w - 36.w) / 2,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    child: SizedBox(
                      width: 36.w,
                      height: 36.w,
                      child: Obx(() => controller.currentNavTab.value == 2
                          ? SvgPicture.asset(
                              AssertUtil.iconTabGeneralChatSelect)
                          : SvgPicture.asset(AssertUtil.iconTabGeneralChat)),
                    ),
                    onTap: () => controller.selectBottomNavTab(2),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Obx(
              () => CustomContainer(
                borderRadius: BorderRadius.circular(66.w),
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 66.w,
                  height: 66.w,
                  decoration: BoxDecoration(
                    color: controller.currentNavTab.value == 1
                        ? MyColors.mainColor.color
                        : const Color(0xFFD4D6D8),
                    borderRadius: BorderRadius.circular(66.w),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withOpacity(0.12),
                        offset: const Offset(0, 2.0),
                        blurRadius: 4.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(AssertUtil.iconDiscover),
                  ),
                ),
                onTap: () => controller.selectBottomNavTab(1),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
