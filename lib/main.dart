import 'dart:convert';

import 'package:diversification/database/blocs/bloc_provider.dart';
import 'package:diversification/database/blocs/food_bloc.dart';
import 'package:diversification/database/blocs/introduced_food_bloc.dart';
import 'package:diversification/model/food.dart';
import 'package:diversification/redux/app_state.dart';
import 'package:diversification/screens/introduced/introduced_list.dart';
import 'package:diversification/screens/search/food_list.dart';
import 'package:diversification/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/store.dart';

void main() {
  var store = createStore();

  runApp(new MyApp(store: store));
}

class MyApp extends StatefulWidget {
  final Store<AppState> store;
  MyApp({this.store});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  FoodsList _foods;
  //List<Widget> _children;

  List<Widget> _children = <Widget>[
    BlocProvider(
      bloc: FoodsBloc(),
      child: Search(),
    ),
    BlocProvider(
      bloc: IntroducedFoodsBloc(),
      child: IntroducedList(),
    )
  ];

  @override
  void initState() {
    super.initState();
    /*_children = [
      Search(),
      IntroducedList(),
    ];*/
  }
  //List data;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: new AppBar(
            title: new Text(
              'Liste des aliments',
              style: new TextStyle(color: Colors.white),
            ),
          ),
          /*bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped, // new
            currentIndex: _currentIndex, // new
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Recherche'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.check_box),
                title: Text('Introduit'),
              ),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Profile'))
            ],
          ),*/
          body: _children[_currentIndex],
        ),
      );
      /*child: MaterialApp(
        home: Scaffold(
          appBar: new AppBar(
            title: new Text(
              'Liste des aliments',
              style: new TextStyle(color: Colors.white),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped, // new
            currentIndex: _currentIndex, // new
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                title: Text('Messages'),
              ),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Profile'))
            ],
          ),
          body: new Container(
            child: Center(
              child: FutureBuilder<FoodsList>(
                future: loadFood(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return new Center(child: CircularProgressIndicator());
                  } else {
                    FoodsList foods = snapshot.data;
                    return new FoodList(
                      food: foods.foods,
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),*/
  }
}
