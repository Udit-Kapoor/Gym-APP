import 'package:flutter/material.dart';
import 'package:gym_app/models/customer/workout_plan_name.dart';
import 'package:gym_app/models/trainer/workout_plan_list_model.dart';

import 'add_custom_workout.dart';

class CreateWorkoutPlan extends StatelessWidget {
  final DateTime dateTime;

  const CreateWorkoutPlan({Key key,@required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      '1 Jan',
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
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: Text(
                              cp[i].name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            subtitle: Text(
                              cp[i].muscle,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            value: false,
                            onChanged: (value) {},
                          ),
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
