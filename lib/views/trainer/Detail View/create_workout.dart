import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/models/customer/workout_plan_name.dart';

//  if (_workoutIndex == 0) CreateWorkout(incrementCallBack: incrementIndex),
//       if (_workoutIndex == 1)
//         GestureDetector(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 3,
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                       child: FlatButton(
//                         color: Colors.red,
//                         onPressed: () => setState(() => _workoutIndex = 3),
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 20.0, vertical: 10.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(20.0),
//                           ),
//                           side: BorderSide(width: 1.5, color: Colors.red),
//                         ),
//                         child: Text(
//                           'Add Custom',
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline6
//                               .copyWith(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//                       child: FlatButton(
//                         color: Colors.red,
//                         onPressed: () {},
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 20.0, vertical: 10.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(5),
//                           ),
//                           side: BorderSide(width: 1.5, color: Colors.red),
//                         ),
//                         child: Text(
//                           '1 Jan',
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline6
//                               .copyWith(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: ListView.builder(
//                     physics: BouncingScrollPhysics(),
//                     itemCount: 30,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Card(
//                         margin: EdgeInsets.symmetric(
//                             horizontal: 20.0, vertical: 5.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: CheckboxListTile(
//                           controlAffinity: ListTileControlAffinity.trailing,
//                           title: Text(
//                             'Air Bike',
//                             style: Theme.of(context).textTheme.headline6,
//                           ),
//                           subtitle: Text(
//                             'Core',
//                             style: Theme.of(context).textTheme.bodyText2,
//                           ),
//                           value: false,
//                           onChanged: (value) {},
//                         ),
//                       );
//                     }),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
//                       child: FlatButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 20.0, vertical: 10.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(20.0),
//                           ),
//                           side: BorderSide(width: 1.5, color: Colors.red),
//                         ),
//                         child: Text(
//                           'Cancel',
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline6
//                               .copyWith(color: Colors.red),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
//                       child: FlatButton(
//                         color: Colors.red,
//                         onPressed: () => showDialog(
//                           context: (context),
//                           builder: (context) => AlertDialog(
//                             title: Text(
//                               'Workout Name',
//                               style: Theme.of(context).textTheme.headline6,
//                             ),
//                             content: TextField(
//                               decoration: InputDecoration(
//                                 hintText: "name",
//                               ),
//                             ),
//                             actions: [
//                               FlatButton(
//                                 color: Colors.red,
//                                 onPressed: () {},
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 20.0, vertical: 10.0),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(20.0),
//                                   ),
//                                   side:
//                                       BorderSide(width: 1.5, color: Colors.red),
//                                 ),
//                                 child: Text(
//                                   'Save',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headline6
//                                       .copyWith(color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 20.0, vertical: 10.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(20.0),
//                           ),
//                           side: BorderSide(width: 1.5, color: Colors.red),
//                         ),
//                         child: Text(
//                           'Save',
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline6
//                               .copyWith(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       if (_workoutIndex == 2)
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               _workoutIndex = 1;
//             });
//           },
//           child: Container(
//             height: 200,
//             width: 50,
//             color: Colors.blue,
//           ),
//         ),
//       if (_workoutIndex == 3)
//         Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//               child: TextField(
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline5
//                     .copyWith(color: Colors.black),
//                 decoration: InputDecoration(
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(
//                       color: Colors.black,
//                       width: 2.0,
//                     ),
//                   ),
//                   labelText: 'Name',
//                   labelStyle: Theme.of(context)
//                       .textTheme
//                       .headline6
//                       .copyWith(color: Colors.black),
//                   hintText: 'enter exercise name',
//                   hintStyle: Theme.of(context)
//                       .textTheme
//                       .headline5
//                       .copyWith(color: Colors.grey),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: InputDecorator(
//                 expands: false,
//                 decoration: InputDecoration(
//                   labelText: 'Topic',
//                   labelStyle: Theme.of(context).textTheme.headline6,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(
//                       color: Colors.black,
//                       width: 2.0,
//                     ),
//                   ),
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton(
//                     isExpanded: true,
//                     isDense: true,
//                     value: dropDownValue,
//                     onChanged: (value) {
//                       setState(() {
//                         dropDownValue = value;
//                       });
//                     },
//                     items: dropDownMenuItemMuscle.map((item) {
//                       return DropdownMenuItem(
//                         value: item,
//                         child: Text(item),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20.0),
//               child: FloatingActionButton.extended(
//                 onPressed: () {},
//                 label: Text(
//                   '+ Create New Exercise',
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline5
//                       .copyWith(color: Colors.white),
//                 ),
//                 elevation: 1.0,
//               ),
//             )
//           ],
//         ),

DateTime selectedDate;

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
        WorkoutPlanNamesListView(incrementCallback: widget.incrementCallBack),
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
        child: FutureBuilder(
            //TODO: Pass id from constr
            future: workoutPlanListClient(141),
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
