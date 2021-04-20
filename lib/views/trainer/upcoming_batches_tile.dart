import 'package:flutter/material.dart';
import 'package:gym_app/models/trainer/batch_timings_model.dart';
import 'package:intl/intl.dart';

class UpcomingBatchesTile extends StatelessWidget {
  const UpcomingBatchesTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: FutureBuilder(
        future: batchTimings(),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting)
            return Center(child: LinearProgressIndicator());
          else if (s.connectionState == ConnectionState.done) {
            var x = batchTimingsModelFromJson(s.data.data);

            DateTime timeNow = DateTime.now();

            List<Map> upTimingList = List.generate(x.length, (i) {
              return {
                'time': {
                  'from': DateTime.parse('9999-00-00 ' + x[i].batchTimeFrom),
                  'to': DateTime.parse('9999-00-00 ' + x[i].batchTimeTo),
                },
                'count': x[i].cust.length,
              };
            });

            upTimingList.sort((a, b) {
              var diff = a['time']['from'].difference(b['time']['from']);

              if (diff.isNegative) return 0;
              return 1;
            });

            for (var v in upTimingList) {
              // print(TimeOfDay.fromDateTime(v['time']['from']));
            }

            var dateSplit = DateFormat.MMMd().format(DateTime.now()).split(' ');
            return ListTile(
              onTap: () {},
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              tileColor: Colors.white,
              leading: Container(
                color: Colors.red,
                height: 60.0,
                width: 60.0,
                child: Center(
                  child: Text(
                    '${dateSplit[1]}\n${dateSplit[0]}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              title: Text('Upcoming Batches'),
              subtitle: Text(
                '09.30 - 10.30',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('10'),
                  Icon(Icons.person),
                ],
              ),
            );
          }
          return Center(
            child: Text('Oops no data found'),
          );
        },
      ),
    );
  }
}
