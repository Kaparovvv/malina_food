import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/helpers/api_requester.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/store_data_model.dart';

class StoreProvider {
  Box storeIdBox = Hive.box('storeIdBox');
  Future<StoreModel> getStoreData() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response =
          await requester.toGet('/user/store/${storeIdBox.get('store_id')}/');

      log('Store_Provider ====== ${response.statusCode}');

      if (response.statusCode == 200 && response.statusCode! < 300) {
        StoreModel storeModel = StoreModel.fromJson(response.data);
        return storeModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      log('Store_Provider error ==== $e');
      throw CatchException.convertException(e);
    }
  }
}
