import 'dart:convert';

import 'package:diversification/database/blocs/bloc_provider.dart';
import 'package:diversification/database/blocs/food_bloc.dart';
import 'package:diversification/database/database_helper.dart';
import 'package:diversification/database/model/food.dart';
//import 'package:diversification/model/food.dart';
import 'package:diversification/screens/search/food_list.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FoodsBloc _foodsBloc;

  DatabaseHelper databaseHelper;
  Future<List<Food>> foods;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    _foodsBloc = BlocProvider.of<FoodsBloc>(context);
    //refreshFoodList();
  }

  /*refreshFoodList(){
    setState(() {
      foods = databaseHelper.getAllFoods();
    });
  }*/

  /*FoodsList parseJson(String response) {
    if (response == null) {
      return null;
    }
    var foodMap = json.decode(response);

    return FoodsList.fromJson(foodMap) ?? Container;
  }

  Future getJson(response) async {
    var result = await json.decode(response);
    return FoodsList.fromJson(result);
  }

  Future<String> _loadFoodsAsset() async {
    return await DefaultAssetBundle.of(context).loadString('assets/food.json');
  }

  Future<FoodsList> loadFood() async {
    String jsonString = await _loadFoodsAsset();
    final jsonResponse = json.decode(jsonString);
    FoodsList result = await FoodsList.fromJson(jsonResponse);
    return result;
  }*/

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Center(
          //child: FutureBuilder<FoodsList>(
          child: StreamBuilder<List<Food>>(
        //initialData: _foodsBloc.foodsStream,
        stream: _foodsBloc.foodsStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Center(child: CircularProgressIndicator());
          } else {
            //FoodsList foods = snapshot.data;
            return new FoodList(
                //foods: foods.foods,
                foods: snapshot.data);
          }
        },
      )
          /*child: FutureBuilder(
          //future: loadFood(),
          future: foods,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new Center(child: CircularProgressIndicator());
            } else {
              //FoodsList foods = snapshot.data;
              return new FoodList(
                  //foods: foods.foods,
                  foods: snapshot.data);
            }
          },
        ),*/
          ),
    );
  }
}
