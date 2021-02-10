import 'package:flutter/material.dart';
import 'package:gym_app/views/home/my_attendance.dart';
import 'package:gym_app/views/home/my_goal_title.dart';
import 'package:gym_app/views/home/todays_workout_tile.dart';
import 'package:gym_app/views/home/weight_chart.dart';

class HomeIndex extends StatelessWidget {
  HomeIndex({Key key}) : super(key: key);
  final List _images = List.generate(
      8,
      (index) =>
          'https://images.unsplash.com/photo-1559949557-7d0ac3e655f2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=770&q=80');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          TodaysWorkoutTile(),
          MyGoalTile(),
          WeightChart(),
          MyAttendance(),
          Text(
            'My Transformation',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 5.0,
            children: [
              for (var i = 0; i < 8; i++)
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  height: 100,
                  width: 100,
                  child: Image.network('${_images[i]}'),
                ),
              Container(
                height: 100,
                width: 100,
                child: IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
