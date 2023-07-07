// To parse this JSON data, do
//
//     final frenchiesRoleModel = frenchiesRoleModelFromJson(jsonString);

import 'dart:convert';

FrenchiesRoleModel frenchiesRoleModelFromJson(String str) => FrenchiesRoleModel.fromJson(json.decode(str));

String frenchiesRoleModelToJson(FrenchiesRoleModel data) => json.encode(data.toJson());

class FrenchiesRoleModel {
  List<Role> role;

  FrenchiesRoleModel({
    required this.role,
  });

  factory FrenchiesRoleModel.fromJson(Map<String, dynamic> json) => FrenchiesRoleModel(
    role: List<Role>.from(json["Role"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Role": List<dynamic>.from(role.map((x) => x.toJson())),
  };
}

class Role {
  int id;
  String roleName;

  Role({
    required this.id,
    required this.roleName,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["Id"],
    roleName: json["RoleName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "RoleName": roleName,
  };
}
