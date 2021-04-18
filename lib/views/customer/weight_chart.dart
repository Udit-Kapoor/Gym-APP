import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:gym_app/apis/apis.dart';
import 'package:gym_app/models/weight_graph_model.dart';

class WeightChart extends StatefulWidget {
  final ApiResponse res;

  const WeightChart({Key key, @required this.res}) : super(key: key);
  @override
  _WeightChartState createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart> {
  List<WeightData> _series1;

  @override
  void initState() {
    super.initState();
    this._series1 = _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print(this._series1.toString());
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
            SizedBox(
              height: 300,
              child: TimeSeriesChart(
                /*seriesList=*/ [
                  Series<WeightData, DateTime>(
                    id: 'Weight',
                    colorFn: (_, __) => MaterialPalette.red.shadeDefault,
                    domainFn: (WeightData weight, _) => weight.time,
                    measureFn: (WeightData weight, _) => weight.weight,
                    data: this._series1,
                  ),
                ],
                defaultInteractions: false,
                defaultRenderer: LineRendererConfig(
                  includePoints: true,
                ),
                behaviors: [
                  ChartTitle(
                    'Weight (kg)',
                    behaviorPosition: BehaviorPosition.start,
                    titleStyleSpec: TextStyleSpec(fontSize: 12),
                  ),
                  SeriesLegend(position: BehaviorPosition.bottom),
                  LinePointHighlighter(
                    showHorizontalFollowLine:
                        LinePointHighlighterFollowLineType.all,
                    showVerticalFollowLine:
                        LinePointHighlighterFollowLineType.nearest,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<WeightData> _fetchData() {
    var cp = weightGraphModelFromJson(widget.res.data);

    return [
      for (var c in cp)
        if (c.date.month == DateTime.now().month)
          WeightData(
            time: c.date,
            weight: c.weight,
          ),
    ];
  }
}

class WeightData {
  final DateTime time;
  final double weight;

  WeightData({this.time, this.weight});
}
