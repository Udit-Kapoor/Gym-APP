import 'package:flutter/material.dart';

class TodaysWorkoutTile extends StatelessWidget {
  final String dateNum;
  final String month;
  final String batchTime;
  final String dayName;

  const TodaysWorkoutTile(
      {Key key,
      @required this.dateNum,
      @required this.month,
      @required this.batchTime,
      @required this.dayName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        tileColor: Colors.white,
        leading: Container(
          color: Colors.red,
          height: 60.0,
          width: 60.0,
          child: Center(
            child: Text(
              '$dateNum\n$month',
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
          '$dayName Day',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            Text(batchTime),
          ],
        ),
      ),
    );
  }
}
