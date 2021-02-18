import 'package:flutter/material.dart';
import 'package:gym_app/views/customer/exercise_page.dart';
import 'package:gym_app/views/customer/my_trainer.dart';

class WorkoutIndex extends StatelessWidget {
  WorkoutIndex({Key key}) : super(key: key);

  final List<List<String>> muscleList = [
    ['Today', 'Chest'],
    ['19 Dec', 'Biceps'],
    ['20 Dec', 'Triceps'],
    ['21 Dec', 'Shoulder'],
    ['22 Dec', 'Back'],
    ['23 Dec', 'Legs'],
    ['24 Dec', 'Biceps'],
    ['25 Dec', 'Triceps'],
    ['26 Dec', 'Shoulder'],
    ['27 Dec', 'Back'],
    ['28 Dec', 'Legs'],
  ];
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
                  color: Colors.white,
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
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                for (var muscle in muscleList)
                  Material(
                    elevation: 4.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExercisePage(
                              muscle: muscle[1],
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
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  muscle[0],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  muscle[1],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // child: Container(
                      //   padding: EdgeInsets.all(20.0),
                      //   margin: EdgeInsets.symmetric(
                      //       horizontal: 20.0, vertical: 10.0),
                      //   height: 80,
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(20.0),
                      //   ),
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       muscle[0],
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .headline6
                      //           .copyWith(fontWeight: FontWeight.w400),
                      //     ),
                      //     Text(
                      //       muscle[1],
                      //       style: Theme.of(context).textTheme.headline6,
                      //     ),
                      //   ],
                      // ),
                      // ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
