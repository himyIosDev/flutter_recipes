import 'package:flutter_recepies/constants.dart';
import 'package:flutter_recepies/models/recipe.dart';
import 'package:flutter_recepies/services/http_service.dart';

class DataService {
  //
  static final DataService _singleton = DataService._internal();

  final HTTPService _httpService = HTTPService();

  factory DataService() {
    return _singleton;
  }

  DataService._internal();

  Future<List<Recipe>?> getRecipes(String filter) async {
    //
    String path = recipes;

    if (filter.isNotEmpty) {
      //
      path += "meal-type/$filter";
    }

    var response = await _httpService.getRequest(path);

    if (response?.statusCode == 200 && response?.data != null) {
      //
      List data = response!.data["recipes"];
      List<Recipe> recipieList =
          data.map((err) => Recipe.fromJson(err)).toList();

      return recipieList;
    }
  }
}
