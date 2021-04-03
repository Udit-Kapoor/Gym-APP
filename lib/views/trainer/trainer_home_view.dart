import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/trainer/clients_count.dart';
import 'package:gym_app/models/trainer/trainer_attendance_model.dart';
import 'package:gym_app/views/common/qr_code_scanner.dart';
import 'package:gym_app/views/trainer/upcoming_batches_tile.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'trainer_drawer.dart';

class TrainerHome extends StatefulWidget {
  const TrainerHome({Key key}) : super(key: key);

  @override
  _TrainerHomeState createState() => _TrainerHomeState();
}

bool isCollapsed = true;

class _TrainerHomeState extends State<TrainerHome>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          enableFeedback: false,
          onPressed: () {
            setState(
              () {
                isCollapsed ? _controller.reverse() : _controller.forward();
                isCollapsed = !isCollapsed;
              },
            );
          },
          icon: AnimatedIcon(
            size: 30.0,
            progress: _controller,
            icon: AnimatedIcons.close_menu,
            color: Colors.black,
          ),
        ),
        actions: [
          if (isCollapsed)
            IconButton(
              icon: Icon(
                Icons.qr_code_scanner,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => QRCodeScan()));
              },
            ),
        ],
        title: Image.asset(
          'lib/assets/logo.png',
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
      body: Stack(
        children: <Widget>[
          TrainerDrawer(
            height: _height,
            width: _width,
          ),
          TrainerHomeScreen(
            height: _height,
            width: _width,
          ),
        ],
      ),
    );
  }
}

class TrainerHomeScreen extends StatefulWidget {
  TrainerHomeScreen({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  _TrainerHomeScreenState createState() => _TrainerHomeScreenState();
}

class _TrainerHomeScreenState extends State<TrainerHomeScreen> {
  final Duration duration = Duration(milliseconds: 300);

  final List trainerTabs = [
    TrainerHomeIndex(),
    BatchTimings(),
    Expanded(child: TeamPage()),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: isCollapsed ? 0 : widget.height * 0.07,
      bottom: isCollapsed ? 0 : widget.height * 0.18,
      left: isCollapsed ? 0 : widget.width * 0.7,
      right: isCollapsed ? 0 : -widget.width * 0.7,
      child: Material(
        elevation: 4.0,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              trainerTabs[_currentIndex],
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                elevation: 0.0,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: _currentIndex == 0
                        ? Icon(
                            Icons.home,
                            color: Colors.red,
                            size: 30.0,
                          )
                        : Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: _currentIndex == 1
                        ? Icon(
                            FontAwesomeIcons.users,
                            color: Colors.red,
                            size: 30.0,
                          )
                        : Icon(
                            FontAwesomeIcons.users,
                            color: Colors.black,
                          ),
                    label: 'H2O',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Custom.h2o,
                      color: _currentIndex == 2 ? Colors.red : Colors.black,
                      size: _currentIndex == 2 ? 30.0 : 24.0,
                    ),
                    label: 'workout',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrainerHomeIndex extends StatelessWidget {
  const TrainerHomeIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          UpcomingBatchesTile(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: FutureBuilder(
                future: clientCount(),
                builder: (c, s) {
                  if (s.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());
                  else if (s.connectionState == ConnectionState.done) {
                    var cc = clientCountModelFromJson(s.data.data);
                    return CircularPercentIndicator(
                      progressColor: Colors.blue[700],
                      animation: true,
                      animationDuration: 1000,
                      radius: 70,
                      percent: 0.75,
                      center: Text(cc.count.toString()),
                      footer: Text(
                        'My Total\nClients',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    );
                  }
                  return Center(child: Text("opps no data found"));
                }),
          ),
          TrainerMyAttendance(),
        ],
      ),
    );
  }
}

class TrainerMyAttendance extends StatelessWidget {
  const TrainerMyAttendance({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: trainerAttendance(),
        builder: (c, s) {
          var widget;
          if (s.connectionState == ConnectionState.waiting) {
            widget = Center(child: CircularProgressIndicator());
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var ca = trainerAttendanceModelFromJson(s.data.data);

            widget = Material(
              elevation: 4.0,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'My Attendance',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Wrap(
                            children: [
                              for (var att in ca.list)
                                DayWiseAttendance(
                                  date: DateFormat.MMMd()
                                      .format(DateTime.parse(att[0])),
                                  attend: att[1] == 'True' ? true : false,
                                )
                            ],
                          ),
                        ),
                        Expanded(
                          child: CircularPercentIndicator(
                            progressColor: Colors.blue[700],
                            animation: true,
                            animationDuration: 1000,
                            radius: 70,
                            percent: ca.percentage / 100,
                            center:
                                Text("${ca.percentage.round().toString()}%"),
                            footer: Text(
                              'Attendance\nPerc.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else
            widget = Center(child: Text("OOPS! NO DATA!"));

          return widget;
        });
  }
}
