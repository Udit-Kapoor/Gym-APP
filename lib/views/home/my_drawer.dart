import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/views/customer/customer_profile_view.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Image.asset(
              'image/profile.png',
              alignment: Alignment.topLeft,
            ),
            title: Text('Hi! Pawan'),
            subtitle: Text('#42069'),
          ),
          DrawerTextList(
              label: 'Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerProfileView(),
                  ),
                );
              }),
          DrawerTextList(label: 'Gym Subscription', onTap: () {}),
          DrawerTextList(label: 'Order History', onTap: () {}),
          DrawerTextList(label: 'Complaint/Feedback', onTap: () {}),
          DrawerTextList(label: 'Help & Support', onTap: () {}),
          DrawerTextList(label: 'Change Password', onTap: () {}),
          DrawerTextList(label: 'Terms & Conditions', onTap: () {}),
          DrawerTextList(label: 'Privacy Policy', onTap: () {}),
          Text(
            'App Version 1.0.0',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.logout),
              SizedBox(
                width: 10.0,
              ),
              DrawerTextList(label: 'Logout', onTap: () {}),
            ],
          ),
          Text(
            'Follow us on Social Media',
            textAlign: TextAlign.center,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.facebookF),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.instagram),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerTextList extends StatelessWidget {
  DrawerTextList({
    Key key,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        label,
      ),
      onTap: onTap,
    );
  }
}
