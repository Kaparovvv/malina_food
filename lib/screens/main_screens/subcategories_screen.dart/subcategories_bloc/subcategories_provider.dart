import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/helpers/api_requester.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/subcategories_model.dart';

class SubcategoriesProvider {
  Box categoriesIdBox = Hive.box('categoriesIdBox');

  Future<List<SubcategoriesModel>> getSubcategories() async {
    Map<String, dynamic> queryParams = {
      'category': '${categoriesIdBox.get('categoriesId', defaultValue: '')}'
    };
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet(
          '/user/subcategory/', queryParams: queryParams);
      log('Subcategories_Provider ====== ${response.statusCode}');

      if (response.statusCode == 200 && response.statusCode! < 300) {
        List<SubcategoriesModel> subcategoriesModelList = response.data
            .map<SubcategoriesModel>((el) => SubcategoriesModel.fromJson(el))
            .toList();

        return subcategoriesModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('Subcategories_Provider error ===== $e');
      throw CatchException.convertException(e);
    }
  }
}
