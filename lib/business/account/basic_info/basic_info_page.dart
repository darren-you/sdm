import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sdm/business/account/basic_info/basic_info_controller.dart';
import 'package:sdm/components/input/location_bottom_sheet.dart';
import 'package:sdm/components/view/custom_bottom_sheet.dart';
import 'package:sdm/services/app_init_service.dart';

import '../../../components/input/custom_edit_normal.dart';
import '../../../components/view/custom_body.dart';
import '../../../enumm/color_enum.dart';
import '../../../location/location_util.dart';
import '../../../utils/assert_util.dart';
import '../../../utils/color_util.dart';
import '../view/title_bar.dart';
import '../sign_up/view/slide_track_shap.dart';

class BasicInfoPage extends GetView<BasicInfoController> {
  const BasicInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight = context.mediaQueryPadding.top + 83.h;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: CustomBody(
        scroller: false,
        appBarHeight: appBarHeight,
        appBar: const CustomSignTitleBar(title: 'Basic info'),
        body: Column(
          children: [
            /// 分割线
            Container(
              width: context.width,
              height: 0.5.h,
              color: HexColor("#D4D6D8"),
            ),

            // 信息输入
            _inputUserInfo(context, controller),

            // 插画
            Expanded(
              child: SvgPicture.asset(
                AssertUtil.bgBasicInfo,
                fit: BoxFit.cover,
              ),
            )
          ],
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
                leftIcon: SvgPicture.asset(AssertUtil.iconUsername),
                showSuffixIcon: false,
                hintText: 'Username',
                hintStyle: TextStyle(
                  fontSize: 18.sp,
                  color: MyColors.inputiHintColor.color,
                ),
              ),
              SizedBox(height: 28.h),
              GestureDetector(
                onTap: () async {
                  // await LocationUtil.getInstance().initLocationData().then(
                  //   (value) {
                  //     // showMyBottomSheet(
                  //     //   context,
                  //     //   showChild: LocationPicker(
                  //     //     title: 'Location',
                  //     //     firstListDefaultSelect: LocationUtil.getInstance()
                  //     //         .getCountryIndex(controller.selectCountryDTO),
                  //     //     secondListDefaultSelect: LocationUtil.getInstance()
                  //     //         .getStateIndex(controller.selectCountryDTO,
                  //     //             controller.selectStateDTO),
                  //     //     thirdListDefaultSelect: LocationUtil.getInstance()
                  //     //         .getCityIndex(
                  //     //             controller.selectCountryDTO,
                  //     //             controller.selectStateDTO,
                  //     //             controller.selsectCityDTO),
                  //     //     confirmCallback: (countryDTO, stateDTO, cityDTO) =>
                  //     //         controller.selectLocation(
                  //     //             countryDTO, stateDTO, cityDTO),
                  //     //   ),
                  //     // );

                  //     showMyBottomSheet(
                  //       context,
                  //       showChild: const LocationBottomSheet(),
                  //     );
                  //   },
                  // );
                  showMyBottomSheet(
                    context,
                    init: LocationUtil.getInstance().initLocationData(),
                    showChild: LocationBottomSheet(
                      defaultCountryDTO: controller.selectCountryDTO,
                      defaultStateDTO: controller.selectStateDTO,
                      defaultCityDTO: controller.selsectCityDTO,
                      saveCallback: (countryDTO, stateDTO, cityDTO) {
                        logger.i(
                            'country: ${countryDTO?.countryName} - state:${stateDTO?.stateName} - city:${cityDTO?.cityName}');
                        controller.selectLocation(
                            countryDTO, stateDTO, cityDTO);
                      },
                    ),
                  );
                },
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: MyColors.inputiHintBackgrounfColor.color,
                    borderRadius: BorderRadius.circular(48.h),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      SvgPicture.asset(AssertUtil.iconLocation),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Obx(
                            () => Text(
                              controller.location.value,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: controller.location.value == 'Location'
                                    ? MyColors.inputiHintColor.color
                                    : MyColors.textMain.color,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                    ],
                  ),
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
              onTap: controller.nextStep,
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
