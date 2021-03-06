import 'package:flutter/material.dart';
import 'package:gym_app/models/customer%20model/customer_attendance_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyAttendance extends StatelessWidget {
  const MyAttendance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: customerAttendance(),
        builder: (c, s) {
          var widget;
          if (s.connectionState == ConnectionState.waiting) {
            widget = Center(child: CircularProgressIndicator());
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var ca = customerAttendanceModelFromJson(s.data.data);

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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircularPercentIndicator(
                                progressColor: Colors.blue[700],
                                animation: true,
                                animationDuration: 1000,
                                radius: 70,
                                percent: ca.percentage / 100,
                                center: Text(
                                    '${ca.totalAttendanceNumerator}/${ca.totalAttendanceDenominator}'),
                                footer: Text(
                                  'Total\nAttendance',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              CircularPercentIndicator(
                                progressColor: Colors.blue[700],
                                animation: true,
                                animationDuration: 1000,
                                radius: 70,
                                percent: ca.percentage / 100,
                                center: Text(
                                    "${ca.percentage.round().toString()}%"),
                                footer: Text(
                                  'Attendance\nPerc.',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
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

class DayWiseAttendance extends StatelessWidget {
  const DayWiseAttendance(
      {Key key, @required this.date, this.attend, this.columnCount = 1})
      : super(key: key);

  final String date;
  final bool attend;
  final int columnCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(date, textAlign: TextAlign.center),
        for (var i = 0; i < columnCount; i++)
          Icon(attend ? Icons.check_circle_outline : Icons.cancel_outlined,
              color: attend ? Colors.green : Colors.red),
      ]),
    );
  }
}
