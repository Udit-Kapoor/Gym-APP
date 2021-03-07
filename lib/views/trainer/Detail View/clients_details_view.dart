import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/lib.dart';
import 'package:expandable/expandable.dart';
import 'package:gym_app/views/trainer/Detail%20View/clients_gym_sub.dart';

DateTime _selectedDate;
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
  int _workoutIndex = 0;
  List tabs;

  incrementIndex() {
    setState(() {
      _workoutIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    tabs = [
      ClientsDashboard(),
      ClientsProfile(id: widget.id),
      ClientsGymSubscription(id: widget.id),
      if (_workoutIndex == 0) CreateWorkout(incrementCallBack: incrementIndex),
      if (_workoutIndex == 1)
        GestureDetector(
          onTap: () => setState(() => _workoutIndex = 2),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: FlatButton(
                        color: Colors.red,
                        onPressed: () => setState(() => _workoutIndex = 3),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          side: BorderSide(width: 1.5, color: Colors.red),
                        ),
                        child: Text(
                          'Add Custom',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: FlatButton(
                        color: Colors.red,
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          side: BorderSide(width: 1.5, color: Colors.red),
                        ),
                        child: Text(
                          '1 Jan',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.trailing,
                          
                          title: Text(
                            'Air Bike',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Text(
                            'Core',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          value: false,
                          onChanged: (value) {},
                        ),
                      );
                    }),
              ),
             
             
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          side: BorderSide(width: 1.5, color: Colors.red),
                        ),
                        child: Text(
                          'Cancel',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                      child: FlatButton(
                        color: Colors.red,
                        onPressed: () => showDialog(
                          context: (context),
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Workout Name',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            content: TextField(
                              decoration: InputDecoration(
                                hintText: "name",
                              ),
                            ),
                            actions: [
                              FlatButton(
                                color: Colors.red,
                                onPressed: () {},
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  side:
                                      BorderSide(width: 1.5, color: Colors.red),
                                ),
                                child: Text(
                                  'Save',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          side: BorderSide(width: 1.5, color: Colors.red),
                        ),
                        child: Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      if (_workoutIndex == 2)
        GestureDetector(
          onTap: () {
            setState(() {
              _workoutIndex = 1;
            });
          },
          child: Container(
            height: 200,
            width: 50,
            color: Colors.blue,
          ),
        ),
      if (_workoutIndex == 3)
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TextField(
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.black),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  labelText: 'Name',
                  labelStyle: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black),
                  hintText: 'enter exercise name',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: InputDecorator(
                expands: false,
                decoration: InputDecoration(
                  labelText: 'Topic',
                  labelStyle: Theme.of(context).textTheme.headline6,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: true,
                    value: dropDownValue,
                    onChanged: (value) {
                      setState(() {
                        dropDownValue = value;
                      });
                    },
                    items: dropDownMenuItemMuscle.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: FloatingActionButton.extended(
                onPressed: () {},
                label: Text(
                  '+ Create New Exercise',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white),
                ),
                elevation: 1.0,
              ),
            )
          ],
        ),
    ];
    return WillPopScope(
      onWillPop: () async {
        switch (_workoutIndex) {
          case 0:
            return true;
          case 1:
            _workoutIndex = 0;
            return false;
          case 2:
            _workoutIndex = 1;
            return false;
          case 3:
            _workoutIndex = 2;
            return false;
          default:
            return false;
        }
      },
      child: Scaffold(
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
            ListTile(
              leading: CircleAvatar(
                radius: 50.0,
                child: Image.asset(
                  'lib/assets/clients.png',
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                widget.name,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              subtitle: Text(
                widget.cId,
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
      physics: BouncingScrollPhysics(),
      children: [
        TodaysWorkoutTile(
            // dateNum: '30',
            // month: 'Oct',
            // batchTime: '09.30-10.30',
            // dayName: 'Chest',
            ),
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

Map<String, List<String>> workoutPlan = {
  'chest': [
    'Inclined Rod',
    'Declined Rod',
    'Bars',
    'Pull Bars',
    'Push Ups',
    'Push Downs'
  ],
  'leg': [
    'Inclined Rod',
    'Declined Rod',
    'Bars',
    'Pull Bars',
    'Push Ups',
    'Push Downs'
  ],
  'triceps': [
    'Inclined Rod',
    'Declined Rod',
    'Bars',
    'Pull Bars',
    'Push Ups',
    'Push Downs'
  ],
  'biceps': [
    'Inclined Rod',
    'Declined Rod',
    'Bars',
    'Pull Bars',
    'Push Ups',
    'Push Downs'
  ],
  'tummy': [
    'Inclined Rod',
    'Declined Rod',
    'Bars',
    'Pull Bars',
    'Push Ups',
    'Push Downs'
  ],
  'brain': [
    'Inclined Rod',
    'Declined Rod',
    'Bars',
    'Pull Bars',
    'Push Ups',
    'Push Downs'
  ],
};

List workoutPlanName = ['chest', 'leg', 'triceps', 'biceps', 'tummy', 'brain'];

class CreateWorkout extends StatefulWidget {
  final Function incrementCallBack;
  const CreateWorkout({Key key, this.incrementCallBack}) : super(key: key);

  @override
  _CreateWorkoutState createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {},
              ),
              Text(
                '1 Jan',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
        WorkoutPlanNamesListView(incrementCallback: widget.incrementCallBack),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: FloatingActionButton.extended(
            onPressed: () async {
              try {
                DateTime tDate = DateTime.now();
                _selectedDate = await showDatePicker(
                  context: context,
                  initialDate: tDate,
                  firstDate: tDate,
                  lastDate: DateTime(tDate.year + 20),
                );
                Fluttertoast.showToast(msg: "Creating");
                widget.incrementCallBack();
              } on NoSuchMethodError {
                Fluttertoast.showToast(msg: "No Date Selected");
              } catch (e) {
                return e;
              }
            },
            label: Text(
              '+ Create Workout Plan',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white),
            ),
            elevation: 1.0,
          ),
        ),
      ],
    );
  }
}

class WorkoutPlanNamesListView extends StatelessWidget {
  final Function incrementCallback;
  WorkoutPlanNamesListView({this.incrementCallback});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: workoutPlanName.length,
          itemBuilder: (BuildContext context, int i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpandableNotifier(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 4.0,
                  child: Expandable(
                    collapsed: ExpandableButton(
                      child: HeaderText(
                        idx: i,
                        expanded: false,
                      ),
                    ),
                    expanded: Column(
                      children: [
                        HeaderText(
                          idx: i,
                          expanded: true,
                          collapse: ExpandableButton(
                              child: Icon(Icons.keyboard_arrow_down)),
                          editFunction: incrementCallback,
                        ),
                        for (var i in [1, 2, 3, 4, 6, 8, 7, 9, 9])
                          ListTile(
                            title: Text(i.toString()),
                            subtitle: Text("Core"),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class HeaderText extends StatelessWidget {
  final int idx;
  final bool expanded;
  final Function editFunction;
  final Widget collapse;
  HeaderText({this.idx, this.expanded, this.editFunction, this.collapse});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (expanded) collapse,
            Text(
              workoutPlanName[idx],
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            if (expanded)
              IconButton(icon: Icon(Icons.edit), onPressed: editFunction)
          ],
        ),
      ),
    );
  }
}
