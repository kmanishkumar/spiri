import 'dart:async';
import 'dart:convert';

import 'package:spiri/model/errorModel.dart';
import 'package:spiri/model/getdetailsSignUp.dart';

import 'common_http.dart';

class ApiCall {
  HttpCall _httpCall = new HttpCall();
  final JsonDecoder _decoder = new JsonDecoder();
  var statusCode;
  var convertRes;

  Future getSoul(data) {
    return _httpCall.get('city/get', data).then((dynamic res) {
      statusCode = res.statusCode;
      convertRes = _decoder.convert(res.body);
      return statusCode == 200
          ? CityModel.fromJson(convertRes)
          : ErrorModal.fromJson(convertRes);
    });
  }

  Future getAllImage(data) {
    return _httpCall.get('city/get', data).then((dynamic res) {
      statusCode = res.statusCode;
      convertRes = _decoder.convert(res.body);
      return statusCode == 200
          ? CityModel.fromJson(convertRes)
          : ErrorModal.fromJson(convertRes);
    });
  }
}
