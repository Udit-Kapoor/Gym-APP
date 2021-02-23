import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/trainer/client_list_model.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({Key key, this.id}) : super(key: key);

  final int id;

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
          onPressed: () async {
            Navigator.pop(context);
            //!for testing only
            // var d = await clientList(id);
            // print(d.data);
            // print(d.errorMessage);
            // print(d.error);
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'lib/assets/logo.png',
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
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
    );
  }
}
