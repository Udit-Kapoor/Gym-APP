import 'package:flutter/material.dart';
import 'package:gym_app/views/trainer/client_list_tile.dart';

class Clients extends StatelessWidget {
  const Clients({Key key}) : super(key: key);

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
          'lib/assets/logo.png',
          height: 50,
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
                  'Today',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
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
                      cId: 60942.toString(),
                      goal: 'Fat Loss',
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
