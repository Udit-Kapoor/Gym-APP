import 'package:flutter/material.dart';
import 'package:gym_app/views/home/weight_chart.dart';
import 'my_attendance.dart';
import 'my_drawer.dart';
import 'my_goal_tile.dart';
import 'todays_workout_tile.dart';
export 'home_view.dart';

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
          'lib/assets/images/logo.png',
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
                    MyGoalTile(height: height),
                    WeightChart(height: height),
                    MyAttendance(height: height),
                    MyTransformation(height: height),
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

class MyTransformation extends StatelessWidget {
  MyTransformation({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  final List _images = List.generate(
      8,
      (index) =>
          'https://images.unsplash.com/photo-1559949557-7d0ac3e655f2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=770&q=80');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.4,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'My Transformation',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                  padding: EdgeInsets.all(5.0),
                  itemCount: _images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Image.network('${_images[index]}'),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
