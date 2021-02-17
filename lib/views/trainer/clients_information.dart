import 'package:flutter/material.dart';
import 'package:gym_app/views/customer/text_field_widget.dart';

class ClientsInformation extends StatelessWidget {
  const ClientsInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        TextFieldWidget(
          borderText: 'C_ID',
          bodyText: '42069',
        ),
        TextFieldWidget(
          borderText: 'Full Name',
          bodyText: 'Pawan Kumar',
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
                borderText: 'D.O.B',
                bodyText: '12-06-1998',
              ),
            ),
            Expanded(
              child: TextFieldWidget(
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                borderText: 'Gender',
                bodyText: 'Male',
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
                bodyText: '9876543210',
              ),
            ),
            Expanded(
              child: TextFieldWidget(
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                borderText: 'Alt.Phone No.',
                bodyText: '9876543210',
              ),
            ),
          ],
        ),
        TextFieldWidget(
          borderText: 'Email ID',
          bodyText: 'abcd1234@gmail.com',
        ),
        TextFieldWidget(
          borderText: 'Address Line 1',
          bodyText: '6th avenue Becker Street',
        ),
        TextFieldWidget(
          borderText: 'Address Line 2',
          bodyText: '6th avenue Becker Street',
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
                borderText: 'City',
                bodyText: 'New Delhi',
              ),
            ),
            Expanded(
              child: TextFieldWidget(
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                borderText: 'State',
                bodyText: 'New Delhi',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
                borderText: 'Pin Code',
                bodyText: '110069',
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
        TextFieldWidget(
          borderText: 'Landmark',
          bodyText: 'Near J.R. Public School',
        ),
        TextFieldWidget(
          borderText: 'ID Proof',
          bodyText: 'aadharcard.pdf',
        ),
      ],
    );
  }
}
