import 'package:diversification/model/food.dart';

class AppState{
  List<FoodWithFeedbackCriteria> foods;
  AppState({this.foods});

  AppState.fromAppState(AppState another){
    foods = another.foods;
  }
}