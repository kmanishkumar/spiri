// To parse this JSON data, do
//
//     final getCategoryModel = getCategoryModelFromJson(jsonString);

import 'dart:convert';

List<GetCategoryModel> getCategoryModelFromJson(String str) =>
    List<GetCategoryModel>.from(
        json.decode(str).map((x) => GetCategoryModel.fromJson(x)));

String getCategoryModelToJson(List<GetCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCategoryModel {
  GetCategoryModel({
    this.id,
    this.category,
    this.categoryImage,
    this.categoryType,
  });

  int id;
  String category;
  String categoryImage;
  String categoryType;

  factory GetCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetCategoryModel(
        id: json["id"],
        category: json["category"],
        categoryImage: json["categoryImage"],
        categoryType: json["categoryType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "categoryImage": categoryImage,
        "categoryType": categoryType,
      };
}
