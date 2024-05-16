import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sdm/business/account/sign_up/basic_info_controller.dart';

import '../../../components/input/custom_edit_normal.dart';
import '../../../components/view/custom_body.dart';
import '../../../enumm/color_enum.dart';
import '../../../utils/assert_util.dart';
import '../../../utils/color_util.dart';
import '../view/title_bar.dart';
import 'view/slide_track_shap.dart';

class BasicInfoPage extends GetView<BasicInfoController> {
  const BasicInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight = context.mediaQueryPadding.top + 83.h;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomBody(
        scroller: false,
        appBarHeight: appBarHeight,
        appBar: const CustomSignTitleBar(title: 'Basic info'),
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
              _inputUserInfo(context, controller),

              /// 注册Card
              _bottomPic(context),
            ],
          ),
        ),
      ),
    );
  }
}

/// 登陆输入
Widget _inputUserInfo(BuildContext context, BasicInfoController controller) {
  return Container(
    width: context.width,
    height: 398.h,
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
                editController: controller.usernameController,
                height: 48.h,
                backgroundColor: MyColors.inputiHintBackgrounfColor.color,
                borderRadius: BorderRadius.circular(44.r),
                leftIcon: SvgPicture.asset(AssertUtil.iconEmail),
                showSuffixIcon: false,
                hintText: 'Username',
                hintStyle: TextStyle(
                  fontSize: 18.sp,
                  color: MyColors.inputiHintColor.color,
                ),
              ),
              SizedBox(height: 28.h),
              CustomEditNormal(
                editController: controller.locationController,
                height: 48.h,
                backgroundColor: MyColors.inputiHintBackgrounfColor.color,
                borderRadius: BorderRadius.circular(44.r),
                leftIcon: SvgPicture.asset(AssertUtil.iconPassword),
                hintText: 'Location',
                hintStyle: TextStyle(
                  fontSize: 18.sp,
                  color: MyColors.inputiHintColor.color,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('My age'),
                  Obx(() => Text(controller.ageValue.value.toString())),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: MyColors.mainColor.color,
                    inactiveTrackColor: MyColors.background.color,
                    thumbColor: Colors.white,
                    trackShape: CustomTrackShape(),
                    trackHeight: 0.5.h,
                  ),
                  child: Obx(
                    () => Slider(
                      value: controller.ageValue.value * 1.0,
                      onChanged: (double newValue) =>
                          controller.ageValue.value = newValue.round(),
                      onChangeEnd: (double newValue) =>
                          controller.ageValue.value = newValue.round(),
                      min: 0.0,
                      max: 100.0,
                      divisions: 100,
                      //label: controller.ageValue.value.toString(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          alignment: Alignment.centerLeft,
          child: const Text('My gender'),
        ),
        Row(
          children: <Widget>[
            Obx(
              () => Radio(
                value: 'Male',
                groupValue: controller.radioValue.value,
                activeColor: Colors.black,
                onChanged: (data) => controller.radioValue.value = data!,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const Text(
              'Male',
              style: TextStyle(fontSize: 18.0),
            ),
            Obx(
              () => Radio(
                value: 'Female',
                groupValue: controller.radioValue.value,
                activeColor: Colors.black,
                onChanged: (data) => controller.radioValue.value = data!,
              ),
            ),
            const Text(
              'Female',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Obx(
                () => Container(
                  width: 94.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: controller.canNext()
                        ? MyColors.mainColor.color
                        : MyColors.inputiHintColor.color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48.r),
                      bottomLeft: Radius.circular(48.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: controller.canNext()
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
    child: Container(
      margin: EdgeInsets.only(
        bottom: context.mediaQueryPadding.bottom,
      ),
      child: SvgPicture.asset(
        AssertUtil.bgBasicInfo,
        fit: BoxFit.cover,
      ),
    ),
  );
}
