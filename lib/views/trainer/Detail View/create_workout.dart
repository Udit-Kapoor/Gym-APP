import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/models/customer/workout_plan_name.dart';

import 'create_workout_plan.dart';

class CreateWorkout extends StatefulWidget {
  final int id;
  final String kuchBhi;

  const CreateWorkout({Key key, @required this.id, this.kuchBhi})
      : super(key: key);

  @override
  _CreateWorkoutState createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WorkoutPlanNamesListView(id: widget.id),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: FloatingActionButton.extended(
            onPressed: () async {
              try {
                DateTime tDate = DateTime.now();
                selectedDate = await showDatePicker(
                  context: context,
                  initialDate: tDate,
                  firstDate: tDate,
                  lastDate: DateTime(tDate.year + 20),
                );
                if (selectedDate != null) {
                  Fluttertoast.showToast(msg: "Creating");

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CreateWorkoutPlan(
                                setState: () => setState(() {}),
                                dateTime: selectedDate,
                                id: widget.id,
                              )));
                }
              } on NoSuchMethodError catch (e) {
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
  final int id;
  WorkoutPlanNamesListView({@required this.id});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
            future: workoutPlanListClient(id),
            builder: (c, s) {
              if (s.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              else if (s.connectionState == ConnectionState.done) {
                var cp = workoutPlanNameModelFromJson(s.data.data);
                return ListView.builder(
                    itemCount: cp.length,
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
                                  workoutPlanName: cp[i].name,
                                  expanded: false,
                                ),
                              ),
                              expanded: Column(
                                children: [
                                  ExpandableButton(
                                    child: HeaderText(
                                      workoutPlanName: cp[i].name,
                                      expanded: true,
                                      // collapse: ExpandableButton(
                                      //     child: Icon(Icons.keyboard_arrow_down)),
                                    ),
                                  ),
                                  for (var kuch in cp[i].workouts)
                                    ListTile(
                                      title: Text(kuch.name),
                                      subtitle: Text(kuch.muscle),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }

              return Center(child: Text("oops no data found"));
            }));
  }
}

class HeaderText extends StatelessWidget {
  final bool expanded;
  final Widget collapse;
  final String workoutPlanName;
  HeaderText({this.expanded, this.collapse, @required this.workoutPlanName});

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
          workoutPlanName,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
