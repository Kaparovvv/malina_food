import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/helpers/api_requester.dart';
import 'package:malina_app/helpers/catch_exception.dart';

class SignInProvider {
  Box tokenBox = Hive.box('tokenBox');
  Box refreshTokenBox = Hive.box('refreshTokenBox');
  Future confirmCode({
    required String phone,
    required String confirmationCode,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost('/user/confirm/', body: {
        'phone': phone,
        'confirmation_code': confirmationCode,
      });

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log('${response.data}');

        await Hive.box('tokenBox').delete('token');
        await Hive.box('refreshTokenBox').delete('refreshToken');

        log('1 Token ======= ${tokenBox.get('token')}');
        log('1 Refresh token  ======= ${refreshTokenBox.get('refreshToken')}');
        if (tokenBox.get('token') == null &&
            refreshTokenBox.get('refreshToken') == null) {
          tokenBox.put('token', 'Token ${response.data['token']}');
          refreshTokenBox.put(
              'refreshToken', 'RefreshToken ${response.data['refresh_token']}');
          log('2 Token ======= ${tokenBox.get('token')}');
          log('2 Refresh token  ======= ${refreshTokenBox.get('refreshToken')}');
        }
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
