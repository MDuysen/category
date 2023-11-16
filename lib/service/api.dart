import 'dart:developer';

import 'package:dio/dio.dart';
import '/models/activity.dart';
import '/models/meal.dart';

class Api {
  final mealURL = 'https://www.themealdb.com/api/json/v1/1/random.php';

  final dio = Dio();

  Future<List<MealModel>> listMeals() async {
    Response response;
    response = await dio.get(mealURL);
    log(response.data.toString());
    return parseMealModels(response.data);
  }

  List<MealModel> parseMealModels(Map<String, dynamic> json) {
    List<dynamic> mealsJson = json['meals'];
    return mealsJson.map((mealJson) => MealModel.fromJson(mealJson)).toList();
  }
}
