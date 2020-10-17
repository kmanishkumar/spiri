// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

List<CityModel> cityModelFromJson(String str) => List<CityModel>.from(json.decode(str).map((x) => CityModel.fromJson(x)));

String cityModelToJson(List<CityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModel {
  CityModel({
    this.id,
    this.advertisementImage1,
    this.advertisementImage2,
    this.advertisementImage3,
    this.advertisementImage4,
  });

  dynamic id;
  String advertisementImage1;
  String advertisementImage2;
  String advertisementImage3;
  String advertisementImage4;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json["id"],
    advertisementImage1: json["advertisementImage1"],
    advertisementImage2: json["advertisementImage2"],
    advertisementImage3: json["advertisementImage3"],
    advertisementImage4: json["advertisementImage4"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "advertisementImage1": advertisementImage1,
    "advertisementImage2": advertisementImage2,
    "advertisementImage3": advertisementImage3,
    "advertisementImage4": advertisementImage4,
  };
}
