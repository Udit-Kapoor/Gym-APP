import 'package:flutter/material.dart';

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

class CreateWorkout extends StatelessWidget {
  const CreateWorkout({Key key}) : super(key: key);

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
            onPressed: () {},
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
  const WorkoutPlanNamesListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: workoutPlanName.length,
          itemBuilder: (BuildContext context, int i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
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
                    child: Center(
                      child: Text(
                        workoutPlanName[i],
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.w400),
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



