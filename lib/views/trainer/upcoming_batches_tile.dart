import 'package:flutter/material.dart';

class UpcomingBatchesTile extends StatelessWidget {
  const UpcomingBatchesTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        tileColor: Colors.white,
        leading: Container(
          color: Colors.red,
          height: 60.0,
          width: 60.0,
          child: Center(
            child: Text(
              '30\nOct',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        title: Text('Upcoming Batches'),
        subtitle: Text(
          '09.30 - 10.30',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('10'),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}
