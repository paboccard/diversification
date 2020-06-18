import 'dart:convert';

import 'package:diversification/database/blocs/bloc_provider.dart';
import 'package:diversification/database/blocs/food_bloc.dart';
import 'package:diversification/database/database_helper.dart';
import 'package:diversification/database/model/food.dart';
import 'package:diversification/screens/introduced/introduced_list.dart';
//import 'package:diversification/model/food.dart';
import 'package:diversification/screens/search/food_list.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diversification"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => IntroducedList())),
          )
        ],
      ),
      body: _builderListFood(context),
    );
  }

  Widget _builderListFood(BuildContext context){
    return StreamBuilder<List<Food>>(
      stream: BlocProvider.of<FoodsBloc>(context).foodsStream,
      builder: (context, snapshot){
         if (!snapshot.hasData) {
            return new Center(child: CircularProgressIndicator());
          } else {
            //FoodsList foods = snapshot.data;
            return new FoodList(
                //foods: foods.foods,
                foods: snapshot.data);
          }
      },
    );
  }
}