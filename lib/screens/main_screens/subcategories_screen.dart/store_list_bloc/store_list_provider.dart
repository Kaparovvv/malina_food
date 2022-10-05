import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/helpers/api_requester.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/store_model_list.dart';

class StoreListProvider {
  Box subcategoryID = Hive.box('subcategoryID');
  Future<StoreModelList> getStoreList({String? query}) async {
    Map<String, String> queryParams = {
      'subcategory': '${subcategoryID.get('idCache', defaultValue: '')}',
      'search': query ?? '',
    };
    try {
      ApiRequester requester = ApiRequester();
      Response response =
          await requester.toGet('/user/store/', queryParams: queryParams);

      if (response.statusCode == 200 && response.statusCode! < 300) {
        StoreModelList storeModelList = StoreModelList.fromJson(response.data);
        return storeModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
