import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/helpers/catch_exception.dart';

class StoreApiRequester {
  Box tokenBox = Hive.box('tokenBox');
  
  Future<Dio> initDio() async {
    String apiUrl = '';

    String token = await tokenBox.get('token', defaultValue: '');
    return Dio(
      BaseOptions(
        baseUrl: apiUrl,
        responseType: ResponseType.json,
        receiveTimeout: 30000,
        connectTimeout: 5000,
        headers: {
          "Authorization": token,
        },
      ),
    );
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: param);
    } catch (e) {
      log('$e');
      throw CatchException.convertException(e);
    }
  }
}
