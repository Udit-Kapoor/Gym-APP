import 'package:flutter/material.dart';
import 'package:gym_app/views/customer/exercise_instructions.dart';

class ExercisePage extends StatelessWidget {
  ExercisePage({Key key, @required this.muscle}) : super(key: key);

  final String muscle;

  final List<String> _exerciseList = [
    'Inclined Rod',
    'Declined Rod',
    'Pushups',
    'Deadlift',
    'Inclined Rod',
    'Jumping Jacks',
    'Inclined Rod',
    'Declined Rod',
    'Pushups',
    'Deadlift',
    'Inclined Rod',
    'Jumping Jacks',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          muscle,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {},
              ),
              Text(
                'Today',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
              Spacer(),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                for (var exc in _exerciseList)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ExerciseInstructions(exercise: exc)),
                        );
                      },
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
                              exc,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
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
