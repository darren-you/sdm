import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sdm/business/account/user_cover/cover_page_controller.dart';
import 'package:sdm/components/view/custom_bottom_sheet.dart';
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
        SizedBox(height: 24.h),

        // 选择图片
        GestureDetector(
          //onTap: () => controller.getImage(context),
          onTap: () => _chosePic(context, controller),
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

void _chosePic(BuildContext context, CoverPageController controller) {
  showMyBottomSheet(
    context,
    showChild: Container(
      width: context.width,
      height: 233.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 12.5.h),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              controller.getImageFromLibrary(context);
            },
            child: Container(
              alignment: Alignment.center,
              height: 60.h,
              color: Colors.transparent,
              child: Text(
                'Upload from library',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF131313),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => controller.takePhoto(context),
            child: Container(
              height: 60.h,
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Text(
                'Take from camera',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF131313),
                ),
              ),
            ),
          ),
          SizedBox(height: 12.5.h),
          Container(
            height: 0.5.h,
            color: const Color(0xFFDEDEDE),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                //color: Colors.red,
                child: Text(
                  'CANCEL',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFBDBDC7),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: context.mediaQueryPadding.bottom),
        ],
      ),
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
