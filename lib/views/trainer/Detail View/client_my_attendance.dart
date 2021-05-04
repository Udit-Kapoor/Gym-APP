import 'package:flutter/material.dart';
import 'package:gym_app/models/trainer/cust_attendance_trainer.dart';
import 'package:gym_app/views/customer/my_attendance.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ClientMyAttendance extends StatelessWidget {
  final int id;

  const ClientMyAttendance({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: clientAttendance(id),
        builder: (c, s) {
          var widget;
          if (s.connectionState == ConnectionState.waiting) {
            widget = Center(child: CircularProgressIndicator());
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var ca = custAttendanceTrainerModelFromJson(s.data.data);

            widget = Material(
              elevation: 4.0,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'My Attendance',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    if (ca.list.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Wrap(
                              children: [
                                for (var att in ca.list)
                                  DayWiseAttendance(
                                    date: att[0],
                                    attend: att[1] == 'True' ? true : false,
                                  )
                              ],
                            ),
                          ),
                          Expanded(
                            child: CircularPercentIndicator(
                              progressColor: Colors.blue[700],
                              animation: true,
                              animationDuration: 1000,
                              radius: 70,
                              percent: ca.percentage / 100,
                              center:
                                  Text("${ca.percentage.round().toString()}%"),
                              footer: Text(
                                'Attendance\nPerc.',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          } else
            widget = Center(child: Text("OOPS! NO DATA!"));

          return widget;
        });
  }
}
