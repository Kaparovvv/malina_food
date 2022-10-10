import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:malina_app/helpers/api_requester.dart';
import 'package:malina_app/helpers/catch_exception.dart';

class SignUpProvider {
  Future createUser({
    required String phone,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost('/user/send/', body: {
        'phone': phone,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.data.toString());
      } else if (response.statusCode == 429) {
        throw CatchException.convertException(response);
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
