import 'package:diversification/database/blocs/bloc_provider.dart';
import 'package:diversification/database/blocs/food_bloc.dart';
import 'package:diversification/database/blocs/introduced_food_bloc.dart';
import 'package:diversification/database/database_helper.dart';
import 'package:diversification/database/model/food.dart';
import 'package:diversification/redux/app_state.dart';
import 'package:diversification/screens/search/food_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class IntroducedList extends StatefulWidget {

  @override
  _IntroducedListState createState() => _IntroducedListState();
}

class _IntroducedListState extends State<IntroducedList> {

  FoodsBloc _introducedFoodsBloc;

  @override
  void initState(){
    super.initState();
    _introducedFoodsBloc = BlocProvider.of<FoodsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: _introducedFoodsBloc.allItem,
      stream: _introducedFoodsBloc.foodsStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Center(child: CircularProgressIndicator());
        } else {
          //FoodsList foods = snapshot.data;
          return new FoodList(
              //foods: foods.foods,
              foods: snapshot.data['introducedFood']);
        }
      },
    );
    /*return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder:  (context, state){
        return FoodList(foods: state.foods,);
      },
    );*/
  }
}
