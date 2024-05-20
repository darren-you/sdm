import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sdm/business/account/sign_up/cover_page_controller.dart';
import 'package:sdm/enumm/color_enum.dart';

import '../../../components/view/custom_body.dart';
import '../../../utils/assert_util.dart';
import '../../../utils/color_util.dart';
import '../../../utils/routes_util.dart';
import '../view/title_bar.dart';

class CoverPage extends GetView<CoverPageController> {
  const CoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight = context.mediaQueryPadding.top + 83.h;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomBody(
        scroller: false,
        appBarHeight: appBarHeight,
        appBar: const CustomSignTitleBar(title: 'Cover'),
        body: Column(
          children: [
            // 分割线
            Container(
              width: context.width,
              height: 0.5.h,
              color: HexColor("#D4D6D8"),
            ),
            // 用户头像
            _userCover(context, controller),
            // 底部插画
            _bottomPic(context),
          ],
        ),
      ),
    );
  }
}

/// 用户头像
Widget _userCover(BuildContext context, CoverPageController controller) {
  return Container(
    width: context.width,
    height: 336.h,
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Upload a photo',
          style: TextStyle(
            color: MyColors.mainColor.color,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 48.h),
        GestureDetector(
          onTap: () => controller.getImage(context),
          child: Obx(
            () => (null == controller.userAvatarImg.value)
                ? Container(
                    width: 164.w,
                    height: 164.w,
                    decoration: BoxDecoration(
                      color: MyColors.mainColor.color.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: MyColors.mainColor.color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(56.w),
                        child: SvgPicture.asset(
                          AssertUtil.iconCoverAdd,
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: 164.w,
                    height: 164.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ExtendedImage.memory(
                      controller.userAvatarImg.value!,
                      fit: BoxFit.contain,
                      //mode: ExtendedImageMode.editor,
                    ),
                  ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RoutesPath.coverPage);
              },
              child: Obx(
                () => Container(
                  width: 94.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: controller.coverImgState.value
                        ? MyColors.mainColor.color
                        : MyColors.inputiHintColor.color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48.r),
                      bottomLeft: Radius.circular(48.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: controller.coverImgState.value
                            ? HexColor("#DD73EC").withOpacity(0.72)
                            : MyColors.inputiHintColor.color,
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
        ),
      ],
    ),
  );
}

/// 底部插画
Widget _bottomPic(BuildContext context) {
  return Expanded(
    child: SvgPicture.asset(
      AssertUtil.bgCover,
      fit: BoxFit.cover,
    ),
  );
}
