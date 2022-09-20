import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:malina_app/helpers/api_requester.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/categories_model.dart';

class CategoriesProvider {
  Future<CategoriesModel> getCategories() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet('myapps/venv/api/user/store/');
      log("${response.statusCode}");

      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        CategoriesModel categoriesModel =
            CategoriesModel.fromJson(response.data);
        return categoriesModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('Categories provider error ===== $e');
      throw CatchException.convertException(e);
    }
  }
}
