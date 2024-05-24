import 'package:extended_image/extended_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sdm/components/container/custom_container.dart';
import 'package:sdm/components/view/custom_body.dart';
import 'package:sdm/enumm/color_enum.dart';
import 'package:sdm/utils/color_util.dart';
import 'package:sdm/utils/routes_util.dart';

import '../../utils/assert_util.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        backgroundColor: MyColors.background.color,
        enableAppBarPadding: false,
        scroller: false,
        body: Stack(
          children: [
            /// 背景滚动层
            //backgrounWidget(context),
            loginBackgroundAnim(context),

            /// 半透明蒙层
            coverWidget(context),

            /// UI层
            loginFunWidget(context),
          ],
        ),
      ),
    );
  }
}

/// 背景图片
Widget backgrounWidget(BuildContext context) {
  return SizedBox(
    width: context.width,
    height: context.height,
    child: ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Expanded(
              child: ExtendedImage.asset(
                "assets/images/photo${index * 2 + 1}.png",
                height: 220.h,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: ExtendedImage.asset(
                "assets/images/photo${index * 2 + 2}.png",
                height: 220.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    ),
  );
}

/// 半透明遮罩
Widget coverWidget(BuildContext context) {
  return Container(
    width: context.width,
    height: context.height,
    color: Colors.black38.withOpacity(0.5),
  );
}

/// 登陆、隐私条款
Widget loginFunWidget(BuildContext context) {
  return SizedBox(
    width: context.width,
    height: context.height,
    child: Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 190.h)),
        GestureDetector(
          child: SizedBox(
            width: 102.w,
            height: 42.h,
            child: SvgPicture.asset(AssertUtil.iconLogo),
          ),
          onTap: () {
            Get.toNamed(RoutesPath.bottomNavPage);
          },
        ),
        Padding(padding: EdgeInsets.only(bottom: 16.h)),
        Text(
          'Serious Discreet Meet',
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.white,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 262.h)),
        CustomContainer(
          borderRadius: BorderRadius.circular(12),
          duration: const Duration(milliseconds: 100),
          onTap: () => Get.toNamed(RoutesPath.signUpPage),
          child: Container(
            width: 252.w,
            height: 48.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MyColors.mainColor.color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Sign up with email',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 20.h)),
        CustomContainer(
          borderRadius: BorderRadius.circular(12.r),
          duration: const Duration(milliseconds: 100),
          onTap: () {
            debugPrint("click > Sign in with Apple");
          },
          child: Container(
            width: 252.w,
            height: 48.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: HexColor("#FFFFFF"),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssertUtil.appleLogo,
                  width: 16.w,
                  height: 16.h,
                ),
                Padding(padding: EdgeInsets.only(left: 8.sp)),
                Text(
                  'Sign in with Apple',
                  style: TextStyle(
                    color: HexColor("#1E1E1E"),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 26.h)),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Already a member?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: ' SIGN IN',
                style: TextStyle(
                  color: MyColors.mainColor.color,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(RoutesPath.signInPage);
                  },
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 50.w),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "By continuing, you agree to SDM's ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor("#EDEFF1"),
                    ),
                  ),
                  TextSpan(
                    text: "Terms of Use",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor("#EDEFF1"),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint('click Terms of Use');
                      },
                  ),
                  TextSpan(
                    text: " and confirm that you have read SDM's ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor("#EDEFF1"),
                    ),
                  ),
                  TextSpan(
                    text: "Privacy Policy.",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor("#EDEFF1"),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint('click Privacy Policy');
                      },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

/// 登陆动画
Widget loginBackgroundAnim(BuildContext context) {
  return Container(
    width: context.width,
    height: context.height,
    color: Colors.amber,
    child: LottieBuilder.asset("assets/lottie/home.json"),
  );
}
