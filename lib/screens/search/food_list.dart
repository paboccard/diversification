//import 'package:diversification/model/food.dart';
import 'package:diversification/database/model/food.dart';
import 'package:diversification/screens/search/food_tile.dart';
import 'package:flutter/material.dart';

class FoodList extends StatefulWidget {
  final List<Food> foods;
  FoodList({Key key, this.foods}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  TextEditingController searchController = new TextEditingController();
  String filter = '';

  @override
  void initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
                hintText: 'Rechercher un aliment',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0))),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.foods == null ? 0 : widget.foods.length,
            itemBuilder: (BuildContext context, int index) {
              return filter == null || filter == '' ?               
              FoodTile(
                food: widget.foods[index],
              ) : 
              '${widget.foods[index].name}'.toLowerCase().contains(filter.toLowerCase()) ? FoodTile(food: widget.foods[index],) : Container();
            },
          ),
        ),
      ],
    );
  }
}
