import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  const CreateWorkout({Key key}) : super(key: key);

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
        WorkoutPlanNamesListView(),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: FloatingActionButton.extended(
            onPressed: () async {
              try {
                DateTime date = DateTime(1900);
                DateTime tDate = DateTime.now();
                date = await showDatePicker(
                  context: context,
                  initialDate: tDate,
                  firstDate: tDate,
                  lastDate: DateTime(tDate.year + 20),
                );
                // dateCtl.text = myFormat.format(date);
                Fluttertoast.showToast(msg: "Creating");
                Navigator.pushNamed(context, '/CreateNewWorkout');
              } on NoSuchMethodError {
                // return dateCtl.text = '';
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
                    collapsed: ExpandableButton(child: HeaderText(idx: i)),
                    expanded: ExpandableButton(
                      child: Column(
                        children: [
                          HeaderText(idx: i),
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
              ),
            );
          }),
    );
  }
}

class HeaderText extends StatelessWidget {
  final int idx;
  HeaderText({this.idx});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          workoutPlanName[idx],
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
