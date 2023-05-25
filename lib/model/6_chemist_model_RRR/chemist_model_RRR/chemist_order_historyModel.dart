
import 'dart:convert';

ChemistOrderHistoryModel chemistOrderHistoryFromJson(String str) => ChemistOrderHistoryModel.fromJson(json.decode(str));

String chemistOrderHistoryToJson(ChemistOrderHistoryModel data) => json.encode(data.toJson());

class ChemistOrderHistoryModel {
  List<Chmi1>? chmi1;

  ChemistOrderHistoryModel({
    this.chmi1,
  });

  factory ChemistOrderHistoryModel.fromJson(Map<String, dynamic> json) => ChemistOrderHistoryModel(
    chmi1: json["chmi1"] == null ? [] : List<Chmi1>.from(json["chmi1"]!.map((x) => Chmi1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "chmi1": chmi1 == null ? [] : List<dynamic>.from(chmi1!.map((x) => x.toJson())),
  };
}

class Chmi1 {
  int? id;
  String? chemistName;
  String? mobileNumber;
  String? cityname;
  String? stateName;
  String? location;
  num? amount;

  Chmi1({
    this.id,
    this.chemistName,
    this.mobileNumber,
    this.cityname,
    this.stateName,
    this.location,
    this.amount,
  });

  factory Chmi1.fromJson(Map<String, dynamic> json) => Chmi1(
    id: json["Id"],
    chemistName: json["ChemistName"],
    mobileNumber: json["MobileNumber"],
    cityname: json["cityname"],
    stateName: json["StateName"],
    location: json["Location"],
    amount: json["Amount"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ChemistName": chemistName,
    "MobileNumber": mobileNumber,
    "cityname": cityname,
    "StateName": stateName,
    "Location": location,
    "Amount": amount,
  };
}
