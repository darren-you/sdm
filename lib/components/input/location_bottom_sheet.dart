import 'dart:ffi';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sdm/enumm/color_enum.dart';
import 'package:sdm/location/base_item_dto.dart';
import 'package:sdm/utils/assert_util.dart';
import 'package:sdm/utils/color_util.dart';

import '../../location/dto/city_dto.dart';
import '../../location/dto/countries_dto.dart';
import '../../location/dto/states_dto.dart';
import '../../location/location_util.dart';

class LocationBottomSheet extends StatelessWidget {
  const LocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LocationBottomSheetController(),
      builder: (controller) {
        return Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 360),
            curve: Curves.easeInOut,
            width: context.width,
            height: controller.isExpanded.value
                ? 342.h + _getbottomSheetHeight(controller)
                : 342.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r)),
            ),
            onEnd: controller.expandedAnimDone,
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.h),
                // Country
                GestureDetector(
                  onTap: controller.showCountryList,
                  child: Column(
                    children: [
                      Container(
                        height: 60.h,
                        color: Colors.transparent,
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Country',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Obx(
                                  () => Text(
                                    controller.selectCountryDTO.value == null
                                        ? ''
                                        : controller.selectCountryDTO.value!
                                            .text(),
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF999999),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                SvgPicture.asset(AssertUtil.iconGoDown),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.5.h,
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                        color: const Color(0xFFDEDEDE),
                      ),
                    ],
                  ),
                ),
                // State
                Visibility(
                  visible: _needShow(controller, LocationEnumm.state),
                  child: GestureDetector(
                    onTap: controller.showStateList,
                    child: Column(
                      children: [
                        Container(
                          height: 60.h,
                          color: Colors.transparent,
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'State',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Obx(
                                    () => Text(
                                      controller.selectStateDTO.value == null
                                          ? ''
                                          : controller.selectStateDTO.value!
                                              .text(),
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF999999),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  SvgPicture.asset(AssertUtil.iconGoDown),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 0.5.h,
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          color: const Color(0xFFDEDEDE),
                        ),
                      ],
                    ),
                  ),
                ),
                // City
                Visibility(
                  visible: _needShow(controller, LocationEnumm.city),
                  child: GestureDetector(
                    onTap: controller.showCityList,
                    child: Column(
                      children: [
                        Container(
                          height: 60.h,
                          color: Colors.transparent,
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'City',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Obx(
                                    () => Text(
                                      controller.selectCityDTO.value == null
                                          ? ''
                                          : controller.selectCityDTO.value!
                                              .text(),
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF999999),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  SvgPicture.asset(AssertUtil.iconGoDown),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 0.5.h,
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          color: const Color(0xFFDEDEDE),
                        ),
                      ],
                    ),
                  ),
                ),
                // 隐藏的Country列表
                Obx(() => controller.animDoned.value &&
                        controller.isExpanded.value
                    ? Container(
                        width: context.width,
                        height: 360.h,
                        //color: Colors.blue,
                        child: ListView.builder(
                          controller: controller.scrollController,
                          itemCount: controller.getListItemCount(),
                          itemBuilder: (context, index) {
                            final baseItemDTO =
                                controller.getListItemData()[index];
                            return GestureDetector(
                              onTap: () => controller.selectItem(baseItemDTO),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: context.width,
                                height: 50.h,
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                //color: ColorUtil.getRandomColor(),
                                color: Colors.transparent,
                                child: Text(
                                  baseItemDTO.text(),
                                  style: TextStyle(
                                    color: baseItemDTO.isSelect()
                                        ? MyColors.mainColor.color
                                        : MyColors.textMain.color,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox()),
                const Spacer(),
                // SAVE按钮
                GestureDetector(
                  onTap: () => controller.saveLocation(context),
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: context.mediaQueryPadding.bottom),
                    child: Center(
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: MyColors.mainColor.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  double _getbottomSheetHeight(LocationBottomSheetController controller) {
    double defaultHeight = 360.h;
    double itemHeight = 60.5.h;

    switch (controller.locationCurrentType.value) {
      case LocationEnumm.country:
        defaultHeight = defaultHeight - itemHeight * 2;
      case LocationEnumm.state:
        defaultHeight = defaultHeight - itemHeight;
      case LocationEnumm.city:
        defaultHeight = 360.h;
      default:
        defaultHeight = 360.h;
    }

    return defaultHeight;
  }

  bool _needShow(
      LocationBottomSheetController controller, LocationEnumm locationEnumm) {
    switch (locationEnumm) {
      case LocationEnumm.state:
        if (controller.locationCurrentType.value == LocationEnumm.country) {
          return false;
        }
      case LocationEnumm.city:
        if (controller.locationCurrentType.value == LocationEnumm.country ||
            controller.locationCurrentType.value == LocationEnumm.state) {
          return false;
        }
      default:
        return true;
    }

    return true;
  }
}

class LocationBottomSheetController extends GetxController {
  var isExpanded = false.obs;
  var animDoned = false.obs;
  Rx<LocationEnumm> locationCurrentType = LocationEnumm.none.obs;
  final ScrollController scrollController = ScrollController();
  // 数据
  late List<CountryDTO> countriesDTOList;
  late List<StateDTO> statesDTOList;
  late List<CityDTO> citiesDTOList;

  // 选中的Location信息
  var selectCountryDTO = Rx<BaseItemDTO?>(null);
  var selectStateDTO = Rx<BaseItemDTO?>(null);
  var selectCityDTO = Rx<BaseItemDTO?>(null);

  /// 展开动画结束
  void expandedAnimDone() {
    if (!isExpanded.value) locationCurrentType.value = LocationEnumm.none;
    animDoned.value = true;
  }

  void showCountryList() {
    animDoned.value = false;
    isExpanded.value = !isExpanded.value;
    locationCurrentType.value = LocationEnumm.country;
    // Future.delayed(const Duration(milliseconds: 400), () {
    //   scrollController.attach((position) {});
    // });
  }

  void showStateList() {
    if (selectCountryDTO.value == null || statesDTOList.isEmpty) return;
    animDoned.value = false;
    isExpanded.value = !isExpanded.value;
    locationCurrentType.value = LocationEnumm.state;
  }

  void showCityList() {
    if (selectStateDTO.value == null || citiesDTOList.isEmpty) return;
    animDoned.value = false;
    isExpanded.value = !isExpanded.value;
    locationCurrentType.value = LocationEnumm.city;
  }

  /// 选中Item
  void selectItem(BaseItemDTO baseItemDTO) {
    final oldSelectState = baseItemDTO.isSelect();
    final itemOriginDTO = baseItemDTO.originDTO;

    if (itemOriginDTO is CountryDTO) {
      // 先清除所有选中状态
      for (var item in countriesDTOList) {
        item.cancelSelect();
      }
      selectCountryDTO.value = oldSelectState ? null : baseItemDTO;
      selectCountry(selectCountryDTO.value);
    } else if (itemOriginDTO is StateDTO) {
      for (var item in statesDTOList) {
        item.cancelSelect();
      }
      selectStateDTO.value = oldSelectState ? null : baseItemDTO;
      selectState(selectStateDTO.value);
    } else if (itemOriginDTO is CityDTO) {
      for (var item in citiesDTOList) {
        item.cancelSelect();
      }
      selectCityDTO.value = oldSelectState ? null : baseItemDTO;
    }

    baseItemDTO.setSelectState(!oldSelectState);

    // 手动刷新
    update();
  }

  int getListItemCount() {
    switch (locationCurrentType.value) {
      case LocationEnumm.country:
        return countriesDTOList.length;
      case LocationEnumm.state:
        return statesDTOList.length;
      case LocationEnumm.city:
        return citiesDTOList.length;
      case LocationEnumm.none:
        return 0;
    }
  }

  List<BaseItemDTO> getListItemData() {
    switch (locationCurrentType.value) {
      case LocationEnumm.country:
        return countriesDTOList;
      case LocationEnumm.state:
        return statesDTOList;
      case LocationEnumm.city:
        return citiesDTOList;
      case LocationEnumm.none:
        return [];
    }
  }

  /// 保存地址
  void saveLocation(BuildContext context) {
    Navigator.pop(context);
    removeAllSelect();
  }

  /// 选中国家
  void selectCountry(BaseItemDTO? baseItemDTO) {
    if (baseItemDTO == null) {
      // 未选中国家
      statesDTOList = [];
      citiesDTOList = [];
      return;
    }

    final countryDTO = baseItemDTO as CountryDTO;
    final countryId = countryDTO.countryId;

    statesDTOList =
        LocationUtil.getInstance().filterStatesByCountryId(countryId);
    update();
  }

  /// 选中省份(州)
  void selectState(BaseItemDTO? baseItemDTO) {
    if (baseItemDTO == null) {
      // 未选区
      citiesDTOList = [];
      return;
    }

    final stateDTO = baseItemDTO as StateDTO;
    final stateId = stateDTO.stateId;

    citiesDTOList = LocationUtil.getInstance().filterCitiesByStateId(stateId);
    update();
  }

  /// 选中City
  void selectCity(BaseItemDTO baseItemDTO) {
    update();
  }

  ///清除所有选中状态
  void removeAllSelect() {
    for (var item in countriesDTOList) {
      item.cancelSelect();
    }
    for (var item in statesDTOList) {
      item.cancelSelect();
    }
    for (var item in citiesDTOList) {
      item.cancelSelect();
    }
  }

  @override
  void onInit() {
    countriesDTOList = LocationUtil.getInstance().countriesList();
    statesDTOList = LocationUtil.getInstance().statesList();
    citiesDTOList = LocationUtil.getInstance().citiesList();

    super.onInit();
  }

  @override
  void onClose() {
    removeAllSelect();
    super.onClose();
  }
}

enum LocationEnumm {
  country,
  state,
  city,
  none,
}
