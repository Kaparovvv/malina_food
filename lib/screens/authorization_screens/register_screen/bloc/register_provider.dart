import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:malina_app/helpers/api_requester.dart';
import 'package:malina_app/helpers/catch_exception.dart';

class RegisterProvider {
  Future registerUser({
    required String name,
    required String surName,
    required String login,
    required String phone,
    required String email,
    required String deviceId,
  }) async {
    log('RegisterProvider1');
    try {
      ApiRequester requester = ApiRequester();
      log('RegisterProvider2');

      Response response = await requester.toPost('/user/client/', body: {
        "name": name,
        "surname": surName,
        "login": login,
        "phone": phone,
        "email": email,
        "avatar": 'https://www.peoples.ru/character/movie/loki/loki_2.jpg',
        "type": 1,
        "datebirth": "2022-10-08",
        "gender": 1,
        "score": 1,
        "device_id": deviceId,
      });
      log('RegisterProvider3');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log('RegisterProvider4');

        log(response.data.toString());
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
