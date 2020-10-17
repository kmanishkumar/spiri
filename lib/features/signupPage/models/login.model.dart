// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.msg,
    this.authToken,
    this.id,
    this.statusCode,
  });

  String msg;
  String authToken;
  int id;
  int statusCode;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        msg: json["msg"],
        authToken: json["authToken"],
        id: json["id"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "authToken": authToken,
        "id": id,
        "statusCode": statusCode,
      };
}
