import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/lib.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerDrawer extends StatefulWidget {
  CustomerDrawer({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  _CustomerDrawerState createState() => _CustomerDrawerState();
}

class _CustomerDrawerState extends State<CustomerDrawer> {
  void initMyLibrary() async {
    LicenseRegistry.addLicense(() async* {
      yield LicenseEntryWithLineBreaks(
        <String>['gym_app'],
        kTerms,
      );
    });
  }

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
            height: widget.height * 0.03,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Image.asset(
              'lib/assets/profile.png',
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
          DrawerTextList(
              label: 'Gym Subscription',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerGymSubscriptionView()),
                );
              }),
          DrawerTextList(label: 'Order History', onTap: () {}),
          DrawerTextList(
              label: 'Complaint/Feedback',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ComplaintFeedback()),
                );
              }),
          DrawerTextList(
            label: 'Help & Support',
            onTap: () => showDialog(
              context: (context),
              builder: (context) => AlertDialog(
                title: Text(
                  'Need Assistance?',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  IconButton(
                    padding: EdgeInsets.only(right: 20.0),
                    iconSize: 35.0,
                    icon: Icon(
                      Icons.phone,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      if (await canLaunch(kPhoneNumber)) {
                        await launch(kPhoneNumber);
                      }
                    },
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 20.0),
                    iconSize: 35.0,
                    icon: Icon(
                      Icons.mail_outline,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      if (await canLaunch(kEmailId)) {
                        await launch(kEmailId);
                      }
                    },
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          DrawerTextList(
              label: 'Change Password',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPassword(),
                  ),
                );
              }),
          DrawerTextList(
            label: 'Terms & Conditions',
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(),
                    body: SingleChildScrollView(child: Text(kPrivacy)),
                  ),
                )),
          ),
          DrawerTextList(
            label: 'Privacy Policy',
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(),
                    body: SingleChildScrollView(child: Text(kTerms)),
                  ),
                )),
          ),
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
              DrawerTextList(
                  label: 'Logout', onTap: () => ApiHelper().logout(context)),
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
                  onPressed: () async {
                    if (await canLaunch(kFacebook)) {
                      await launch(kFacebook);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.instagram),
                  onPressed: () async {
                    if (await canLaunch(kInstagram)) {
                      await launch(kInstagram);
                    }
                  },
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
