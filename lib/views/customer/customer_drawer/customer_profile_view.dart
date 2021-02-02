import 'package:flutter/material.dart';

class CustomerProfileView extends StatelessWidget {
  const CustomerProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.navigate_before,
          color: Colors.black,
        ),
        title: Text('My Profile',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6),
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
                  FieldWidget(
                    height: _height,
                    width: _width,
                    borderText: 'Customer ID',
                    bodyText: '42069',
                  ),
                  FieldWidget(
                    height: _height,
                    width: _width,
                    borderText: 'Full Name',
                    bodyText: 'Pawan Sharma',
                  ),
                  FieldWidget(
                    height: _height,
                    width: _width,
                    borderText: 'Email ID',
                    bodyText: 'abcd1234@gmail.com',
                  ),
                  FieldWidget(
                    height: _height,
                    width: _width,
                    borderText: 'Address Line 1',
                    bodyText: '6th avenue Becker Street',
                  ),
                  FieldWidget(
                    height: _height,
                    width: _width,
                    borderText: 'Address Line 2',
                    bodyText: '6th avenue Becker Street',
                  ),
                  FieldWidget(
                    height: _height,
                    width: _width,
                    borderText: 'Landmark',
                    bodyText: 'Near J.R. Public School',
                  ),
                  FieldWidget(
                    height: _height,
                    width: _width,
                    borderText: 'ID Proof',
                    bodyText: 'aadharcard.pdf',
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

class FieldWidget extends StatelessWidget {
  const FieldWidget({
    Key key,
    @required double height,
    @required double width,
    @required this.borderText,
    @required this.bodyText,
  })  : _height = height,
        _width = width,
        super(key: key);

  final double _height;
  final double _width;
  final String borderText;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height * 0.12,
      margin: EdgeInsets.symmetric(
        horizontal: _width * 0.07,
        vertical: 5,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: _height * 0.1,
            width: _width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                bodyText,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              child: Container(
                color: Colors.white,
                child: Text(
                  borderText,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70.0,
            child: Image.asset(
              'lib/assets/images/profile.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
