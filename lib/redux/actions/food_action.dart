import 'package:diversification/model/food.dart';

class ToggleFoodStateAction{
  final FoodWithFeedbackCriteria food;

  ToggleFoodStateAction({this.food});
}

class ToggleUpdateFeedbackCriteriaAction{
  final FoodWithFeedbackCriteria food;
  ToggleUpdateFeedbackCriteriaAction({this.food});
}