//import 'package:diversification/model/food.dart';
import 'package:diversification/database/blocs/bloc_provider.dart';
import 'package:diversification/database/blocs/food_bloc.dart';
import 'package:diversification/database/blocs/view_food_bloc.dart';
import 'package:diversification/database/database_helper.dart';
import 'package:diversification/database/model/food.dart';
import 'package:diversification/model/utils.dart';
import 'package:diversification/redux/actions/food_action.dart';
import 'package:diversification/redux/app_state.dart';
import 'package:diversification/screens/detail/feedback_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FoodDetailBottom extends StatefulWidget {
  final Food food;
  FoodDetailBottom({this.food});

  @override
  _FoodDetailBottomState createState() => _FoodDetailBottomState();
}

class _FoodDetailBottomState extends State<FoodDetailBottom> {
  FoodsBloc _foodsBloc;
  //ViewFoodBloc _viewFoodBloc;
  bool introduced;

  @override
  void initState() {
    super.initState();
    //introduced = widget.food.introduced;
    //_viewFoodBloc = BlocProvider.of<ViewFoodBloc>(context);
    _foodsBloc = BlocProvider.of<FoodsBloc>(context);
  }

  /*@override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Detail_bottom'),
      ),
    );
  }*/

  /*Widget getButtonIntroduced(BuildContext context, AppState state) {
    if (state.foods.indexWhere((item) => item.id == widget.food.id) ==
        -1) {
      return RaisedButton(
        color: Colors.blue,
        child: Text(
          'Introduire',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Food foodWithFeedbackCriteria =
                Food(
                    id: this.widget.food.id,
                    name: this.widget.food.name,
                    minYear: this.widget.food.minYear,
                    type: this.widget.food.type,
                    image: this.widget.food.image,
                    feedback: FeedbackForFood.LAUGH);
          StoreProvider.of<AppState>(context)
              .dispatch(ToggleFoodStateAction(food: foodWithFeedbackCriteria));
        },
      );
    } else {
      return RaisedButton(
        color: Colors.green,
        child: Text(
          'Introduit',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          FoodWithFeedbackCriteria foodWithFeedbackCriteria =
                FoodWithFeedbackCriteria(
                    id: this.widget.food.id,
                    name: this.widget.food.name,
                    minYear: this.widget.food.minYear,
                    type: this.widget.food.type,
                    image: this.widget.food.image,
                    feedback: FeedbackForFood.LAUGH);
          StoreProvider.of<AppState>(context)
              .dispatch(ToggleFoodStateAction(food: foodWithFeedbackCriteria));
        },
      );
    }
  }

  void updateStoreValue(FeedbackForFood feedbackForFood){
    FoodWithFeedbackCriteria foodWithFeedbackCriteria =
                FoodWithFeedbackCriteria(
                    id: this.widget.food.id,
                    name: this.widget.food.name,
                    minYear: this.widget.food.minYear,
                    type: this.widget.food.type,
                    image: this.widget.food.image,
                    feedback: feedbackForFood);
            StoreProvider.of<AppState>(context).dispatch(
                ToggleUpdateFeedbackCriteriaAction(food: foodWithFeedbackCriteria));
  }

  Widget getFeedBackComponent() {
    if (widget.introduced) {
      return FeedbackComponent(
        returnSliderValue: updateStoreValue ,
        initialFeedback: widget.food.feedback,);
    }
    return Container();
  }*/

  void _updateFood() async {
    _foodsBloc.inUpdateFood.add(widget.food);
    //_viewFoodBloc.inSaveFood.add(widget.food);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StreamBuilder<List<Food>>(
          stream: _foodsBloc.foodsStream,
          //initialData: widget.food,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SwitchListTile(
                  title: Text(
                    'Aliment introduit',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  value: widget.food.introduced,
                  contentPadding: EdgeInsets.only(left: 40, right: 40.0),
                  onChanged: (bool value) {
                    widget.food.introduced = !widget.food.introduced;
                    this._updateFood();
                  });
            } else {
              return new Center(child: CircularProgressIndicator());
            }
          },
        )
        /*SwitchListTile(
          title: Text(
            'Aliment introduit',
            style: TextStyle(fontSize: 18.0),
          ),
          value: introduced,
          contentPadding: EdgeInsets.only(left: 40, right: 40.0),
          onChanged: (bool value) {
            widget.food.introduced = !introduced;
            this._updateFood();*/
        /*setState(() {
              introduced = !introduced;
            });*/
        //DatabaseHelper.db.update(widget.food);
        /*FoodWithFeedbackCriteria foodWithFeedbackCriteria =
                FoodWithFeedbackCriteria(
                    id: this.widget.food.id,
                    name: this.widget.food.name,
                    minYear: this.widget.food.minYear,
                    type: this.widget.food.type,
                    image: this.widget.food.image,
                    feedback: FeedbackForFood.LAUGH);
            StoreProvider.of<AppState>(context).dispatch(
                ToggleFoodStateAction(food: foodWithFeedbackCriteria));*/

        //},
        //),
        //getFeedBackComponent()
        /*Center(
                child: getButtonIntroduced(context, state)
              )*/
      ],
    );
  }
}
