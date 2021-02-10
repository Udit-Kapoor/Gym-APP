import 'package:flutter/material.dart';

class ClientsWorkoutTile extends StatelessWidget {
  const ClientsWorkoutTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        tileColor: Colors.white,
        leading: Container(
          color: Colors.red,
          height: 60.0,
          width: 60.0,
          child: Text(
            '30\nOct',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white),
          ),
        ),
        title: Text('Today\'s Workout'),
        subtitle: Text(
          'Chest Day',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            Text('09.30-10.30'),
          ],
        ),
      ),
    );
  }
}
