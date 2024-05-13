import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/view/custom_body.dart';
import '../../enumm/color_enum.dart';
import '../../utils/assert_util.dart';
import '../../utils/color_util.dart';

class VoicePage extends StatelessWidget {
  const VoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        enableAppBarPadding: false,
        scroller: false,
        body: Stack(
          children: [
            /// 摇一摇页
            Container(
              width: context.width,
              height: context.height,
              color: MyColors.mainColor.color,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    width: context.width,
                    height: 38.h,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 16.w,
                          child: GestureDetector(
                            child: SizedBox(
                              width: 26.w,
                              height: 26.h,
                              child: SvgPicture.asset(AssertUtil.iconLike),
                            ),
                            onTap: () {},
                          ),
                        ),
                        Positioned(
                          right: 16.w,
                          child: GestureDetector(
                            child: SizedBox(
                              width: 26.w,
                              height: 26.h,
                              child: SvgPicture.asset(AssertUtil.iconMenu),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 14.h)),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.94),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.r),
                            topRight: Radius.circular(50.r)),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin: EdgeInsets.only(top: 40.h),
                              child: Column(
                                children: [
                                  Text(
                                    'Voice Match',
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.h),
                                  ),
                                  Container(
                                    width: context.width,
                                    alignment: Alignment.center,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 34.w),
                                    child: Text(
                                      "Shake the phone to connect with friends in the world who are also shaking their phones",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 75.h),
                                    width: 220.w,
                                    height: 220.h,
                                    child: SvgPicture.asset(
                                        AssertUtil.picVoiceMatch1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 8.w,
                            top: 216.h,
                            child: Container(
                              width: 56.w,
                              height: 189.h,
                              padding: EdgeInsets.symmetric(
                                  vertical: 13.h, horizontal: 4.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: MyColors.mainColor.color
                                        .withOpacity(0.17),
                                    offset: const Offset(0, 2.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 48.w,
                                    height: 48.h,
                                    child: SvgPicture.asset(
                                      AssertUtil.iconMan,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 48.w,
                                    height: 48.h,
                                    child: SvgPicture.asset(
                                      AssertUtil.iconWomanSelect,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 48.w,
                                    height: 48.h,
                                    child: SvgPicture.asset(
                                      AssertUtil.iconBoth,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: 0,
              bottom: 126.h,
              child: Container(
                width: 80.w,
                height: 64.h,
                padding: EdgeInsets.symmetric(vertical: 2.h),
                decoration: BoxDecoration(
                  color: MyColors.mainColor.color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.r),
                      bottomLeft: Radius.circular(32.r)),
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.mainColor.color.withOpacity(0.6),
                      offset: const Offset(2, 2),
                      blurRadius: 15.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Center(
                  child: SizedBox(
                    width: 49.w,
                    height: 39.h,
                    child: SvgPicture.asset(AssertUtil.iconShare),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 16.w,
              bottom: 126.h,
              child: Container(
                width: 142.w,
                height: 36.h,
                padding: EdgeInsets.symmetric(vertical: 2.h),
                decoration: BoxDecoration(
                  color: HexColor("#EEEEEE"),
                  borderRadius: BorderRadius.all(Radius.circular(36.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 26.w,
                      height: 26.h,
                      margin: EdgeInsets.only(left: 4.w),
                      child: SvgPicture.asset(AssertUtil.iconCoin),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            vertical: 1.r, horizontal: 4.r),
                        padding: EdgeInsets.symmetric(
                            vertical: 7.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(26.r))),
                        child: Text(
                          '50 Coins left',
                          style: TextStyle(
                              color: HexColor("#1E1E1E"),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
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
