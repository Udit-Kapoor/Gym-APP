import 'package:flutter/material.dart';

import 'my_attendance.dart';
import 'my_drawer.dart';
import 'my_goal_title.dart';
import 'todays_workout_tile.dart';
import 'weight_chart.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

bool isCollapsed = true;

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
              onPressed: () {},
            ),
        ],
        title: Image.asset(
          'image/logo.png',
          fit: BoxFit.fill,
        ),
      ),
      body: Stack(
        children: <Widget>[
          MyDrawer(
            height: _height,
            width: _width,
          ),
          HomeScreen(
            height: _height,
            width: _width,
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);
  final Duration duration = Duration(milliseconds: 300);

  final double height;
  final double width;
  BottomNavigationBarItem _buildItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      label: label,
    );
  }

  final List _images = List.generate(
      8,
      (index) =>
          'https://images.unsplash.com/photo-1559949557-7d0ac3e655f2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=770&q=80');

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: isCollapsed ? 0 : height * 0.07,
      bottom: isCollapsed ? 0 : height * 0.18,
      left: isCollapsed ? 0 : width * 0.7,
      right: isCollapsed ? 0 : -width * 0.7,
      child: Material(
        elevation: 5.0,
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    TodaysWorkoutTile(),
                    MyGoalTile(),
                    WeightChart(),
                    MyAttendance(),
                    Text(
                      'My Transformation',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 5.0,
                      children: [
                        for (var i = 0; i < 8; i++)
                          Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            height: 100,
                            width: 100,
                            child: Image.network('${_images[i]}'),
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
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavigationBar(
                  backgroundColor: Colors.black,
                  elevation: 0.0,
                  items: [
                    _buildItem('Home', Icons.home),
                    _buildItem('Diet', Icons.restaurant),
                    _buildItem('Workout', Icons.work_outline),
                    _buildItem('H2O', Icons.person),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
