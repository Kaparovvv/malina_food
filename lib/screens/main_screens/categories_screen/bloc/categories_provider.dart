import 'package:dio/dio.dart';
import 'package:malina_app/helpers/api_requester.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/categories_model.dart';

class CategoriesProvider {
  Future<List<CategoriesModel>> getCategories({String? query}) async {
    Map<String, String> queryParams = {
      'name': query ?? '',
    };
    try {
      ApiRequester requester = ApiRequester();
      Response response =
          await requester.toGet('/user/category/', queryParams: queryParams);

      if (response.statusCode == 200) {
        List<CategoriesModel> categoriesModelList = response.data
            .map<CategoriesModel>((el) => CategoriesModel.fromJson(el))
            .toList();

        return categoriesModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
