import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/lib.dart';

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
              onPressed: () {},
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
          MyDrawer(
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
    Expanded(child: Container(color: Colors.amber)), //TODO trainer dashboard
    BatchWiseClientsListView(),
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
