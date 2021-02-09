import 'package:flutter/material.dart';

class MyAttendance extends StatelessWidget {
  const MyAttendance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text('October'),
              GestureDetector(
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20.0,
                  ),
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
    );
  }
}

class DayWiseAttendance extends StatelessWidget {
  const DayWiseAttendance(
      {Key key, @required this.weekDay, @required this.day, this.attend})
      : super(key: key);

  final String weekDay;
  final int day;
  final bool attend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Spacer(),
        Text(
          '$weekDay\n$day',
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Icon(attend ? Icons.check_circle_outline : Icons.cancel_outlined,
            color: attend ? Colors.green : Colors.red),
        Spacer(),
      ]),
    );
  }
}
