import 'dart:convert';

import 'package:async_loader/async_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:spiri/api/api.dart';
import 'package:spiri/model/getdetailsSignUp.dart';
import 'package:spiri/services/errorHandler.dart';
import 'package:spiri/services/network/dio_client.dart';
import 'package:spiri/services/storage.dart';

class SignUpPageRepo {
  GlobalKey<AsyncLoaderState> _globalKey = GlobalKey<AsyncLoaderState>();

  GlobalKey<AsyncLoaderState> get globalKey => _globalKey;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;
  static getImageUrl(url) {
    return url.replaceAll("\\", "/");
  }

  static getAllCity() async {
    final _apiCall = RestClient(DioClient.getDio());
    return await _apiCall.getAllCity().then((data) {
      return data;
    }).catchError((e) => ErrorHandler.handleError(e));
  }

  static getAllArea(city) async {
    final _apiCall = RestClient(DioClient.getDio());
    return await _apiCall.getAllArea(city).then((data) {
      return data;
    }).catchError((e) => ErrorHandler.handleError(e));
  }

  static getAllPhotos() async {
    final _apiCall = RestClient(DioClient.getDio());
    final token = await StorageService.getToken();
    return await _apiCall.getAllPhotos(token).then((data) {
      return data;
    }).catchError((e) => ErrorHandler.handleError(e));
  }

  static createUser(name, gpo) async {
    Map map = {'name': name, 'gpo': gpo};
    final _apiCall = RestClient(DioClient.getDio());
    return await _apiCall.createUser(json.encode(map)).then((data) {
      return data;
    }).catchError((e) => ErrorHandler.handleError(e));
  }

//  CityModel _userProfile = CityModel();
////  CityModel get userProfile => _userProfile;
//     static getAllCity() async {
//    final _apiCall = RestClient(DioClient.getDio());
//    //final email = await StorageService.getEmail();
//    return await _apiCall.getAllCity().then((value) {
//      print(value);
//      //_userProfile = value;
//      //print(_userProfile);
//      print('value $value');
//      return null;
//    }).catchError((e) => ErrorHandler.handleError(e));
//  }

}
