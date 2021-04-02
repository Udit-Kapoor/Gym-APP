import 'package:flutter/material.dart';
import 'package:gym_app/apis/apis.dart';
import 'package:gym_app/models/customer/customer_profile_model.dart';

import 'profile_picture.dart';
import '../workout/text_field_widget.dart';

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
          var widget;
          if (s.connectionState == ConnectionState.waiting) {
            widget = Center(child: CircularProgressIndicator());
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var cp = customerProfileModelFromJson(s.data.data);

            widget = Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  ProfilePicture(
                      imageUrl: cp.photo ??baseURL+ '/media/customer/photo/badge.png'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Hi! ${cp.firstName}',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: [
                        TextFieldWidget(
                          borderText: 'C_ID',
                          bodyText: cp.cid,
                        ),
                        TextFieldWidget(
                          borderText: 'Full Name',
                          bodyText:
                              '${cp.firstName} ${cp.middleName} ${cp.lastName} ',
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
                                borderText: 'D.O.B',
                                bodyText: cp.dateOfBirth.toUtc().toString(),
                              ),
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                                borderText: 'Gender',
                                bodyText: cp.gender,
                              ),
                            ),
                          ],
                        ),
                        TextFieldWidget(
                          borderText: 'Phone No.',
                          bodyText: cp.phone,
                        ),
                        if (cp.alternatePhone != null)
                          TextFieldWidget(
                            borderText: 'Alt.Phone No.',
                            bodyText: cp.alternatePhone,
                          ),
                        TextFieldWidget(
                          borderText: 'Email ID',
                          bodyText: cp.email,
                        ),
                        TextFieldWidget(
                          borderText: 'Address Line 1',
                          bodyText: cp.address1,
                        ),
                        TextFieldWidget(
                          borderText: 'Address Line 2',
                          bodyText: cp.address2,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                borderText: 'City',
                                bodyText: cp.city,
                              ),
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                borderText: 'State',
                                bodyText: cp.state,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                borderText: 'Pin Code',
                                bodyText: cp.pincode.toString(),
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFieldWidget(
                              borderText: 'ID Proof',
                              bodyText: cp.idProof,
                            ),
                            IconButton(
                              padding: EdgeInsets.fromLTRB(8, 8, 25, 8),
                              alignment: Alignment.centerLeft,
                              icon: Icon(
                                Icons.remove_red_eye,
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
