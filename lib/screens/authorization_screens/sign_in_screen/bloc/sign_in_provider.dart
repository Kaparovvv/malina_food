import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/helpers/api_requester.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/tokens_model.dart';

class SignInProvider {
  Box tokenBox = Hive.box('tokenBox');
  Box refreshTokenBox = Hive.box('refreshTokenBox');
  Future<TokensModel> confirmCode({
    required String phone,
    required String confirmationCode,
    required String deviceToken,
  }) async {
    try {
      Hive.box('tokenBox').delete('token');
      Hive.box('refreshTokenBox').delete('refreshToken');
      ApiRequester requester = ApiRequester();
      if (tokenBox.get('token') == null &&
          refreshTokenBox.get('refreshToken') == null) {
        Response response = await requester.toPost('/user/confirm/', body: {
          'phone': phone,
          'confirmation_code': confirmationCode,
          'device_id': deviceToken,
        });

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          log('${response.data}');
          TokensModel tokensModel = TokensModel.fromJson(response.data);
          tokenBox.put('token', '${response.data['token']}');
          refreshTokenBox.put(
              'refreshToken', '${response.data['refresh_token']}');
          return tokensModel;
        } else {
          throw CatchException.convertException(response);
        }
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
    return TokensModel();
  }
}
