import 'dart:async';

import 'package:diversification/database/blocs/bloc.dart';
import 'package:diversification/database/model/food.dart';
import 'package:diversification/database/database_helper.dart';

class ViewFoodBloc implements Bloc {
  final _saveFoodController = StreamController<Food>.broadcast();
  StreamSink get inSaveFood => _saveFoodController.sink;

  Stream<Food> get foodStream => _saveFoodController.stream;

  ViewFoodBloc() {
    _saveFoodController.stream.listen(_handleSaveFood);
  }

  @override
  void dispose() {
    _saveFoodController.close();
  }

  void _handleSaveFood(Food food) async {
    DatabaseHelper.db.update(food);
  }
}
