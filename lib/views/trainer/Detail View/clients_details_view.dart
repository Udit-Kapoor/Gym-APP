import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/lib.dart';
import 'package:expandable/expandable.dart';
import 'package:gym_app/models/trainer/clients_profile_model.dart';
import 'package:gym_app/views/trainer/Detail%20View/clients_gym_sub.dart';
import 'package:url_launcher/url_launcher.dart';

import '../my_goal_tile_trainer.dart';
import 'client_my_attendance.dart';

List<String> dropDownMenuItemMuscle = [
  'Back',
  'Biceps',
  'Cardio',
  'Chest',
  'Core',
  'Forearms',
  'Full body',
  'Legs',
  'Neck',
  'Shoulders',
  'Triceps',
  'Weightlifting',
  'Yoga',
  'Legs',
  'Neck',
  'Shoulders',
  'Triceps',
  'Weightlifting',
  'Yoga',
];
String dropDownValue = dropDownMenuItemMuscle[0];

class ClientsDetailsView extends StatefulWidget {
  const ClientsDetailsView(
      {Key key, @required this.name, @required this.cId, @required this.id})
      : super(key: key);

  final String name;
  final String cId;
  final int id;
  //TODO: Add phone no. and profile photo

  @override
  _ClientsDetailsViewState createState() => _ClientsDetailsViewState();
}

class _ClientsDetailsViewState extends State<ClientsDetailsView> {
  int _currentIndex = 0;
  List tabs;

  

  @override
  Widget build(BuildContext context) {
    tabs = [
      ClientsDashboard(
        id: widget.id,
      ),
      ClientsProfile(id: widget.id),
      ClientsGymSubscription(id: widget.id),
      CreateWorkout(id: widget.id),
      ];
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
          'lib/assets/logo.png',
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: clientsProfile(widget.id),
              builder: (c, s) {
                if (s.connectionState == ConnectionState.waiting)
                  return Center(
                    child: LinearProgressIndicator(),
                  );
                else if (s.connectionState == ConnectionState.done) {
                  var cp = clientsProfileModelFromJson(s.data.data);

                  return ListTile(
                    leading: CircleAvatar(
                      radius: 50.0,
                      // child: Image.asset(
                      //   'lib/assets/clients.png',
                      //   fit: BoxFit.fill,
                      // ),
                      backgroundImage: NetworkImage(baseURL + cp.photo ??
                          '/media/customer/photo/badge.png'),
                    ),
                    title: Text(
                      cp.firstName + ' ' + cp.lastName,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Text(
                      cp.cid,
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
                        onPressed: () async {
                          await launch('tel:${cp.phone}');
                        },
                      ),
                    ),
                  );
                }

                return Center(
                  child: const Text('Oops no data found'),
                );
              }),
          BottomNavigationBar(
            showSelectedLabels: true,
            iconSize: 30.0,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
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
  final int id;
  ClientsDashboard({Key key, @required this.id}) : super(key: key);
  final List _images = List.generate(
      8,
      (index) =>
          'https://images.unsplash.com/photo-1559949557-7d0ac3e655f2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=770&q=80');

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
      
        MyGoalTileTrainer(id: id),
        WeightChart(),
        ClientMyAttendance(id: id),
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
