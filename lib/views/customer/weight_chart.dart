import 'package:flutter/material.dart';

enum DurationMethod {
  all,
  week,
  month,
}

class WeightChart extends StatefulWidget {
  @override
  _WeightChartState createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart> {
  DurationMethod _method = DurationMethod.all;

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
            Row(
              children: [
                Spacer(flex: 4),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                ),
                Text('October'),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
                Spacer(flex: 2),
                IconButton(
                  padding: EdgeInsets.only(right: 5.0),
                  icon: Icon(Icons.sort),
                  onPressed: () {
                    showDialog(
                        context: (context),
                        builder: (context) {
                          return AlertDialog(
                            content: StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RadioListTile(
                                    dense: true,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    toggleable: true,
                                    title: Text('All'),
                                    value: DurationMethod.all,
                                    groupValue: _method,
                                    onChanged: (value) {
                                      setState(() {
                                        _method = value;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    dense: true,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    toggleable: true,
                                    title: Text('This Week'),
                                    value: DurationMethod.week,
                                    groupValue: _method,
                                    onChanged: (value) {
                                      setState(() {
                                        _method = value;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    dense: true,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    toggleable: true,
                                    title: Text('This Month'),
                                    value: DurationMethod.month,
                                    groupValue: _method,
                                    onChanged: (value) {
                                      setState(() {
                                        _method = value;
                                      });
                                    },
                                  ),
                                ],
                              );
                            }),
                          );
                        });
                  },
                ),
              ],
            ),
            // Container(
            //   padding: EdgeInsets.all(10.0),
            //   child: ,
            // ),
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
          Text(label),
        ],
      ),
    );
  }
}
