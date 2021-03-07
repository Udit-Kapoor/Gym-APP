import 'package:flutter/material.dart';
import 'package:gym_app/models/customer/today_workout_model.dart';
import 'package:intl/intl.dart';

class TodaysWorkoutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 4.0,
        child: FutureBuilder(
            future: todayWorkout(),
            builder: (c, s) {
              var widget;
              if (s.connectionState == ConnectionState.waiting) {
                widget = Center(child: LinearProgressIndicator());
              } else if (s.hasData &&
                  s.connectionState == ConnectionState.done) {
                var ca = todayWorkoutModelFromJson(s.data.data);

                var date = DateFormat.MMMd().format(ca.date);

                var dateSplit = date.split(' ');
                print(dateSplit);

                widget = ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                  tileColor: Colors.white,
                  leading: Container(
                    color: Colors.red,
                    height: 60.0,
                    width: 60.0,
                    child: Center(
                      child: Text(
                        "${dateSplit[1]}\n${dateSplit[0]}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  title: Text('Today\'s Workout'),
                  subtitle: Text(
                    ca.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                );
              } else
                widget = Center(child: Text("OOPS! NO DATA!"));

              return widget;
            }));
  }
}
