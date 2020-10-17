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
  Future<CityModel> getAllCity() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('city/get',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CityModel.fromJson(_result.data);
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
