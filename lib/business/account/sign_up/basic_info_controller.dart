import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdm/location/dto/city_dto.dart';
import 'package:sdm/location/dto/countries_dto.dart';
import 'package:sdm/location/dto/states_dto.dart';

class BasicInfoController extends GetxController {
  var mindInfo = ''.obs;
  var usernameCorrectState = false.obs;
  var locationCorrectState = false.obs;
  var location = 'Location'.obs;
  CountryDTO? selectCountryDTO;
  StateDTO? selectStateDTO;
  CityDTO? selsectCityDTO;
  var ageValue = 0.obs;
  var radioValue = 'Male'.obs;
  final TextEditingController usernameController = TextEditingController();

  /// 能否继续下一步
  bool canNext() {
    return (usernameCorrectState.value &&
        locationCorrectState.value &&
        ageValue.value != 0);
  }

  /// 选择位置
  void selectLocation(
      CountryDTO? countryDTO, StateDTO? stateDTO, CityDTO? cityDTO) {
    selectCountryDTO = countryDTO;
    selectStateDTO = stateDTO;
    selsectCityDTO = cityDTO;

    if (countryDTO != null && stateDTO != null && cityDTO != null) {
      location.value =
          '${countryDTO.countryName},${stateDTO.stateName},${cityDTO.cityName}';
    } else if (countryDTO != null && stateDTO != null) {
      location.value = '${countryDTO.countryName},${stateDTO.stateName}';
    } else if (countryDTO != null) {
      location.value = countryDTO.countryName;
    }

    locationCorrectState.value = true;
  }

  @override
  void onInit() {
    usernameController.addListener(() {
      final username = usernameController.text;
      usernameCorrectState.value = username.isNotEmpty;
    });

    super.onInit();
  }
}
