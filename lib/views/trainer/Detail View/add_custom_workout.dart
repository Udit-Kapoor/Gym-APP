import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/models/trainer/create_new_workout_model.dart';

const List<String> dropDownMenuItemMuscle = [
  'Back',
  'Biceps',
  'Cardio',
  'Chest',
  'Core',
  'Forearms',
  'Full body',
  'Legs',
  'Neck',
  'Shoulders',
  'Triceps',
  'Weightlifting',
  'Yoga',
];

class AddCustomWorkout extends StatefulWidget {
  final Function setState2;

  const AddCustomWorkout({Key key, this.setState2}) : super(key: key);

  @override
  _AddCustomWorkoutState createState() => _AddCustomWorkoutState();
}

class _AddCustomWorkoutState extends State<AddCustomWorkout> {
  TextEditingController nameController = TextEditingController();
  String dropDownValue = 'Back';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              controller: nameController,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                labelText: 'Name',
                labelStyle: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
                hintText: 'enter exercise name',
                hintStyle: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InputDecorator(
              expands: false,
              decoration: InputDecoration(
                labelText: 'Topic',
                labelStyle: Theme.of(context).textTheme.headline6,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  // isExpanded: true,
                  // isDense: true,
                  value: dropDownValue,
                  onChanged: (String value) {
                    setState(() {
                      dropDownValue = value;
                    });
                  },
                  items: dropDownMenuItemMuscle.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: FloatingActionButton.extended(
              onPressed: () async {
                if (nameController.text.isNotEmpty) {
                  await createNewExercise(nameController.text, dropDownValue);
                  Navigator.pop(context);
                  widget.setState2();
                } else
                  Fluttertoast.showToast(msg: 'No name found');
              },
              label: Text(
                '+ Create New Exercise',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white),
              ),
              elevation: 1.0,
            ),
          )
        ],
      ),
    );
  }
}
