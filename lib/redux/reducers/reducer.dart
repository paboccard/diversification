import 'package:diversification/model/food.dart';
import 'package:diversification/redux/actions/food_action.dart';
import 'package:diversification/redux/app_state.dart';

AppState appReducers(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  if (action is ToggleFoodStateAction) {
    return toggleFoodState(newState, action);
  } else if (action is ToggleUpdateFeedbackCriteriaAction) {
    return toggleUpdateFeedbackCriteria(newState, action);
  } else {
    return null;
  }
}

AppState toggleFoodState(AppState newState, ToggleFoodStateAction action) {
  int index = newState.foods.indexWhere((food) => food.id == action.food.id);
  if (index == -1) {
    newState.foods.add(action.food);
  } else {
    newState.foods.removeAt(index);
  }
  print("toggleFoodState - Etat du store:");
  for (var food in newState.foods) {
    print("\t - ${food}");
  }
  return newState;
}

AppState toggleUpdateFeedbackCriteria(AppState newState, ToggleUpdateFeedbackCriteriaAction action){
  int index = newState.foods.indexWhere((food) => food.id == action.food.id);
  newState.foods[index] = action.food;
  print("toggleUpdateFeedbackCriteria - Etat du store:");
  for (var food in newState.foods) {
    print("\t - ${food}");
  }
  return newState;
}