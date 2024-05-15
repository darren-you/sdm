import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sdm/business/account/view/title_bar.dart';
import 'package:sdm/components/input/custom_edit_normal.dart';
import 'package:sdm/components/view/custom_body.dart';
import 'package:sdm/enumm/color_enum.dart';
import 'package:sdm/services/app_init_service.dart';
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
        appBar: const CustomSignTitleBar(title: 'Sign in'),
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

              /// 登陆输入
              inputAccountInfo(context),

              /// 注册Card
              bottomPic(context),
            ],
          ),
        ),
      ),
    );
  }
}

/// 登陆输入
Widget inputAccountInfo(BuildContext context) {
  return Container(
    width: context.width,
    height: 291.h,
    margin: EdgeInsets.only(left: 18.w, top: 26.h, right: 18.w),
    padding: EdgeInsets.only(left: 12.w, top: 18.h),
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
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 12.w),
          child: Column(
            children: [
              CustomEditNormal(
                height: 48.h,
                backgroundColor: MyColors.inputiHintBackgrounfColor.color,
                borderRadius: BorderRadius.circular(44.r),
                keyboardType: TextInputType.visiblePassword,
                leftIcon: SvgPicture.asset(AssertUtil.iconEmail),
                showSuffixIcon: false,
                hintText: 'Email address',
                hintStyle: TextStyle(
                  fontSize: 18.sp,
                  color: MyColors.inputiHintColor.color,
                ),
              ),
              SizedBox(height: 28.h),
              CustomEditNormal(
                height: 48.h,
                backgroundColor: MyColors.inputiHintBackgrounfColor.color,
                borderRadius: BorderRadius.circular(44.r),
                keyboardType: TextInputType.visiblePassword,
                leftIcon: SvgPicture.asset(AssertUtil.iconPassword),
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontSize: 18.sp,
                  color: MyColors.inputiHintColor.color,
                ),
              ),
              SizedBox(height: 34.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    logger.i('Click > > > Forget Password');
                  },
                  child: Text(
                    'Forget Password',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: MyColors.textFgPwdColor.color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                logger.i('Click > > > ');
              },
              child: Container(
                width: 94.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: MyColors.mainColor.color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48.r),
                      bottomLeft: Radius.circular(48.r)),
                  boxShadow: [
                    BoxShadow(
                      color: HexColor("#DD73EC").withOpacity(0.72),
                      offset: Offset(0, 2.h),
                      blurRadius: 4.r,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 28.w),
                  child: SvgPicture.asset(
                    AssertUtil.iconGo,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

/// 底部插画
Widget bottomPic(BuildContext context) {
  return Expanded(
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
  );
}
