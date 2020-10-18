// To parse this JSON data, do
//
//     final getSubCategoryModel = getSubCategoryModelFromJson(jsonString);

import 'dart:convert';

List<GetSubCategoryModel> getSubCategoryModelFromJson(String str) =>
    List<GetSubCategoryModel>.from(
        json.decode(str).map((x) => GetSubCategoryModel.fromJson(x)));

String getSubCategoryModelToJson(List<GetSubCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetSubCategoryModel {
  GetSubCategoryModel({
    this.id,
    this.category,
    this.subCategory,
    this.content,
    this.subcategoryImage,
  });

  int id;
  String category;
  String subCategory;
  String content;
  String subcategoryImage;

  factory GetSubCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetSubCategoryModel(
        id: json["id"],
        category: json["category"],
        subCategory: json["subCategory"],
        content: json["content"],
        subcategoryImage: json["subcategoryImage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "subCategory": subCategory,
        "content": content,
        "subcategoryImage": subcategoryImage,
      };
}
