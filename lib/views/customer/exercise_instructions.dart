import 'package:flutter/material.dart';

class ExerciseInstructions extends StatelessWidget {
  const ExerciseInstructions({Key key, @required this.exercise})
      : super(key: key);

  final String exercise;

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
          'Workouts',
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Material(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.black)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset('lib/assets/video.png'),
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      iconSize: 71,
                      icon: Icon(
                        Icons.play_circle_fill,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 15.0, bottom: 5.0),
                child: Text(
                  exercise,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 5.0, bottom: 15.0),
                child: RichText(
                  text: TextSpan(
                      text: '15 reps        3 sets',
                      style: Theme.of(context).textTheme.bodyText2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 15.0, bottom: 5.0),
                child: Text(
                  'Instructions',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 5.0, bottom: 15.0),
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Imperdiet id volutpat ullamcorper dapibus fermentum sit eu tincidunt vitae. Tellus, eu, adipiscing imperdiet lorem aenean semper congue. Nisi, in leo congue purus id nunc etiam ornare.',
                    style: Theme.of(context).textTheme.bodyText2),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
