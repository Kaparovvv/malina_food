import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/helpers/store_api_requester.dart';
import 'package:malina_app/models/Store_id_model.dart';

class ScannerProvider {
  Box apiBox = Hive.box('apiBox');
  Box idBox = Hive.box('idBox');
  Box branchBox = Hive.box('branchBox');
  Box storeIdBox = Hive.box('storeIdBox');
  Box numberBox = Hive.box('numberBox');

  Future<StoreIdModel> getStoreId() async {
    try {
      StoreApiRequester requester = StoreApiRequester();
      String apiUrl = await apiBox.get('api', defaultValue: '');
      Response response = await requester.toGet(apiUrl);

      log(response.statusCode.toString());

      if (response.statusCode == 200 && response.statusCode! < 300) {
        StoreIdModel storeIdModel =
            StoreIdModel.fromJson(response.data);

        idBox.put('id', response.data['id']);
        branchBox.put('branch', response.data['branch']);
        storeIdBox.put('storeIdCache', response.data['store_id']);
        numberBox.put('number', response.data['number']);

        log('Id ======= ${idBox.get('id')}');
        log('Branch ======= ${branchBox.get('branch')}');
        log('Store_ID ======= ${storeIdBox.get('storeIdCache')}');
        log('Number ======= ${numberBox.get('number')}');

        return storeIdModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('StoreID provider error ===== $e');
      throw CatchException.convertException(e);
    }
  }
}
