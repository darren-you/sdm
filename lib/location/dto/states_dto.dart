// To parse this JSON data, do
//
//     final statesDto = statesDtoFromJson(jsonString);

import 'dart:convert';

import 'package:sdm/location/base_item_dto.dart';

StatesDTO statesDtoFromJson(String str) => StatesDTO.fromJson(json.decode(str));

String statesDtoToJson(StatesDTO data) => json.encode(data.toJson());

class StatesDTO {
  List<StatesResult> results;

  StatesDTO({
    required this.results,
  });

  factory StatesDTO.fromJson(Map<String, dynamic> json) => StatesDTO(
        results: List<StatesResult>.from(
            json["results"].map((x) => StatesResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class StatesResult {
  List<StatesColumnDTO> columns;
  List<StateDTO> items;

  StatesResult({
    required this.columns,
    required this.items,
  });

  factory StatesResult.fromJson(Map<String, dynamic> json) => StatesResult(
        columns: List<StatesColumnDTO>.from(
            json["columns"].map((x) => StatesColumnDTO.fromJson(x))),
        items:
            List<StateDTO>.from(json["items"].map((x) => StateDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "columns": List<dynamic>.from(columns.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class StatesColumnDTO {
  String name;
  String type;

  StatesColumnDTO({
    required this.name,
    required this.type,
  });

  factory StatesColumnDTO.fromJson(Map<String, dynamic> json) =>
      StatesColumnDTO(
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
      };
}

class StateDTO extends BaseItemDTO {
  int stateId;
  String stateName;
  String stateAbbr;
  int countryId;
  int parentStateId;
  int obsolete;

  StateDTO({
    required this.stateId,
    required this.stateName,
    required this.stateAbbr,
    required this.countryId,
    required this.parentStateId,
    required this.obsolete,
  });

  factory StateDTO.fromJson(Map<String, dynamic> json) => StateDTO(
        stateId: json["state_id"],
        stateName: json["state_name"],
        stateAbbr: json["state_abbr"],
        countryId: json["country_id"],
        parentStateId: json["parent_state_id"],
        obsolete: json["obsolete"],
      );

  Map<String, dynamic> toJson() => {
        "state_id": stateId,
        "state_name": stateName,
        "state_abbr": stateAbbr,
        "country_id": countryId,
        "parent_state_id": parentStateId,
        "obsolete": obsolete,
      };

  @override
  String text() {
    return stateName;
  }

  @override
  get originDTO => this;
}
