import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/views/customer/drawer/order_history.dart';
import 'package:url_launcher/url_launcher.dart';

class TrainerDrawer extends StatefulWidget {
  TrainerDrawer({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  _TrainerDrawerState createState() => _TrainerDrawerState();
}

class _TrainerDrawerState extends State<TrainerDrawer> {
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
          FutureBuilder(
              future: trainerPro(),
              builder: (c, s) {
                if (s.connectionState == ConnectionState.waiting)
                  return LinearProgressIndicator();
                else if (s.connectionState == ConnectionState.done) {
                  var tp = trainerProfileModelFromJson(s.data.data);

                  
                  return ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CachedNetworkImage(
                          imageUrl: tp.image ??
                              "http://api.health2offer.com/media/customer/photo/noimage.jpg",
                          placeholder: (_, __) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    ),
                    title: Text('Hi! ${tp.firstName}'),
                    subtitle: Text('#' + tp.tid),
                  );
                }
                return Center(child: Text('Oops no data found'));
              }),
          DrawerTextList(
              label: 'Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrainerProfileView(),
                  ),
                );
              }),
          DrawerTextList(
              label: 'Order History',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderHistory(
                            isCustomer: false,
                          )),
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
                    builder: (context) => ChangePassword(),
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
