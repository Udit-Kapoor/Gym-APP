import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientsDetailsView extends StatelessWidget {
  const ClientsDetailsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
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
          'images/logo.png',
          fit: BoxFit.fill,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 50.0,
              child: Image.asset(
                'images/clients.png',
                fit: BoxFit.fill,
              ),
            ),
            title: Text(
              'Angelina Perry',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            subtitle: Text(
              '#60492',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.black),
            ),
            trailing: CircleAvatar(
              backgroundColor: Colors.green,
              child: IconButton(
                icon: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
          BottomNavigationBar(
            elevation: 0.0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 30.0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart, color: Colors.red),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, color: Colors.red),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.autorenew, color: Colors.red), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.appleAlt, color: Colors.red),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.fitness_center, color: Colors.red),
                  label: ''),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
