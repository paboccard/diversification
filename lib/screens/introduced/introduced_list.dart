import 'package:diversification/database/blocs/bloc_provider.dart';
import 'package:diversification/database/blocs/food_bloc.dart';
import 'package:diversification/database/blocs/introduced_food_bloc.dart';
import 'package:diversification/database/database_helper.dart';
import 'package:diversification/database/model/food.dart';
import 'package:diversification/redux/app_state.dart';
import 'package:diversification/screens/search/food_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class IntroducedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aliments Introduits'),
      ),
      body: _buildIntroducedListFood(context),
    );
  }

  Widget _buildIntroducedListFood(BuildContext context) {
    final bloc = BlocProvider.of<FoodsBloc>(context);
    return StreamBuilder<List<Food>>(
      stream: bloc.introducedFoodsStream,
      initialData: bloc.introducedFoods,
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
    );
  }
}
