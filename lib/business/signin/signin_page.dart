import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sdm/components/view/custom_body.dart';
import 'package:sdm/utils/assert_util.dart';
import 'package:sdm/utils/color_util.dart';

import 'signin_page_controller.dart';

class SigninPage extends GetView<SigninPageController> {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight = context.mediaQueryPadding.top + 83.h;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomBody(
        scroller: false,
        appBarHeight: appBarHeight,
        appBar: Container(
          padding: EdgeInsets.only(
              left: 16.w, top: context.mediaQueryPadding.top, right: 16.w),
          width: context.width,
          height: appBarHeight,
          color: Colors.white,
          child: SizedBox(
            child: Row(
              children: [
                GestureDetector(
                  onTap: Get.back,
                  child: SizedBox(
                    child: SvgPicture.asset(AssertUtil.iconTitleBack),
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  'Sign in',
                  style:
                      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
        body: SizedBox(
          width: context.width,
          height: 600.h,
          child: Column(
            children: [
              /// 分割线
              Container(
                width: context.width,
                height: 0.5.h,
                color: HexColor("#D4D6D8"),
              ),

              /// 注册Card
              Container(
                width: context.width,
                height: 291.h,
                margin: EdgeInsets.only(left: 18.w, top: 26.h, right: 18.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: HexColor("#7E7E7E").withOpacity(0.15),
                      offset: Offset(0, 2.h),
                      blurRadius: 20.r,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),

              /// 底部插画
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 24.h,
                    bottom: context.mediaQueryPadding.bottom,
                  ),
                  child: SvgPicture.asset(
                    AssertUtil.bgSigninEmail,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
