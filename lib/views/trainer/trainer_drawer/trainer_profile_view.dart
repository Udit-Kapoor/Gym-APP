import 'package:flutter/material.dart';
import 'package:gym_app/views/customer/customer_drawer/profile_picture.dart';
import 'package:gym_app/views/customer/customer_drawer/text_field_widget.dart';

class TrainerProfileView extends StatelessWidget {
  const TrainerProfileView({Key key}) : super(key: key);

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
          onPressed: () {},
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
      body: Container(
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
              'Hi! Pawan',
              style: TextStyle(fontSize: 30.0),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  TextFieldWidget(
                    borderText: 'T_ID',
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
                        padding: EdgeInsets.only(right: 50.0),
                        icon: Icon(
                          Icons.file_upload,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextFieldWidget(
                        borderText: 'Resume/CV',
                        bodyText: 'resume.pdf',
                      ),
                      IconButton(
                        padding: EdgeInsets.only(right: 50.0),
                        icon: Icon(
                          Icons.file_upload,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          borderText: 'Joining Date',
                          bodyText: '12-06-2020',
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  TextFieldWidget(
                    borderText: 'MonthlySalary',
                    bodyText: 'Rs 15000',
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          borderText: 'Next Salary Date',
                          bodyText: '15-01-2021',
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
