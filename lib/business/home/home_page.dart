import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sdm/business/home/home_page_controller.dart';
import 'package:sdm/business/me/me_page.dart';
import 'package:sdm/business/message/message_page.dart';
import 'package:sdm/business/voice/voice_page.dart';
import 'package:sdm/components/keep_alive_wrapper.dart';
import 'package:sdm/enumm/color_enum.dart';

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
            PageView(
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
            ),

            /// 底部导航栏
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: context.width,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: SizedBox(
                        width: 36.w,
                        height: 36.h,
                        child: Obx(() => controller.currentNavTab.value == 0
                            ? SvgPicture.asset(AssertUtil.iconTabMeSelect)
                            : SvgPicture.asset(AssertUtil.iconTabMe)),
                      ),
                      onTap: () => controller.selectBottomNavTab(0),
                    ),
                    GestureDetector(
                      child: SizedBox(
                        width: 36.w,
                        height: 36.h,
                        child: Obx(() => controller.currentNavTab.value == 1
                            ? SvgPicture.asset(AssertUtil.iconTabDiscover)
                            : SvgPicture.asset(
                                AssertUtil.iconTabDiscover,
                                color: Colors.grey,
                              )),
                      ),
                      onTap: () => controller.selectBottomNavTab(1),
                    ),
                    GestureDetector(
                      child: SizedBox(
                        width: 36.w,
                        height: 36.h,
                        child: Obx(() => controller.currentNavTab.value == 2
                            ? SvgPicture.asset(
                                AssertUtil.iconTabGeneralChatSelect)
                            : SvgPicture.asset(AssertUtil.iconTabGeneralChat)),
                      ),
                      onTap: () => controller.selectBottomNavTab(2),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
