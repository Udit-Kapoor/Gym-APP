import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/views/customer/drawer/customer_gym_subscription_view.dart';
import 'package:gym_app/views/customer/my_attendance.dart';
import 'package:gym_app/views/customer/my_goal_title.dart';
import 'package:gym_app/views/customer/todays_workout_tile.dart';
import 'package:gym_app/views/customer/weight_chart.dart';
import 'package:gym_app/views/trainer/clients_information.dart';

class ClientsDetailsView extends StatefulWidget {
  const ClientsDetailsView({Key key}) : super(key: key);

  @override
  _ClientsDetailsViewState createState() => _ClientsDetailsViewState();
}

class _ClientsDetailsViewState extends State<ClientsDetailsView> {
  int _currentIndex = 0;
  final List tabs = [
    ClientsDashboard(),
    ClientsInformation(),
    CustomerGymSubscriptionView(),
    Container(color: Colors.blueAccent),
    Container(color: Colors.amberAccent),
  ];
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'image/logo.png',
          fit: BoxFit.fill,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 50.0,
              child: Image.asset(
                'image/clients.png',
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
            showSelectedLabels: true,
            iconSize: 30.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
                print(_currentIndex);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: _currentIndex == 0
                    ? CircleAvatar(
                        child: Icon(Icons.bar_chart, color: Colors.white),
                        backgroundColor: Colors.red,
                      )
                    : Icon(Icons.bar_chart, color: Colors.red),
                label: 'Graph',
              ),
              BottomNavigationBarItem(
                  icon: _currentIndex == 1
                      ? CircleAvatar(
                          child:
                              Icon(Icons.person_outline, color: Colors.white),
                          backgroundColor: Colors.red,
                        )
                      : Icon(Icons.person_outline, color: Colors.red),
                  label: 'User'),
              BottomNavigationBarItem(
                  icon: _currentIndex == 2
                      ? CircleAvatar(
                          child: Icon(Icons.autorenew, color: Colors.white),
                          backgroundColor: Colors.red,
                        )
                      : Icon(Icons.autorenew, color: Colors.red),
                  label: 'Renew'),
              BottomNavigationBarItem(
                  icon: _currentIndex == 3
                      ? CircleAvatar(
                          child: Icon(FontAwesomeIcons.appleAlt,
                              color: Colors.white),
                          backgroundColor: Colors.red,
                        )
                      : Icon(FontAwesomeIcons.appleAlt, color: Colors.red),
                  label: 'Food'),
              BottomNavigationBarItem(
                  icon: _currentIndex == 4
                      ? CircleAvatar(
                          child:
                              Icon(Icons.fitness_center, color: Colors.white),
                          backgroundColor: Colors.red,
                        )
                      : Icon(Icons.fitness_center, color: Colors.red),
                  label: 'Workout'),
            ],
          ),
          Expanded(child: tabs[_currentIndex]),
        ],
      ),
    );
  }
}

class ClientsDashboard extends StatelessWidget {
  ClientsDashboard({Key key}) : super(key: key);
  final List _images = List.generate(
      8,
      (index) =>
          'https://images.unsplash.com/photo-1559949557-7d0ac3e655f2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=770&q=80');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TodaysWorkoutTile(),
        MyGoalTile(),
        WeightChart(),
        MyAttendance(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Transformation',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5.0,
          children: [
            for (var i = 0; i < 8; i++)
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(bottom: 5.0),
                  height: 100,
                  width: 100,
                  child: Image.network(
                    '${_images[i]}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            Container(
              height: 100,
              width: 100,
              child: IconButton(
                icon: Icon(Icons.add_a_photo),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
