import 'package:diversification/model/food.dart';
import 'package:diversification/redux/app_state.dart';
import 'package:diversification/redux/reducers/reducer.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore() {
  Store<AppState> store = new Store(
    appReducers,
    initialState: new AppState(foods: new List<FoodWithFeedbackCriteria>())
  );
  return store;
}