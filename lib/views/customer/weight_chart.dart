import 'package:flutter/material.dart';

class WeightChart extends StatelessWidget {
  const WeightChart({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Weight Chart',
              style: Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
            Container(
              padding: EdgeInsets.all(10.0),
              child: Image.asset(
                'image/chart.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ChartIndicaters(
                    dotColor: Color.fromRGBO(178, 223, 138, 1),
                    label: 'This Month',
                  ),
                  ChartIndicaters(
                    dotColor: Color.fromRGBO(166, 206, 227, 1),
                    label: 'Last Month',
                  ),
                  ChartIndicaters(
                    dotColor: Color.fromRGBO(31, 120, 180, 1),
                    label: 'Last year',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartIndicaters extends StatelessWidget {
  const ChartIndicaters({
    Key key,
    this.label,
    this.dotColor,
  }) : super(key: key);
  final String label;
  final Color dotColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.stop_circle,
            size: 10.0,
            color: dotColor,
          ),
          SizedBox(width: 5),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
