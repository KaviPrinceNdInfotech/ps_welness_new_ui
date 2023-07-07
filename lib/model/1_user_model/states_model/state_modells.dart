// To parse this JSON data, do
//
//     final statesModel = statesModelFromJson(jsonString);

import 'dart:convert';

StatesModel statesModelFromJson(String str) =>
    StatesModel.fromJson(json.decode(str));

String statesModelToJson(StatesModel data) => json.encode(data.toJson());

class StatesModel {
  StatesModel({
    required this.states,
  });

  List<StateModel> states;

  factory StatesModel.fromJson(Map<String, dynamic> json) => StatesModel(
        states: List<StateModel>.from(
            json["States"].map((x) => StateModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "States": List<dynamic>.from(states.map((x) => x.toJson())),
      };
}

class StateModel {
  StateModel({
    required this.id,
    required this.stateName,
    required this.isDeleted,
  });

  int id;
  String stateName;
  bool isDeleted;

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["Id"],
        stateName: json["StateName"],
        isDeleted: json["IsDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "StateName": stateName,
        "IsDeleted": isDeleted,
      };
}
