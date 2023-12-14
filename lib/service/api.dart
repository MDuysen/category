import 'dart:developer';

import 'package:dio/dio.dart';

import '/models/meal.dart';

class Api {
  final mealURL = 'https://www.themealdb.com/api/json/v1/1/random.php';
  final catgURL = 'https://www.themealdb.com/api/json/v1/1/categories.php';
  final dio = Dio();

  Future<List<MealModel>> listMeals(int year) async {
    Response response;
    response = await dio.get(mealURL, queryParameters: {'year': year});
    log(response.data.toString());
    return parseMealModels(response.data);
  }

  List<MealModel> parseMealModels(Map<String, dynamic> json) {
    List<dynamic> mealsJson = json['meals'];
    return mealsJson.map((mealJson) => MealModel.fromJson(mealJson)).toList();
  }

  listCategories() {}
}
