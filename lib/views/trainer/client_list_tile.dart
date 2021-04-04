import 'package:flutter/material.dart';

class ClientsListTile extends StatelessWidget {
  const ClientsListTile({
    Key key,
    @required this.name,
    @required this.cId,
    @required this.goal,
    this.onTap,
    this.imageURL,
  }) : super(key: key);
  
  final String name;
  final String imageURL;
  final String cId;
  final String goal;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                imageURL ??
                    'https://api.health2offer.com/media/customer/photo/noimage.jpg',
              ),
            ),
            title: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            subtitle: Row(
              children: [
                Text(
                  cId,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.black),
                ),
                Spacer(flex: 2),
                Text(
                  goal,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.black),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
