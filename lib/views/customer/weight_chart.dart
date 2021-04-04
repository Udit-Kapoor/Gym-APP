import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class WeightChart extends StatefulWidget {
  @override
  _WeightChartState createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Weight Chart',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
            //ToDo:Fix
            // charts.TimeSeriesChart(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ChartIndicaters(
                dotColor: Color.fromRGBO(166, 206, 227, 1),
                label: 'This Month',
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
          Text(label),
        ],
      ),
    );
  }
}

// class WeightData {
//   final
// }
