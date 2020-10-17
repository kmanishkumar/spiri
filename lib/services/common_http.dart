import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class HttpCall {
  var httpRes;

  static final BASE_URL = "http://35.154.23.129:8080/"; //   Demo server url
  // static final BASE_URL = "http://192.168.0.176:3000/"; //   Local server url
  static final BASE_URI = BASE_URL.split('/')[2];
  Dio dio = new Dio();
  // ignore: non_constant_identifier_names
  SharedPreferences Preferences;

  Future getHeader(json) async {
    Preferences = await SharedPreferences.getInstance();
    var headers;
    if (Preferences.getString('token') != null) {
      (headers == null)
          ? headers = {
        HttpHeaders.authorizationHeader: Preferences.getString('token')
      }
          : headers.addAll({
        HttpHeaders.authorizationHeader: Preferences.getString('token')
      });
    }

    if (json) {
      (headers == null)
          ? headers = {HttpHeaders.acceptHeader: 'application/json'}
          : headers.addAll({HttpHeaders.acceptHeader: 'application/json'});
    }
    return headers;
  }

  Future<dynamic> get(String url, data) async {
    var uri = Uri.http(BASE_URI, url, data);
   // var resHeader = await getHeader(true);
    httpRes = await http.get(uri);
    return httpRes;
  }

  Future<dynamic> post(String url, {Map<dynamic, dynamic> body}) async {
    var resHeader = await getHeader(true);
    httpRes = await http.post(BASE_URL + url, body: body, headers: resHeader);
    return httpRes;
  }

  Future<dynamic> put(String url, {Map<dynamic, dynamic> body}) async {
    var resHeader = await getHeader(true);
    httpRes = await http.put(BASE_URL + url, body: body, headers: resHeader);
    return httpRes;
  }

  Future<dynamic> delete(String url) async {
    var resHeader = await getHeader(true);
    httpRes = await http.delete(BASE_URL + url, headers: resHeader);
    return httpRes;
  }

  Future<dynamic> multipartRequest(String url, image, mimeTypeData) async {
    var resHeader = await getHeader(true);
    final imageUploadRequest =
    http.MultipartRequest('POST', Uri.parse(BASE_URL + url));
    final file = await http.MultipartFile.fromPath('file', image.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
    imageUploadRequest.files.add(file);
    imageUploadRequest.headers.addAll(resHeader);
    final streamedResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamedResponse);
    return response;
  }

  Future<dynamic> multipartRequestArrayFile(
      method, String url, images, data) async {
    try {
      var resHeader = await getHeader(false);
      FormData formData = new FormData.fromMap(data);
      if (images != null && images.length != 0) {
        for (int j = 0; j < images.length; j++) {
          String format = ["jpg", "jpeg", "gif", "png"]
              .indexOf(images[j].path.split('.').last) !=
              -1
              ? "Image"
              : "Video";
          formData.files.add(MapEntry(
              "file",
              MultipartFile.fromFileSync(images[j].path,
                  filename: images[j].path.split('/').last,
                  contentType:
                  MediaType(format, images[j].path.split('.').last))));
        }
      }
      dio.options.headers = resHeader;
      Response response = (method == "POST")
          ? await dio.post(BASE_URL + url, data: formData)
          : await dio.put(BASE_URL + url, data: formData);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
