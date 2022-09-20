import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:malina_app/helpers/catch_exception.dart';

class ApiRequester {
  static String url = 'http://167.99.246.103/';

  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 3000,
        connectTimeout: 3000,
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
