import 'package:flutter/material.dart';

class MyAttendance extends StatelessWidget {
  const MyAttendance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20.0,
                  ),
                  onTap: () {},
                ),
                Text('October', style: Theme.of(context).textTheme.headline6),
                GestureDetector(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var i = 1; i <= 7; i++)
                        DayWiseAttendance(
                            weekDay: 'Mon',
                            day: i,
                            attend: i % 2 == 0 ? true : false)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.donut_large,
                        size: 40.0,
                      ),
                      Text(
                        'Total\nAttendance',
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.donut_large,
                        size: 40.0,
                      ),
                      Text(
                        'Attendance\nPerc.',
                        textAlign: TextAlign.center,
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
  }
}

class DayWiseAttendance extends StatelessWidget {
  const DayWiseAttendance(
      {Key key,
      @required this.weekDay,
      @required this.day,
      this.attend,
      this.columnCount = 1})
      : super(key: key);

  final String weekDay;
  final int day;
  final bool attend;
  final int columnCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text('$weekDay\n$day', textAlign: TextAlign.center),
        for (var i = 0; i < columnCount; i++)
          Icon(attend ? Icons.check_circle_outline : Icons.cancel_outlined,
              color: attend ? Colors.green : Colors.red),
      ]),
    );
  }
}
