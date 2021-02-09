import 'package:flutter/material.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Image.asset(
          'image/logo.png',
          fit: BoxFit.fill,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(2.0),
                    color: Colors.red,
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
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                ),
                Text(
                  'Today',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                RotatedBox(
                  quarterTurns: 2,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 11,
            child: Container(
              child: ListView(
                children: [
                  for (var i = 0; i < 10; i++)
                    ClientsListTile(
                      name: 'Angelina Perry',
                      cId: 60942,
                      goal: 'Fat Loss',
                      onTap: () {
                        Navigator.pushNamed(context, '/ClientsDetailsView');
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClientsListTile extends StatelessWidget {
  const ClientsListTile({
    Key key,
    @required this.name,
    @required this.cId,
    @required this.goal,
    this.onTap,
  }) : super(key: key);
  final String name;
  final int cId;
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
              child: Image.asset(
                'image/clients.png',
                fit: BoxFit.fill,
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
                  '#$cId',
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
