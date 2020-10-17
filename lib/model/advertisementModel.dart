// To parse this JSON data, do
//
//     final advertismentImageModel = advertismentImageModelFromJson(jsonString);

import 'dart:convert';

List<AdvertismentImageModel> advertismentImageModelFromJson(String str) => List<AdvertismentImageModel>.from(json.decode(str).map((x) => AdvertismentImageModel.fromJson(x)));

String advertismentImageModelToJson(List<AdvertismentImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvertismentImageModel {
  AdvertismentImageModel({
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

  factory AdvertismentImageModel.fromJson(Map<String, dynamic> json) => AdvertismentImageModel(
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
