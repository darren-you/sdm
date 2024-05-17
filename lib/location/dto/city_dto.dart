// To parse this JSON data, do
//
//     final cityDto = cityDtoFromJson(jsonString);

import 'dart:convert';

CitiesDTO cityDtoFromJson(String str) => CitiesDTO.fromJson(json.decode(str));

String cityDtoToJson(CitiesDTO data) => json.encode(data.toJson());

class CitiesDTO {
  List<CityResult> results;

  CitiesDTO({
    required this.results,
  });

  factory CitiesDTO.fromJson(Map<String, dynamic> json) => CitiesDTO(
        results: List<CityResult>.from(
            json["results"].map((x) => CityResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class CityResult {
  List<CityColumnDTO> columns;
  List<CityDTO> items;

  CityResult({
    required this.columns,
    required this.items,
  });

  factory CityResult.fromJson(Map<String, dynamic> json) => CityResult(
        columns: List<CityColumnDTO>.from(
            json["columns"].map((x) => CityColumnDTO.fromJson(x))),
        items:
            List<CityDTO>.from(json["items"].map((x) => CityDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "columns": List<dynamic>.from(columns.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class CityColumnDTO {
  String name;
  String type;

  CityColumnDTO({
    required this.name,
    required this.type,
  });

  factory CityColumnDTO.fromJson(Map<String, dynamic> json) => CityColumnDTO(
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
      };
}

class CityDTO {
  int cityId;
  String cityName;
  int stateId;
  String geoNameId;
  String latitude;
  String longitude;

  CityDTO({
    required this.cityId,
    required this.cityName,
    required this.stateId,
    required this.geoNameId,
    required this.latitude,
    required this.longitude,
  });

  factory CityDTO.fromJson(Map<String, dynamic> json) => CityDTO(
        cityId: json["city_id"],
        cityName: json["city_name"],
        stateId: json["state_id"],
        geoNameId: json["geo_name_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "city_id": cityId,
        "city_name": cityName,
        "state_id": stateId,
        "geo_name_id": geoNameId,
        "latitude": latitude,
        "longitude": longitude,
      };
}
