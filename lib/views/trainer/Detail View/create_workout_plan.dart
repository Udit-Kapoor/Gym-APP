import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/models/customer/workout_plan_name.dart';
import 'package:gym_app/models/trainer/create_new_workout_model.dart';
import 'package:gym_app/models/trainer/workout_plan_list_model.dart';
import 'package:intl/intl.dart';

import 'add_custom_workout.dart';

class CreateWorkoutPlan extends StatelessWidget {
  final DateTime dateTime;
  final int id;

  final Function setState;

  CreateWorkoutPlan(
      {Key key, @required this.dateTime, @required this.id, this.setState})
      : super(key: key);

  final TextEditingController workoutNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var dateSplit = DateFormat.MMMd().format(dateTime).split(' ');
    List<int> selectedWorkout = [];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AddCustomWorkout()),
                      );
                    },
                    color: Colors.red,
                    disabledColor: Colors.red,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: FlatButton(
                    color: Colors.red,
                    onPressed: () {},
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      side: BorderSide(width: 1.5, color: Colors.red),
                    ),
                    child: Text(
                      dateSplit[1] + ' ' + dateSplit[0],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: workoutsPlanListClient(),
              builder: (c, s) {
                if (s.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                else if (s.connectionState == ConnectionState.done) {
                  var cp = workoutsPlanListModelFromJson(s.data.data);

                  List<Map<int, bool>> idBool = List.generate(
                      cp.length, (index) => {cp[index].id: false});

                  return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: cp.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(
                                cp[i].name,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              subtitle: Text(
                                cp[i].muscle,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              value: idBool[i][cp[i].id],
                              onChanged: (value) {
                                setState(() {
                                  idBool[i][cp[i].id] = value;
                                });
                                // isChecked = !isChecked;
                                if (value) {
                                  selectedWorkout.add(cp[i].id);
                                } else {
                                  if (selectedWorkout.contains(cp[i].id)) {
                                    selectedWorkout.remove(cp[i].id);
                                  }
                                }
                              },
                            );
                          }),
                        );
                      });
                }
                return Center(child: Text('Oops no data found'));
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                  child: FlatButton(
                    color: Colors.red,
                    onPressed: () => showDialog(
                      context: (context),
                      builder: (_) => AlertDialog(
                        title: Text(
                          'Workout Name',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        content: TextField(
                          controller: workoutNameController,
                          decoration: InputDecoration(
                            hintText: "name",
                          ),
                        ),
                        actions: [
                          FlatButton(
                            color: Colors.red,
                            onPressed: () {
                              if (workoutNameController.text.isNotEmpty) {
                                createNewWorkout(
                                    dateTime: dateTime,
                                    wId: selectedWorkout,
                                    name: workoutNameController.text.trim(),
                                    id: id);

                                Future.delayed(Duration(seconds: 1));
                                Navigator.pop(_);
                                Navigator.pop(context);
                                setState();
                                // Navigator.pus
                              } else
                                Fluttertoast.showToast(msg: 'No name found');
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
    );
  }
}

//  if (_workoutIndex == 0) CreateWorkout(incrementCallBack: incrementIndex),
//       if (_workoutIndex == 1)
//         GestureDetector(
//   child: Column(
//     children: [
//       Row(
//         children: [
//           Expanded(
//             flex: 3,
//             child: Padding(
//               padding:
//                   EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//               child: FlatButton(
//                 color: Colors.red,
//                 onPressed: () => setState(() => _workoutIndex = 3),
//                 padding: EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 10.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(20.0),
//                   ),
//                   side: BorderSide(w idth: 1.5, color: Colors.red),
//                 ),
//                 child: Text(
//                   'Add Custom',
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline6
//                       .copyWith(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding:
//                   EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//               child: FlatButton(
//                 color: Colors.red,
//                 onPressed: () {},
//                 padding: EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 10.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(5),
//                   ),
//                   side: BorderSide(width: 1.5, color: Colors.red),
//                 ),
//                 child: Text(
//                   '1 Jan',
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline6
//                       .copyWith(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       Expanded(
//         child: ListView.builder(
//             physics: BouncingScrollPhysics(),
//             itemCount: 30,
//             itemBuilder: (BuildContext context, int index) {
//               return Card(
//                 margin: EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 5.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: CheckboxListTile(
//                   controlAffinity: ListTileControlAffinity.trailing,
//                   title: Text(
//                     'Air Bike',
//                     style: Theme.of(context).textTheme.headline6,
//                   ),
//                   subtitle: Text(
//                     'Core',
//                     style: Theme.of(context).textTheme.bodyText2,
//                   ),
//                   value: false,
//                   onChanged: (value) {},
//                 ),
//               );
//             }),
//       ),
//       Row(
//         children: [
//           Expanded(
//             child: Padding(
//               padding:
//                   EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
//               child: FlatButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 padding: EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 10.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(20.0),
//                   ),
//                   side: BorderSide(width: 1.5, color: Colors.red),
//                 ),
//                 child: Text(
//                   'Cancel',
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline6
//                       .copyWith(color: Colors.red),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding:
//                   EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
//               child: FlatButton(
//                 color: Colors.red,
//                 onPressed: () => showDialog(
//                   context: (context),
//                   builder: (context) => AlertDialog(
//                     title: Text(
//                       'Workout Name',
//                       style: Theme.of(context).textTheme.headline6,
//                     ),
//                     content: TextField(
//                       decoration: InputDecoration(
//                         hintText: "name",
//                       ),
//                     ),
//                     actions: [
//                       FlatButton(
//                         color: Colors.red,
//                         onPressed: () {},
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 20.0, vertical: 10.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(20.0),
//                           ),
//                           side:
//                               BorderSide(width: 1.5, color: Colors.red),
//                         ),
//                         child: Text(
//                           'Save',
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline6
//                               .copyWith(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 padding: EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 10.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(20.0),
//                   ),
//                   side: BorderSide(width: 1.5, color: Colors.red),
//                 ),
//                 child: Text(
//                   'Save',
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline6
//                       .copyWith(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       )
//     ],
//   ),
// ),
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
// Column(
//   children: [
//     Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//       child: TextField(
//         style: Theme.of(context)
//             .textTheme
//             .headline5
//             .copyWith(color: Colors.black),
//         decoration: InputDecoration(
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(
//               color: Colors.black,
//               width: 2.0,
//             ),
//           ),
//           labelText: 'Name',
//           labelStyle: Theme.of(context)
//               .textTheme
//               .headline6
//               .copyWith(color: Colors.black),
//           hintText: 'enter exercise name',
//           hintStyle: Theme.of(context)
//               .textTheme
//               .headline5
//               .copyWith(color: Colors.grey),
//         ),
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: InputDecorator(
//         expands: false,
//         decoration: InputDecoration(
//           labelText: 'Topic',
//           labelStyle: Theme.of(context).textTheme.headline6,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(
//               color: Colors.black,
//               width: 2.0,
//             ),
//           ),
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton(
//             isExpanded: true,
//             isDense: true,
//             value: dropDownValue,
//             onChanged: (value) {
//               setState(() {
//                 dropDownValue = value;
//               });
//             },
//             items: dropDownMenuItemMuscle.map((item) {
//               return DropdownMenuItem(
//                 value: item,
//                 child: Text(item),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     ),
//     Spacer(),
//     Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: FloatingActionButton.extended(
//         onPressed: () {},
//         label: Text(
//           '+ Create New Exercise',
//           style: Theme.of(context)
//               .textTheme
//               .headline5
//               .copyWith(color: Colors.white),
//         ),
//         elevation: 1.0,
//       ),
//     )
//   ],
// ),
