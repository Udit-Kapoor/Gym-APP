import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BatchWiseClientsListView extends StatelessWidget {
  const BatchWiseClientsListView({Key key}) : super(key: key);

  BottomNavigationBarItem _buildItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Colors.black,
      ),
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
          'lib/assets/images/logo.png',
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
                  TimeTile(
                    timeText: '09.30-10.30',
                    batchSize: 10,
                    remote: false,
                  ),
                  TimeTile(
                    timeText: '11.00-12.00',
                    batchSize: 1,
                    remote: true,
                  ),
                  TimeTile(
                    timeText: '12.30-13.30',
                    batchSize: 10,
                    remote: false,
                  ),
                  TimeTile(
                    timeText: '14.00-15.00',
                    batchSize: 10,
                    remote: false,
                  ),
                  TimeTile(
                    timeText: '15.30-16.30',
                    batchSize: 2,
                    remote: true,
                  ),
                  TimeTile(
                    timeText: '17.00-18.00',
                    batchSize: 10,
                    remote: false,
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
              'lib/assets/images/logo.png',
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
  }) : super(key: key);
  final String timeText;
  final int batchSize;
  final bool remote;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            timeText,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(batchSize.toString()),
                Icon(Icons.person),
                Icon(
                  Icons.location_on,
                  color: remote ? Colors.red : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
