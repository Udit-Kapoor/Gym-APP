import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym_app/views/trainer/cleints_list_batchwise.dart';

class BatchWiseClientsListView extends StatefulWidget {
  BatchWiseClientsListView({Key key}) : super(key: key);

  @override
  _BatchWiseClientsListViewState createState() =>
      _BatchWiseClientsListViewState();
}

class _BatchWiseClientsListViewState extends State<BatchWiseClientsListView> {
  final List<Map<String, dynamic>> batchList = [
    {
      'timings': '10.00-11.00',
      'batchSize': 5,
      'remote': true,
    },
     {
      'timings': '10.00-11.00',
      'batchSize': 5,
      'remote': true,
    }, {
      'timings': '10.00-11.00',
      'batchSize': 5,
      'remote': true,
    }, {
      'timings': '10.00-11.00',
      'batchSize': 5,
      'remote': true,
    }, {
      'timings': '10.00-11.00',
      'batchSize': 5,
      'remote': true,
    }, {
      'timings': '10.00-11.00',
      'batchSize': 5,
      'remote': true,
    }, {
      'timings': '10.00-11.00',
      'batchSize': 5,
      'remote': true,
    }, {
      'timings': '10.00-11.00',
      'batchSize': 5,
      'remote': true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'My Batches',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                ),
                Text(
                  'Today',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                RotatedBox(
                  quarterTurns: 2,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Material(
              elevation: 4.0,
              child: Wrap(
                runSpacing: 10.0,
                children: [
                  for (var batch in batchList) 
                    TimeTile(
                      timeText: batch['timings'],
                      batchSize:batch['batchSize'],
                      remote:
                          (Random().nextInt(10) + 1) % 2 == 0 ? false : true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClientsList(batchTimings:batch['timings'] ),
                          ),
                        );
                      },
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

class TimeTile extends StatelessWidget {
  const TimeTile({
    Key key,
    @required this.timeText,
    @required this.batchSize,
    @required this.remote,
    this.onTap,
  }) : super(key: key);
  final String timeText;
  final int batchSize;
  final bool remote;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(),
          Text(
            timeText,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Spacer(flex: 3),
          Text(batchSize.toString()),
          Spacer(),
          Icon(Icons.person),
          Spacer(),
          Icon(
            Icons.location_on,
            color: remote ? Colors.red : Colors.transparent,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
