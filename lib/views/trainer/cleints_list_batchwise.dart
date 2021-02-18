import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({Key key, this.batchTimings}) : super(key: key);

  final String batchTimings;

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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'lib/assets/logo.png',
          fit: BoxFit.fill,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(2.0),
                    color: Colors.red,
                    child: Text(
                      '30\nOct',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                ),
                Text(
                  batchTimings,
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
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 11,
            child: Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  for (var i = 0; i < 10; i++)
                    ClientsListTile(
                      name: 'Angelina Perry',
                      cId: 60942,
                      goal: 'Fat Loss',
                      onTap: () {
                        Navigator.pushNamed(context, '/ClientsDetailsView');
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
