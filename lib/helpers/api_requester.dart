import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/helpers/catch_exception.dart';

class ApiRequester {
  Box tokenBox = Hive.box('tokenBox');

  static String url = 'http://167.99.246.103/myapps/venv/api';
  Future<Dio> initDio() async {
    String token = await tokenBox.get('token', defaultValue: '');
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 30000,
        connectTimeout: 5000,
        headers: {
          "Authorization": token,
        }
      ),
    );
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? queryParams}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: queryParams);
    } catch (e) {
      log('$e');
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(String url,
      {Map<String, dynamic>? param, required Map<String, dynamic> body}) async {
    Dio dio = await initDio();
    try {
      return dio.post(url, queryParameters: param, data: body);
    } catch (e) {
      log(e.toString());
      throw CatchException.convertException(e);
    }
  }
}
