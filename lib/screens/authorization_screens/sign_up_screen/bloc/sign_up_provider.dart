import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:malina_app/helpers/api_requester.dart';
import 'package:malina_app/helpers/catch_exception.dart';

class SignUpProvider {
  Future createUser({
    required String phone,
  }) async {
    try {
      log('pro1');
      ApiRequester requester = ApiRequester();
      log('pro2');
      log(phone.toString());

      Response response = await requester.toPost('/user/send/', body: {
        'phone': phone,
      });
      log('pro3');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log('pro4');
        log(response.data.toString());
      } else if (response.statusCode == 429) {
        throw CatchException.convertException(response.data);
      } else {
        throw CatchException.convertException(response.data);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
