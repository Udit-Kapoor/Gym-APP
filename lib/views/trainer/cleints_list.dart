import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/trainer/clients_list_model.dart';
import 'package:gym_app/views/trainer/client_list_tile.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({Key key, @required this.id}) : super(key: key);

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
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'lib/assets/logo.png',
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
      body: FutureBuilder(
        future: clientList(id),
        builder: (c, s) {
          var widget;

          if (s.connectionState == ConnectionState.waiting) {
            widget =
                Container(child: Center(child: CircularProgressIndicator()));
          } else if (s.hasData &&
              !s.data.error &&
              s.connectionState == ConnectionState.done) {
            var cl = clientsListModelFromJson(s.data.data);

            widget = ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: cl.cust.length,
              itemBuilder: (c, i) {
                //TODO: Add Profile picture
                return ClientsListTile(
                  name: cl.cust[i].firstName,
                  cId: cl.cust[i].custid ?? '696969',
                  goal: 'Fat Loss',
                  imageURL: cl.cust[i].photo,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => ClientsDetailsView(
                          name:
                              "${cl.cust[i].firstName} ${cl.cust[i].lastName ?? ''}",
                          cId: cl.cust[i].custid ?? '696969',
                          id: cl.cust[i].id,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else
            widget = Container(child: Center(child: Text("OOPS! NO DATA!")));

          return widget;
        },
      ),
    );
  }
}
