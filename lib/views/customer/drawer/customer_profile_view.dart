import 'package:flutter/material.dart';
import 'package:gym_app/models/customer%20model/customer_profile_model.dart';

import 'profile_picture.dart';
import '../text_field_widget.dart';

class CustomerProfileView extends StatelessWidget {
  const CustomerProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: Text(
          'My Profile',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.qr_code_scanner,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: customerPro(),
        builder: (c, s) {
          var cp = customerProfileModelFromJson(s.data);
          var widget;
          if (s.connectionState == ConnectionState.waiting) {
            widget = Center(child: CircularProgressIndicator());
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            widget = Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  ProfilePicture(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Hi! ${cp.firstName}',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Expanded(
                    child: ListView(
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
                                borderText: 'D.O.B',
                                bodyText: '12-06-1998',
                              ),
                            ),
                            Expanded(
                              child: TextFieldWidget(
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
                                borderText: 'Phone No.',
                                bodyText: '9876543210',
                              ),
                            ),
                            Expanded(
                              child: TextFieldWidget(
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
                                borderText: 'City',
                                bodyText: 'New Delhi',
                              ),
                            ),
                            Expanded(
                              child: TextFieldWidget(
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
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFieldWidget(
                              borderText: 'ID Proof',
                              bodyText: 'aadharcard.pdf',
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.file_upload,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else
            widget = Center(child: Text("OOPS! NO DATA!"));
          return widget;
        },
      ),
    );
  }
}
