import 'package:flutter/material.dart';
import 'package:gym_app/models/customer/customer_bmi_model.dart';

class MyGoalTileTrainer extends StatelessWidget {
  final int id;
  const MyGoalTileTrainer({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isEnabled = false;
    return FutureBuilder(
        future: customerTrainerBmi(id),
        builder: (c, s) {
          var widget;
          if (s.connectionState == ConnectionState.waiting) {
            widget = Center(child: LinearProgressIndicator());
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var ca = customerBmiModelFromJson(s.data.data);

            double _bmi = (ca.weight * 10000) / (ca.height * ca.height);
            var _newbmi = _bmi.toStringAsFixed(1);

            widget = Container(
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'My Goal: ${ca.motive}',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        StatefulBuilder(
                            builder: (context, StateSetter setState) {
                          if (isEnabled) {
                            return  TextField(
                  // controller: _topicController,
                  // style: Theme.of(context)
                  //     .textTheme
                  //     .headline5
                  //     .copyWith(color: Colors.black),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //   borderSide: BorderSide(
                    //     color: Colors.black,
                    //     width: 2.0,
                    //   ),
                    // ),
                   hintText: 'weight'
                  
                  ),
                );
                          } else {
                            return InkWell(
                              onTap: () {
                                isEnabled = true;
                              },
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '\n${ca.weight.toStringAsFixed(1)} kg',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: '\nCurrent Weight',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        }),

                        // MyGoalElement(
                        //   // top: 'overweight',
                        //   mid: '${ca.weight.toStringAsFixed(1)} kg',
                        //   bottom: 'Current Weight',
                        // ),
                        Container(
                          width: 1,
                          height: 50,
                          color: Colors.grey,
                        ),
                        MyGoalElement(
                          top: ' ',
                          mid: '${ca.height.toStringAsFixed(1)} cm',
                          bottom: 'Current Height',
                        ),
                        Container(
                          width: 1,
                          height: 50,
                          color: Colors.grey,
                        ),
                        MyGoalElement(
                          // top: 'lose 7 kgs',
                          mid: _newbmi,
                          bottom: 'BMI',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else
            widget = Center(child: Text("OOPS! NO DATA!"));

          return widget;
        });
  }
}

class MyGoalElement extends StatelessWidget {
  const MyGoalElement({
    Key key,
    this.top,
    @required this.mid,
    @required this.bottom,
  }) : super(key: key);
  final String top;
  final String mid;
  final String bottom;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          // TextSpan(
          //   text: top,
          //   style: TextStyle(color: Colors.red),
          // ),
          TextSpan(
            text: '\n$mid',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: '\n$bottom',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
