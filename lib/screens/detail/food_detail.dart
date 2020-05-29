//import 'package:diversification/model/food.dart';
import 'package:diversification/database/model/food.dart';
import 'package:diversification/redux/app_state.dart';
import 'package:diversification/screens/detail/food_detail_bottom.dart';
import 'package:diversification/screens/detail/food_detail_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FoodDetail extends StatelessWidget {
  final Food food;
  
  FoodDetail({this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FoodDetailTop(food: food,),
          FoodDetailBottom(food: food)
        ],
      ),
    );
    /*return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        int index = state.foods.indexWhere((item) => item.id == food.id);
        return Scaffold(
          /*appBar: AppBar(
        title: Text(food.name),
      ),*/
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FoodDetailTop(food: food),
                FoodDetailBottom(
                  food: (index != -1)
                      ? state.foods[index]
                      : this.food,
                  introduced: (index != -1),
                )
              ],
            ),
          ),
        );
      },
    );*/
  }
}
