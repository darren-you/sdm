import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sdm/enumm/color_enum.dart';
import 'package:sdm/utils/assert_util.dart';
import 'package:sdm/utils/color_util.dart';

import 'view/triangle_clipper.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor.color,
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Column(
          children: [
            /// 背景、头像、昵称、地区、设置
            SizedBox(
              width: context.width,
              height: 275.h,
              child: Stack(
                children: [
                  /// 用户头像背景
                  SizedBox(
                    width: context.width,
                    height: 205.h,
                    child: Stack(
                      children: [
                        /// 头像背景图片
                        Positioned.fill(
                          child: ExtendedImage.asset(
                            "assets/images/photo2.png",
                            fit: BoxFit.cover,
                          ),
                        ),

                        /// 高斯模糊
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              color:
                                  Colors.black.withOpacity(0.2), // 透明度可以根据需要调整
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// 头像、地址、设置
                  Positioned.fill(
                    child: Stack(
                      children: [
                        /// 斜切层
                        Positioned(
                          left: 0,
                          top: context.mediaQueryPadding.top + 44.h + 7.h,
                          right: 0,
                          child: ClipPath(
                            clipper: TriangleClipper(),
                            child: Container(
                              width: context.width,
                              height: 275.h -
                                  (context.mediaQueryPadding.top + 44.h + 7.h),
                              color: Colors.white, // 你可以设置你想要的颜色
                            ),
                          ),
                        ),

                        /// 用户头像、昵称、地址信息
                        Positioned.fill(
                          top: context.mediaQueryPadding.top + 44.h + 14.h,
                          child: Column(
                            children: [
                              ClipOval(
                                child: ExtendedImage.asset(
                                  "assets/images/photo2.png",
                                  width: 80.r,
                                  height: 80.r,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "DonaldOsborne",
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#1E1E1E"),
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  SvgPicture.asset(AssertUtil.iconMeEdit,
                                      width: 24.r, height: 24.r),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "M / 34 / Los Angeles, CA",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("#1E1E1E"),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// 设置icon
                        Positioned(
                          top: context.mediaQueryPadding.top,
                          right: 16.w,
                          child: SvgPicture.asset(AssertUtil.iconSetting,
                              width: 44.r, height: 44.r),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// 金额、个人其他信息
            Expanded(
              child: Stack(
                children: [
                  /// 账户金额Card
                  Container(
                    width: context.width,
                    height: 118.h,
                    margin: EdgeInsets.only(left: 24.w, top: 24.h, right: 24.w),
                    padding: EdgeInsets.only(
                      left: 30.w,
                      right: 30.w,
                      bottom: 62.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [HexColor("#FFC48C"), HexColor("#FFA149")],
                        stops: const [0.0, 1.0],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.r),
                        topRight: Radius.circular(18.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("#F50A3F").withOpacity(0.16),
                          offset: const Offset(0, 2.0),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Upgrade',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 0.5.w,
                            height: 20.h,
                            color: Colors.white,
                          ),
                          Text(
                            'Coines: 50',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// 底部个人信息
                  Positioned.fill(
                    child: Container(
                      margin: EdgeInsets.only(top: 80.h),
                      padding: EdgeInsets.only(
                          left: 24.w, top: 24.w, right: 24.w, bottom: 80.h),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(38.r),
                          topRight: Radius.circular(38.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: HexColor("#FFA754").withOpacity(0.23),
                            offset: const Offset(0, -2.0),
                            blurRadius: 11.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          /// 浏览、粉丝、点赞、喜欢
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Visitors',
                                    style: TextStyle(
                                      color:
                                          MyColors.myInfoSecondTextColor.color,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '200',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: MyColors.myInfoTextColor.color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Likes me',
                                    style: TextStyle(
                                      color:
                                          MyColors.myInfoSecondTextColor.color,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '180',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: MyColors.myInfoTextColor.color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Matches',
                                    style: TextStyle(
                                      color:
                                          MyColors.myInfoSecondTextColor.color,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '150',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: MyColors.myInfoTextColor.color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'My likes',
                                    style: TextStyle(
                                      color:
                                          MyColors.myInfoSecondTextColor.color,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '120',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: MyColors.myInfoTextColor.color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            width: context.width,
                            height: 94.h,
                            child: Column(
                              children: [
                                /// 照片标题
                                Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Photos(10)',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SvgPicture.asset(AssertUtil.iconGo),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return LayoutBuilder(
                                        builder: (context, constraints) {
                                          return Container(
                                            width: constraints.maxHeight,
                                            height: constraints.maxHeight,
                                            margin: EdgeInsets.only(right: 8.w),
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: ExtendedImage.asset(
                                              "assets/images/photo${index + 1}.png",
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            width: context.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Profile Completion: 20%',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 8.w),
                                      SvgPicture.asset(
                                        AssertUtil.iconMeCoin,
                                        width: 20.w,
                                        height: 20.w,
                                        fit: BoxFit.cover,
                                      ),
                                      const Expanded(child: SizedBox()),
                                      SvgPicture.asset(AssertUtil.iconGo),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8.h),
                                Text(
                                  'Complete your profile to grab 20 coins.',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: HexColor("#5D5D5D")),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            width: context.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Verify Profile',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 8.w),
                                      SvgPicture.asset(
                                        AssertUtil.iconMeCoin,
                                        width: 20.w,
                                        height: 20.w,
                                        fit: BoxFit.cover,
                                      ),
                                      const Expanded(child: SizedBox()),
                                      SvgPicture.asset(AssertUtil.iconGo),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8.h),
                                Text(
                                  'Verify your profile to grab 20 coins.',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: HexColor("#5D5D5D")),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            width: context.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Private Photo Requests',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SvgPicture.asset(AssertUtil.iconGo),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
