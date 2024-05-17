// To parse this JSON data, do
//
//     final countriesDto = countriesDtoFromJson(jsonString);

import 'dart:convert';

CountriesDTO countriesDtoFromJson(String str) =>
    CountriesDTO.fromJson(json.decode(str));

String countriesDtoToJson(CountriesDTO data) => json.encode(data.toJson());

class CountriesDTO {
  List<CountriesResult> results;

  CountriesDTO({
    required this.results,
  });

  factory CountriesDTO.fromJson(Map<String, dynamic> json) => CountriesDTO(
        results: List<CountriesResult>.from(
            json["results"].map((x) => CountriesResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class CountriesResult {
  List<CountryColumnDTO> columns;
  List<CountryDTO> items;

  CountriesResult({
    required this.columns,
    required this.items,
  });

  factory CountriesResult.fromJson(Map<String, dynamic> json) =>
      CountriesResult(
        columns: List<CountryColumnDTO>.from(
            json["columns"].map((x) => CountryColumnDTO.fromJson(x))),
        items: List<CountryDTO>.from(
            json["items"].map((x) => CountryDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "columns": List<dynamic>.from(columns.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class CountryColumnDTO {
  String name;
  String type;

  CountryColumnDTO({
    required this.name,
    required this.type,
  });

  factory CountryColumnDTO.fromJson(Map<String, dynamic> json) =>
      CountryColumnDTO(
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
      };
}

class CountryDTO {
  int countryId;
  String countryName;
  String countryAbbr;
  int weight;
  int isDeveloped;
  String countryCode;

  CountryDTO({
    required this.countryId,
    required this.countryName,
    required this.countryAbbr,
    required this.weight,
    required this.isDeveloped,
    required this.countryCode,
  });

  factory CountryDTO.fromJson(Map<String, dynamic> json) => CountryDTO(
        countryId: json["country_id"],
        countryName: json["country_name"],
        countryAbbr: json["country_abbr"],
        weight: json["weight"],
        isDeveloped: json["is_developed"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "country_name": countryName,
        "country_abbr": countryAbbr,
        "weight": weight,
        "is_developed": isDeveloped,
        "country_code": countryCode,
      };
}
