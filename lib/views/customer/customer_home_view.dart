import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/views/home/Team/TeamPage.dart';
import 'package:gym_app/views/customer/home_index.dart';
import 'package:gym_app/views/customer/drawer/my_drawer.dart';
import 'package:gym_app/views/customer/workout_index.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({Key key}) : super(key: key);

  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

bool isCollapsed = true;

class _CustomerHomeState extends State<CustomerHome>
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
          CustomerHomeScreen(
            height: _height,
            width: _width,
          ),
        ],
      ),
    );
  }
}

class CustomerHomeScreen extends StatefulWidget {
  CustomerHomeScreen({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final Duration duration = Duration(milliseconds: 300);

  final List tabs = [
    HomeIndex(),
    WorkoutIndex(),
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
              tabs[_currentIndex],
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
                            Icons.fitness_center,
                            color: Colors.red,
                            size: 30.0,
                          )
                        : Icon(
                            Icons.fitness_center,
                            color: Colors.black,
                          ),
                    label: 'workout',
                  ),
                  BottomNavigationBarItem(
                    icon: _currentIndex == 2
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
