// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://35.154.23.129:8080/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<CityModel>> getAllCity() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('city/get',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => CityModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<AreaModel>> getAllArea(city) async {
    ArgumentError.checkNotNull(city, 'city');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'city': city};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('gpo/get',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => AreaModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<LoginModel> createUser(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>('user/register',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LoginModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<CityModel> getAllPhotos(auth) async {
    ArgumentError.checkNotNull(auth, 'auth');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/advertisement/get',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': auth},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CityModel.fromJson(_result.data);
    return value;
  }
}
