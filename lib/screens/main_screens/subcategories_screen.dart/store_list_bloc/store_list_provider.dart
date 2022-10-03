import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/helpers/api_requester.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/store_model_list.dart';

class StoreListProvider {
  Box categoriesIdBox = Hive.box('categoriesIdBox');

  Future<StoreModelList> getStoreList() async {
    Map<String, String> queryParams = {
      'category': '${categoriesIdBox.get('categoriesId', defaultValue: '')}',
    };
    try {
      ApiRequester requester = ApiRequester();
      Response response =
          await requester.toGet('/user/store/', queryParams: queryParams);
      log('StoreList_Provider ====== ${response.statusCode}');

      if (response.statusCode == 200 && response.statusCode! < 300) {
        StoreModelList storeModelList = StoreModelList.fromJson(response.data);
        return storeModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('StoreList_Provider error ===== $e');
      throw CatchException.convertException(e);
    }
  }
}
