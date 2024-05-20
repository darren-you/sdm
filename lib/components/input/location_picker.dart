import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../enumm/color_enum.dart';
import '../container/custom_container.dart';

import '../../location/dto/city_dto.dart';
import '../../location/dto/countries_dto.dart';
import '../../location/dto/states_dto.dart';
import '../../location/location_util.dart';
import '../../services/app_init_service.dart';

// 定义确定回调函数
typedef EnterCallback = void Function(List<int> allSelectIndex);
typedef ConfirmCallback = void Function(
    CountryDTO? countryDTO, StateDTO? stateDTO, CityDTO? cityDTO);
typedef FirstSelectCallback = void Function(int selectIndex);
typedef SecondSelectCallback = void Function(int selectIndex);
typedef ThirdSelectCallback = void Function(int selectIndex);

class LocationPicker extends StatelessWidget {
  final String title;
  final int firstListDefaultSelect;
  final int secondListDefaultSelect;
  final int thirdListDefaultSelect;
  final FirstSelectCallback? firstSelectCallback;
  final SecondSelectCallback? secondSelectCallback;
  final ThirdSelectCallback? thirdSelectCallback;
  final VoidCallback? cancel; // 取消回调函数
  final ConfirmCallback? confirmCallback; // 确认回调函数

  const LocationPicker(
      {super.key,
      required this.title,
      this.firstListDefaultSelect = 0,
      this.secondListDefaultSelect = 0,
      this.thirdListDefaultSelect = 0,
      this.firstSelectCallback,
      this.secondSelectCallback,
      this.thirdSelectCallback,
      this.cancel,
      this.confirmCallback});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LocationPickerController(
        firstListDefaultSelect: firstListDefaultSelect,
        secondListDefaultSelect: secondListDefaultSelect,
        thirdListDefaultSelect: thirdListDefaultSelect,
      ),
      builder: (controller) {
        return Container(
          width: context.width,
          height: 248,
          margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
          color: Colors.white,
          child: Column(
            children: [
              // 标题
              Container(
                color: Colors.white,
                height: 76,
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // 滚动部分
              Container(
                height: 92,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                //color: Colors.amber,
                child: Row(
                  children: [
                    // item1List
                    Expanded(
                      child: Obx(
                        () => CupertinoPicker(
                          magnification: 1.1,
                          //squeeze: 1.36,
                          squeeze: 0.9,
                          //diameterRatio: 0.2,
                          useMagnifier: true,
                          itemExtent: 26,
                          scrollController: controller.firstScrollerController,
                          // This is called when selected item is changed.
                          onSelectedItemChanged: (int selectedItem) {
                            debugPrint("第一项: > > > $selectedItem");
                            firstSelectCallback?.call(selectedItem);
                            controller.selectCountry(selectedItem);
                            //controller.scrollerFirstList(selectedItem);
                          },
                          selectionOverlay: Container(
                            height: 26,
                            color: Colors.transparent,
                          ),
                          children: List<Widget>.generate(
                            controller.countriesNameList.length,
                            (int index) {
                              return Center(
                                child: Text(
                                  controller.countriesNameList[index]
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: controller.firstSelected == index
                                        ? MyColors.textMain.color
                                        : MyColors.textSecond.color,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Obx(
                        () => CupertinoPicker(
                          magnification: 1.1,
                          //squeeze: 1.36,
                          squeeze: 0.9,
                          //diameterRatio: 0.2,
                          useMagnifier: true,
                          itemExtent: 26,
                          scrollController: controller.secondScrollerController,
                          // This is called when selected item is changed.
                          onSelectedItemChanged: (int selectedItem) {
                            debugPrint("第二项: > > > $selectedItem");
                            secondSelectCallback?.call(selectedItem);
                            controller.selectState(selectedItem);
                          },
                          selectionOverlay: Container(
                            height: 26,
                            color: Colors.transparent,
                          ),
                          children: List<Widget>.generate(
                            controller.statesNameList.length,
                            (int index) {
                              return Center(
                                child: Text(
                                  controller.statesNameList[index].toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: controller.secondSelected == index
                                        ? MyColors.textMain.color
                                        : MyColors.textSecond.color,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Obx(
                        () => CupertinoPicker(
                          magnification: 1.1,
                          //squeeze: 1.36,
                          squeeze: 0.9,
                          //diameterRatio: 0.2,
                          useMagnifier: true,
                          itemExtent: 26,
                          scrollController: controller.thirdScrollerController,
                          onSelectedItemChanged: (int selectedItem) {
                            debugPrint("第三项: > > > $selectedItem");
                            thirdSelectCallback?.call(selectedItem);
                            controller.selectCity(selectedItem);
                          },
                          selectionOverlay: Container(
                            height: 26,
                            color: Colors.transparent,
                          ),
                          children: List<Widget>.generate(
                            controller.citiesNameList.length,
                            (int index) {
                              return Center(
                                child: Text(
                                  controller.citiesNameList[index].toString(),
                                  style: TextStyle(
                                    color: controller.thirdSelected == index
                                        ? MyColors.textMain.color
                                        : MyColors.textSecond.color,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 取消 | 确定 按钮
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 16, top: 16, right: 8, bottom: 16),
                        child: CustomContainer(
                          duration: const Duration(milliseconds: 200),
                          borderRadius: BorderRadius.circular(30),
                          color: MyColors.background.color,
                          child: Center(
                            child: Text(
                              "取消",
                              style: TextStyle(
                                color: MyColors.textMain.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () {
                            debugPrint("点击 取消 按钮...");
                            cancel?.call();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 8, top: 16, right: 16, bottom: 16),
                        //color: Colors.white,
                        child: CustomContainer(
                          duration: const Duration(milliseconds: 200),
                          borderRadius: BorderRadius.circular(30),
                          color: MyColors.iconBlue.color,
                          child: Center(
                            child: Text(
                              "确定",
                              style: TextStyle(
                                color: MyColors.textWhite.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () {
                            logger.i("点击 确定 按钮...");
                            if (confirmCallback != null) {
                              controller.confirmSelectLocation();
                              confirmCallback!(
                                  controller.selectCountryDTO,
                                  controller.selectStateDTO,
                                  controller.selectCityDTO);
                            }
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class LocationPickerController extends GetxController {
  int firstListDefaultSelect;
  int secondListDefaultSelect;
  int thirdListDefaultSelect;

  bool firstShow = true;

  late final firstScrollerController = FixedExtentScrollController();
  late final secondScrollerController = FixedExtentScrollController();
  late final thirdScrollerController = FixedExtentScrollController();

  /// 当前while picker选中
  var firstSelected = 0;
  var secondSelected = 0;
  var thirdSelected = 0;

  // 选中DTO
  CountryDTO? selectCountryDTO;
  StateDTO? selectStateDTO;
  CityDTO? selectCityDTO;

  // 数据
  late List<CountryDTO> countriesDTOList;
  late List<StateDTO> statesDTOList;
  late List<CityDTO> citiesDTOList;

  late final RxList<String> countriesNameList = <String>[].obs;
  late final RxList<String> statesNameList = <String>[].obs;
  late final RxList<String> citiesNameList = <String>[].obs;

  LocationPickerController({
    this.firstListDefaultSelect = 0,
    this.secondListDefaultSelect = 0,
    this.thirdListDefaultSelect = 0,
  });

  /// 选中国家
  void selectCountry(int selectIndex) {
    final countryId = countriesDTOList[selectIndex].countryId;
    final countryName = countriesDTOList[selectIndex].countryName;

    logger.i('countryId: $countryId, countryName: $countryName');
    statesDTOList =
        LocationUtil.getInstance().filterStatesByCountryId(countryId);
    statesNameList.value =
        LocationUtil.getInstance().convertToNameList(statesDTOList);

    logger.i('statesNameList: ${statesNameList.length}');
    // state可能为空，则city也为空
    if (statesDTOList.isNotEmpty) {
      citiesDTOList = LocationUtil.getInstance()
          .filterCitiesByStateId(statesDTOList[0].stateId);
      citiesNameList.value =
          LocationUtil.getInstance().convertToNameList(citiesDTOList);
    } else {
      citiesDTOList = [];
      citiesNameList.value = [];
    }

    firstSelected = selectIndex;
    secondScrollerController.animateToItem(0,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    if (statesDTOList.isNotEmpty) selectState(0);
    // 设置了默认选中项则不触发振动效果
    if (!firstShow) HapticFeedback.selectionClick();
    update();
  }

  /// 选中省份(州)
  void selectState(int selectIndex) {
    if (statesDTOList.isEmpty) return;
    final stateId = statesDTOList[selectIndex].stateId;
    final stateName = statesDTOList[selectIndex].stateName;

    logger.i(
        'selectIndex: $selectIndex, stateId: $stateId, stateName: $stateName');

    citiesDTOList = LocationUtil.getInstance().filterCitiesByStateId(stateId);
    citiesNameList.value =
        LocationUtil.getInstance().convertToNameList(citiesDTOList);

    logger.i('citiesDTOList: ${citiesDTOList.length}');

    secondSelected = selectIndex;
    thirdScrollerController.animateToItem(0,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    if (citiesDTOList.isNotEmpty) selectCity(0);
    // 设置了默认选中项则不触发振动效果
    if (!firstShow) HapticFeedback.selectionClick();
    update();
  }

  /// 选中City
  void selectCity(int selectIndex) {
    if (citiesDTOList.isEmpty) return;
    final cityId = citiesDTOList[selectIndex].cityId;
    final cityName = citiesDTOList[selectIndex].cityName;

    logger.i('cityId: $cityId, cityName: $cityName');

    thirdSelected = selectIndex;
    // 设置了默认选中项则不触发振动效果
    if (!firstShow) HapticFeedback.selectionClick();
    update();
  }

  /// 生成 country、state、city ID
  void confirmSelectLocation() {
    if (countriesDTOList.isNotEmpty) {
      selectCountryDTO = countriesDTOList[firstSelected];
    }
    if (statesDTOList.isNotEmpty) {
      selectStateDTO = statesDTOList[secondSelected];
    }
    if (citiesDTOList.isNotEmpty) {
      selectCityDTO = citiesDTOList[thirdSelected];
    }
  }

  @override
  void onInit() async {
    countriesDTOList = LocationUtil.getInstance().countriesList();
    statesDTOList = LocationUtil.getInstance().statesList();
    citiesDTOList = LocationUtil.getInstance().citiesList();

    logger.i(
        'countriesDTOList: ${countriesDTOList.length} statesDTOList: ${statesDTOList.length} citiesDTOList: ${citiesDTOList.length}');

    countriesNameList.value = LocationUtil.getInstance()
        .convertToNameList<CountryDTO>(countriesDTOList);
    statesNameList.value =
        LocationUtil.getInstance().convertToNameList<StateDTO>(statesDTOList);
    citiesNameList.value =
        LocationUtil.getInstance().convertToNameList<CityDTO>(citiesDTOList);

    logger.i(
        'countriesNameList: ${countriesNameList.length} statesNameList: ${statesNameList.length} citiesNameList: ${citiesNameList.length}');

    super.onInit();
  }

  /// 初始化列表选中项
  void _initSelect() {
    firstScrollerController.jumpToItem(firstListDefaultSelect);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("第一列更新后执行");
      secondScrollerController.jumpToItem(secondListDefaultSelect);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("第二列更新后执行");
      thirdScrollerController.jumpToItem(thirdListDefaultSelect);
      firstShow = false;
    });
  }

  @override
  void onReady() {
    super.onReady();
    _initSelect();
  }
}
