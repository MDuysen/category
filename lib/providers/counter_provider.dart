import 'package:flutter/material.dart';
import '/models/activity.dart';
import '/models/meal.dart';
import '/service/api.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  Color color = Colors.green;
  double height = 500.0;
  ActivityModel? activityModel;
  List<MealModel>? meals;
  bool isLoading = false;

  void incrementCounter() {
    counter++;
    color = Colors.yellow;
    height += 20;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    height -= 20;
    color = Colors.red;
    notifyListeners();
  }

  void getActivity() async {
    setStatus(true);
  }

  setActivity(data) {
    activityModel = data;
    setStatus(false);
    notifyListeners();
  }

  setStatus(value) {
    isLoading = value;
  }

  void listMeal() async {
    setStatus(true);
    List<MealModel> data = await Api().listMeals();
    setMeal(data);
  }

  setMeal(data) {
    meals = data;
    setStatus(false);
    notifyListeners();
  }
}
