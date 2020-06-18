import 'package:diversification/database/blocs/bloc_provider.dart';
import 'package:diversification/database/blocs/food_bloc.dart';
import 'package:diversification/database/blocs/introduced_food_bloc.dart';
import 'package:diversification/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(Diversificaion());

class Diversificaion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodsBloc>(
      bloc: FoodsBloc(),
      child: BlocProvider<IntroducedFoodsBloc>(
        bloc: IntroducedFoodsBloc(),
        child: MaterialApp(
          title: "Diversification",
          home: MainScreen(),
        ),
      ),
    );
  }
}