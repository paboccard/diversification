import 'dart:async';

import 'package:diversification/database/blocs/bloc.dart';
import 'package:diversification/database/model/food.dart';
import 'package:diversification/database/blocs/bloc_provider.dart';
import 'package:diversification/database/database_helper.dart';

class FoodsBloc implements Bloc{

  List<Food> _foods;

  // Create a broadcast controller that allows this stream to be listened
  // to multiple times. This is the primary, if not only, type of stream you'll be using.
  final _foodsController = StreamController<List<Food>>.broadcast();

  // Input stream. We add our foods to the stream using this variable.
  StreamSink<List<Food>> get _inFoods => _foodsController.sink;

  // Output stream. This one will be used within our pages to display the foods.
  Stream<List<Food>> get foodsStream => _foodsController.stream;

  List<Food> get foods => _foods;

  // Input stream for update food. We'll call this from our pages.
  final _updateFoodController = StreamController<Food>.broadcast();
  StreamSink<Food> get inUpdateFood => _updateFoodController.sink;

  FoodsBloc(){
    getFoods();
    //_updateFoodController.stream.listen(_handleUpdateFood);
  }

  @override
  void dispose() {
    _foodsController.close();
    _updateFoodController.close();
  }

  void getFoods() async {
    _foods = await DatabaseHelper.db.getAllFoods();
    _inFoods.add(_foods);
  }

  void handleUpdateFood(Food food) async {
    await DatabaseHelper.db.update(food);
    getFoods();
  }

}