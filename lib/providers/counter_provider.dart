import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/category.dart';
import 'package:flutter_application_3/styles/theme_style.dart';
import '/models/activity.dart';
import '/models/meal.dart';
import '/service/api.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  Color color = Colors.green;
  double height = 500.0;
  ActivityModel? activityModel;
  List<MealModel>? meals;
  List<CategoryModel>? categories;
  bool isLoading = false;

  void incrementCounter() {
    counter++;
    color = Colors.green;
    height = 400;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    height = 450;
    color = Colors.orange;
    notifyListeners();
  }

  void getActivity() async {
    setStatus(true);
  }

  setStatus(value) {
    isLoading = value;
  }

  void listMeal() async {
    setStatus(true);
    List<MealModel> data = await Api().listMeals();
    setMeal(data);
  }

  setMeal(List<MealModel>? data) {
    meals = data;
    setStatus(false);
    notifyListeners();
  }

  void listCategories() async {
    List<CategoryModel> data = await Api().listCategories();
    setCategories(data);
  }

  setCategories(data) {
    categories = data;
    notifyListeners();
  }
}
