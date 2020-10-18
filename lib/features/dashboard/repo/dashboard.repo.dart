import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spiri/api/api.dart';
import 'package:spiri/services/errorHandler.dart';
import 'package:spiri/services/network/dio_client.dart';

class DashboardRepo extends ChangeNotifier {
  Map _userDetails;

  Map get userDetails => _userDetails;

  setUserDetails(Map val) {
    _userDetails = val;
    print(val["fullName"]);
    notifyListeners();
  }

  static getCategory() async {
    final _apiCall = RestClient(DioClient.getDio());
    return await _apiCall.getCategory('2').then((data) {
      return data;
    }).catchError((e) => ErrorHandler.handleError(e));
  }

  static getSubCategory(token, categoryId) async {
    final _apiCall = RestClient(DioClient.getDio());
    return await _apiCall.getSubCategory(token, categoryId).then((data) {
      return data;
    }).catchError((e) {
      print(e);
      ErrorHandler.handleError(e);
    });
  }
}
