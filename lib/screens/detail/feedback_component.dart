import 'package:diversification/model/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedbackComponent extends StatefulWidget {
  //final VoidCallback updateStoreValue;
  final FeedbackForFood initialFeedback;
  final void Function(FeedbackForFood) returnSliderValue;
  FeedbackComponent({this.returnSliderValue, this.initialFeedback});

  @override
  _FeedbackComponentState createState() => _FeedbackComponentState(sliderValue: initialFeedback.sliderValue, myFeedbackText: initialFeedback.sliderName);
}

class _FeedbackComponentState extends State<FeedbackComponent> {
  double sliderValue;
  String myFeedbackText;
  _FeedbackComponentState({this.sliderValue, this.myFeedbackText});
  IconData myFeedback = FontAwesomeIcons.smile;
  Color myFeedbackColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E5E5),
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
            ),
          ),
          Container(
            child: Align(
              child: Material(
                color: Colors.white,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Container(
                    width: 350.0,
                    height: 270.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Text(
                            myFeedbackText,
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Icon(
                            myFeedback,
                            color: myFeedbackColor,
                            size: 70.0,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Slider(
                              min: 0.0,
                              max: 10.0,
                              divisions: 4,
                              value: sliderValue,
                              activeColor: Color(0xffe05f2c),
                              inactiveColor: Colors.blueGrey,
                              onChanged: (newValue) {
                                //this.widget.returnSliderValue(FeedbackForFood.SAD);
                                setState(() {
                                  sliderValue = newValue;
                                  if (sliderValue >= 0.0 &&
                                      sliderValue <= 2.0) {
                                    myFeedback = FontAwesomeIcons.sadTear;
                                    myFeedbackColor = Colors.red;
                                    myFeedbackText = FeedbackForFood.SAD.sliderName;
                                    this.widget.returnSliderValue(FeedbackForFood.SAD);
                                  }
                                  if (sliderValue >= 2.1 &&
                                      sliderValue <= 4.0) {
                                    myFeedback = FontAwesomeIcons.frown;
                                    myFeedbackColor = Colors.yellow;
                                    myFeedbackText = FeedbackForFood.FRAWN.sliderName;
                                    this.widget.returnSliderValue(FeedbackForFood.FRAWN);
                                  }
                                  if (sliderValue >= 4.1 &&
                                      sliderValue <= 6.0) {
                                    myFeedback = FontAwesomeIcons.smile;
                                    myFeedbackColor = Colors.amber;
                                    myFeedbackText = FeedbackForFood.SMILE.sliderName;
                                    this.widget.returnSliderValue(FeedbackForFood.SMILE);
                                  }
                                  if (sliderValue >= 6.1 &&
                                      sliderValue <= 8.0) {
                                    myFeedback = FontAwesomeIcons.laugh;
                                    myFeedbackColor = Colors.green;
                                    myFeedbackText = FeedbackForFood.LAUGH.sliderName;
                                    this.widget.returnSliderValue(FeedbackForFood.LAUGH);
                                  }
                                  if (sliderValue >= 8.1 &&
                                      sliderValue <= 10.0) {
                                    myFeedback = FontAwesomeIcons.solidHeart;
                                    myFeedbackColor = Colors.red;
                                    myFeedbackText = FeedbackForFood.HEART.sliderName;
                                    this.widget.returnSliderValue(FeedbackForFood.HEART);
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Center(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              color: Color(0xffe05f2c),
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Color(0xffffffff)),
                              ),
                              onPressed: () {},
                            ),
                          )),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
