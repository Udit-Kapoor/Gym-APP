import 'package:flutter/material.dart';

class MyAttendance extends StatelessWidget {
  const MyAttendance({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: Container(
        height: height * 0.4,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'My Attendance',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
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
                Flexible(
                  child: Container(
                    height: height * 0.3,
                    child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Text(
                            'Day\n$index',
                            textAlign: TextAlign.center,
                          ),
                          trailing: index % 2 == 0
                              ? Icon(Icons.check_circle_outline,
                                  color: Colors.green)
                              : Icon(Icons.cancel_outlined, color: Colors.red),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: height * 0.3,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
