import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/customer/workout_plan_name.dart';
import 'package:gym_app/views/customer/workout/exercise_page.dart';
import 'package:gym_app/views/customer/my_trainer.dart';
import 'package:intl/intl.dart';

class WorkoutIndex extends StatelessWidget {
  WorkoutIndex({Key key}) : super(key: key);

  final String trainersName = 'Pawan Pandit ';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyTrainer()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        child: Image.asset(
                          //TODO: add trainers profile image

                          'lib/assets/profile.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: trainersName,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.black),
                          ),
                          TextSpan(
                            text: '(My Trainer)',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                //TODO: Send customers' object id
                future: workoutPlanFoo(),
                builder: (c, s) {
                  var widget;
                  if (s.connectionState == ConnectionState.waiting) {
                    widget = Center(child: LinearProgressIndicator());
                  } else if (s.hasData &&
                      s.connectionState == ConnectionState.done) {
                    var x = workoutPlanNameModelFromJson(s.data.data);

                    widget = ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        for (var exc in x)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExercisePage(
                                    muscle: exc.name,
                                    workout: exc.workouts,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 4.0,
                                child: Container(
                                  height: 80.0,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat.MMMd().format(exc.date),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        exc.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  } else
                    widget = Center(child: Text("OOPS! NO DATA!"));

                  return widget;
                }),
          ),
        ],
      ),
    );
  }
}
