import 'package:flutter/material.dart';
import 'package:gym_app/models/trainer/clients_profile_model.dart';
import 'package:gym_app/views/customer/text_field_widget.dart';

class ClientsProfile extends StatelessWidget {
  final int id;
  const ClientsProfile({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: clientsProfile(72),
      builder: (c, s) {
        var widget;

        if (s.connectionState == ConnectionState.waiting) {
          widget = Container(child: Center(child: CircularProgressIndicator()));
        } else if (s.hasData &&
            !s.data.error &&
            s.connectionState == ConnectionState.done) {
          var cp = clientsProfileModelFromJson(s.data.data);

          widget = ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              TextFieldWidget(
                borderText: 'C_ID',
                bodyText: cp.cid,
              ),
              TextFieldWidget(
                borderText: 'Full Name',
                bodyText: '${cp.firstName} ${cp.lastName}',
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
                      borderText: 'D.O.B',
                      bodyText: cp.dateOfBirth.toString(),
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      padding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                      borderText: 'Gender',
                      bodyText: cp.gender,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
                      borderText: 'Phone No.',
                      bodyText: cp.phone,
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      padding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                      borderText: 'Alt.Phone No.',
                      bodyText: cp.alternatePhone,
                    ),
                  ),
                ],
              ),
              TextFieldWidget(
                borderText: 'Email ID',
                bodyText: cp.email,
              ),
            ],
          );
        } else
          widget = Container(child: Center(child: Text("OOPS! NO DATA!")));
        return widget;
      },
    );
  }
}
