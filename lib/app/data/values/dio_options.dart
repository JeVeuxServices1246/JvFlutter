import 'package:dio/dio.dart';
import 'package:jv_app/app/data/values/urls.dart';

BaseOptions dioOptions = BaseOptions(
  connectTimeout: Duration(seconds: 30),
  receiveTimeout: Duration(seconds: 30),
  baseUrl: URLs.baseURL,
  contentType: Headers.jsonContentType,
  responseType: ResponseType.json,
  headers: {'Accept': Headers.jsonContentType},
);
