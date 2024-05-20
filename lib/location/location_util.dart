import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:sdm/location/dto/city_dto.dart';
import 'package:sdm/location/dto/countries_dto.dart';
import 'package:sdm/location/dto/states_dto.dart';
import 'package:sdm/services/app_init_service.dart';
import 'package:sdm/utils/assert_util.dart';

import '../components/view/we_chat_loading.dart';

class LocationUtil {
  late final List<CountryDTO>? _countriesList;
  late final List<StateDTO>? _statesList;
  late final List<CityDTO>? _citiesList;
  bool _haveInit = false;

  static final LocationUtil _locationUtil = LocationUtil._();

  LocationUtil._();

  factory LocationUtil() {
    return _locationUtil;
  }

  static LocationUtil getInstance() => LocationUtil();

  /// 读取country数据
  Future<List<CountryDTO>> _getCountriesList() async {
    final countriesList = <CountryDTO>[];

    final countriesDTO = CountriesDTO.fromJson(
        jsonDecode(await rootBundle.loadString(AssertUtil.countriesJsonData)));

    final CountriesResult result = countriesDTO.results[0];

    for (var country in result.items) {
      countriesList.add(country);
    }

    return countriesList;
  }

  /// 读取states数据
  Future<List<StateDTO>> _getStatesList() async {
    final statesList = <StateDTO>[];
    final statesDTO = StatesDTO.fromJson(
        jsonDecode(await rootBundle.loadString(AssertUtil.statesJsonData)));
    final StatesResult statesResult = statesDTO.results[0];

    for (var state in statesResult.items) {
      statesList.add(state);
    }

    return statesList;
  }

  /// 读取states数据
  Future<List<CityDTO>> _getCitiesList() async {
    final citiesList = <CityDTO>[];
    final citiesDTO = CitiesDTO.fromJson(
        jsonDecode(await rootBundle.loadString(AssertUtil.citiesJsonData)));
    final CityResult cityResult = citiesDTO.results[0];

    for (var city in cityResult.items) {
      citiesList.add(city);
    }

    return citiesList;
  }

  Future<void> initLocationData() async {
    if (!_haveInit) {
      SmartDialog.show(
        backDismiss: false,
        clickMaskDismiss: false,
        maskColor: Colors.transparent,
        useAnimation: false,
        builder: (BuildContext context) {
          return const CircleLoadingIndicator();
        },
      );

      _countriesList = await _getCountriesList();
      _statesList = await _getStatesList();
      _citiesList = await _getCitiesList();
      _haveInit = true;

      SmartDialog.dismiss();
    }
  }

  List<CountryDTO> countriesList() {
    if (_haveInit) {
      return _countriesList!;
    } else {
      throw Exception("Location data not init!");
    }
  }

  List<StateDTO> statesList() {
    if (_haveInit) {
      return _statesList!;
    } else {
      throw Exception("Location data not init!");
    }
  }

  List<CityDTO> citiesList() {
    if (_haveInit) {
      return _citiesList!;
    } else {
      throw Exception("Location data not init!");
    }
  }

  /// 获取country_id下states数据
  List<StateDTO> filterStatesByCountryId(int countryId) {
    final List<StateDTO> filterStatesList = [];

    for (var stateDTO in statesList()) {
      if (stateDTO.countryId == countryId) {
        filterStatesList.add(stateDTO);
      }
    }

    return filterStatesList;
  }

  /// 获取state_id下city数据
  List<CityDTO> filterCitiesByStateId(int stateId) {
    final List<CityDTO> filterCitiesList = [];
    final cities = citiesList();
    logger.d('cities > > ${cities.length}');

    for (var cityDTO in citiesList()) {
      if (cityDTO.stateId == stateId) {
        filterCitiesList.add(cityDTO);
      }
    }

    return filterCitiesList;
  }

  /// DTO 转换为国家、省（州）、地点 名 List
  List<String> convertToNameList<T>(List<T> originData) {
    final List<String> convertList = [];
    if (originData.isEmpty) return convertList;

    if (originData[0] is CountryDTO) {
      for (var countryDTO in originData) {
        convertList.add((countryDTO as CountryDTO).countryName);
      }
    } else if (originData[0] is StateDTO) {
      for (var stateDTO in originData) {
        convertList.add((stateDTO as StateDTO).stateName);
      }
    } else if (originData[0] is CityDTO) {
      for (var cityDTO in originData) {
        convertList.add((cityDTO as CityDTO).cityName);
      }
    }

    return convertList;
  }

  /// 获取Country的index
  int getCountryIndex(CountryDTO? countryDTO) {
    int selectCountryIndex = 0;
    if (countryDTO != null) {
      selectCountryIndex = _countriesList!.indexOf(countryDTO);
    }
    return selectCountryIndex;
  }

  /// 获取State的index
  int getStateIndex(CountryDTO? countryDTO, StateDTO? stateDTO) {
    int selectStateIndex = 0;
    if (countryDTO != null) {
      final stateList = filterStatesByCountryId(countryDTO.countryId);
      if (stateList.isNotEmpty && stateDTO != null) {
        selectStateIndex = stateList.indexOf(stateDTO);
      }
    }

    return selectStateIndex;
  }

  /// 获取City的index
  int getCityIndex(
      CountryDTO? countryDTO, StateDTO? stateDTO, CityDTO? cityDTO) {
    int selectCityIndex = 0;
    if (countryDTO != null) {
      final stateList = filterStatesByCountryId(countryDTO.countryId);
      if (stateList.isNotEmpty && stateDTO != null && cityDTO != null) {
        final cityList = filterCitiesByStateId(stateDTO.stateId);
        return cityList.isNotEmpty ? cityList.indexOf(cityDTO) : 0;
      }
    }

    return selectCityIndex;
  }
}
