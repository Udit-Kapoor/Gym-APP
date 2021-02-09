import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BatchWiseClientsListView extends StatefulWidget {
  BatchWiseClientsListView({Key key}) : super(key: key);

  @override
  _BatchWiseClientsListViewState createState() =>
      _BatchWiseClientsListViewState();
}

class _BatchWiseClientsListViewState extends State<BatchWiseClientsListView> {
  BottomNavigationBarItem _buildItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.black),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Image.asset(
          'image/logo.png',
          fit: BoxFit.fill,
        ),
      ),
      body: SingleChildScrollView(
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
                  for (var i = 0; i < 9; i++)
                    TimeTile(
                      timeText: '1$i.00-1${i + 1}.00',
                      batchSize: Random().nextInt(20),
                      remote:
                          (Random().nextInt(10) + 1) % 2 == 0 ? false : true,
                      onTap: () {
                        Navigator.pushNamed(context, '/ClientsList');
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        items: [
          _buildItem('Home', Icons.home),
          _buildItem('Clients', FontAwesomeIcons.users),
          BottomNavigationBarItem(
            icon: Image.asset(
              'image/logo.png',
              fit: BoxFit.fill,
            ),
            label: 'gym',
          ),
        ],
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
