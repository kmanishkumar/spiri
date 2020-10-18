import 'package:auto_route/auto_route_annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import 'package:spiri/SpirianRequest/models/get_category.model.dart';
import 'package:spiri/SpirianRequest/models/get_sub_category.dart';
import 'package:spiri/features/signupPage/models/getArea.model.dart';
import 'package:spiri/features/signupPage/models/login.model.dart';
import 'package:spiri/model/advertisementModel.dart';
import 'package:spiri/model/getdetailsSignUp.dart';
import 'package:spiri/res/constant.dart';

part 'api.g.dart';

const String authorization = "Authorization";

@RestApi(baseUrl: 'http://35.154.23.129:8080/')
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("city/get")
  Future<List<CityModel>> getAllCity();

  @GET("gpo/get")
  Future<List<AreaModel>> getAllArea(@Query('city') String city);

  @GET("category/get")
  Future<List<GetCategoryModel>> getCategory(
      @Query('request_type') String type);

  @GET("api/v1/category/subcategory/get")
  Future<List<GetSubCategoryModel>> getSubCategory(
      @Header(authorization) token, @Query('category') String categoryId);

  @POST("user/register")
  Future<LoginModel> createUser(@Body() body);

  @GET("api/v1/advertisement/get")
  Future<List<AdvertismentImageModel>> getAllPhotos(
      @Header(authorization) auth);
}
