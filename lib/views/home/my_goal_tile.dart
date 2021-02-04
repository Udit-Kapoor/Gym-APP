import 'package:flutter/material.dart';

class MyGoalTile extends StatelessWidget {
  const MyGoalTile({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.2,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'My Goal: Weight Loss',
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyGoalElement(
                top: 'overweight',
                mid: '85 kg',
                bottom: 'Current Weight',
              ),
              Container(
                width: 1,
                height: height * 0.09,
                color: Colors.grey,
              ),
              MyGoalElement(
                top: ' ',
                mid: '177 cm',
                bottom: 'Current Height',
              ),
              Container(
                width: 1,
                height: height * 0.09,
                color: Colors.grey,
              ),
              MyGoalElement(
                top: 'lose 7 kgs',
                mid: '23.9',
                bottom: 'BMI',
              ),
            ],
          ),
        ],
      ),
    );
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
          TextSpan(
            text: top,
            style: TextStyle(color: Colors.red),
          ),
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
