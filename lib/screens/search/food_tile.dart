//import 'package:diversification/model/food.dart';
import 'package:diversification/database/blocs/bloc_provider.dart';
import 'package:diversification/database/blocs/food_bloc.dart';
import 'package:diversification/database/blocs/view_food_bloc.dart';
import 'package:diversification/database/model/food.dart';
import 'package:diversification/redux/app_state.dart';
import 'package:diversification/screens/detail/food_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FoodTile extends StatefulWidget {
  final Food food;
  FoodTile({this.food});

  @override
  _FoodTileState createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {

  FoodsBloc _foodsBloc;
  
  @override
  void initState(){
    super.initState();
  _foodsBloc = BlocProvider.of<FoodsBloc>(context);
  }

  void _navigationToFood(Food food) async {
    bool update = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          bloc: FoodsBloc(),
          child: FoodDetail(
            food: food,
          ),
        ),
      ),
    );

    //if (update != null){
      print("_navigationToFood update");
      _foodsBloc.getFoods();
    //}
  }

  @override
  Widget build(BuildContext context) {
    /*return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {*/
          return ListTile(
            title: Text(widget.food.name),
            subtitle: Text('${widget.food.minYear.toString()} mois'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/${widget.food.image}'),
            ),
            trailing: Icon(
              // Add the lines from here...
              (widget.food.introduced ? Icons.check : null),
              color: widget.food.introduced ? Colors.green : null,
              //(state.foods.indexWhere((item) => item.id == food.id) != -1) ? Icons.check : null,
              //color: (state.foods.indexWhere((item) => item.id == food.id) != -1) ? Colors.green : null,
            ),
            onTap: () {
              _navigationToFood(widget.food);
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodDetail(
                            food: widget.food,
                          )));*/
            },
          );
        //});
  }
}
