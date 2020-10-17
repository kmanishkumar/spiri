// To parse this JSON data, do
//
//     final areaModel = areaModelFromJson(jsonString);

import 'dart:convert';

List<AreaModel> areaModelFromJson(String str) =>
    List<AreaModel>.from(json.decode(str).map((x) => AreaModel.fromJson(x)));

String areaModelToJson(List<AreaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AreaModel {
  AreaModel({
    this.id,
    this.city,
    this.gpo,
  });

  int id;
  String city;
  String gpo;

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        id: json["id"],
        city: json["city"],
        gpo: json["gpo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "gpo": gpo,
      };
}
