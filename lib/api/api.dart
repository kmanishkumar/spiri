import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import 'package:spiri/model/getdetailsSignUp.dart';
import 'package:spiri/res/constant.dart';

part 'api.g.dart';

const String authorization = "Authorization";

@RestApi(baseUrl: 'http://35.154.23.129:8080/')
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("city/get")
  Future<List<CityModel>> getAllCity();

  @GET("api/v1/advertisement/get")
  Future<CityModel> getAllPhotos(@Header(authorization) auth);
}
