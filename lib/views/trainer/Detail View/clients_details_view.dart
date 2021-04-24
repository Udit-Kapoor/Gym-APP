import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/trainer/clients_profile_model.dart';
import 'package:gym_app/models/weight_graph_model.dart';
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

  @override
  _ClientsDetailsViewState createState() => _ClientsDetailsViewState();
}

class _ClientsDetailsViewState extends State<ClientsDetailsView> {
  int _currentIndex = 0;
  List tabs;

  @override
  Widget build(BuildContext context) {
    tabs = [
      ClientsDashboard(id: widget.id),
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
                      backgroundImage: NetworkImage(baseURL + cp.photo ??
                          '/media/customer/photo/noimage.jpg'),
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
                label: 'Info',
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? CircleAvatar(
                        child: Icon(Icons.person_outline, color: Colors.white),
                        backgroundColor: Colors.red,
                      )
                    : Icon(Icons.person_outline, color: Colors.red),
                label: 'User',
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 2
                    ? CircleAvatar(
                        child: Icon(Icons.autorenew, color: Colors.white),
                        backgroundColor: Colors.red,
                      )
                    : Icon(Icons.autorenew, color: Colors.red),
                label: 'Subs',
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 3
                    ? CircleAvatar(
                        child: Icon(Icons.fitness_center, color: Colors.white),
                        backgroundColor: Colors.red,
                      )
                    : Icon(Icons.fitness_center, color: Colors.red),
                label: 'Workout',
              ),
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      cacheExtent: 999,
      physics: BouncingScrollPhysics(),
      children: [
        MyGoalTileTrainer(id: id),
        FutureBuilder(
            future: trainerWeightGraph(id),
            builder: (context, s) {
              if (s.connectionState == ConnectionState.done)
                return WeightChart(res: s.data);
              else if (s.connectionState == ConnectionState.waiting)
                return LinearProgressIndicator();
              return Container();
            }),
        ClientMyAttendance(id: id),
      ],
    );
  }
}
