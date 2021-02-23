import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePicture extends StatelessWidget {
  final String imageUrl;
  const ProfilePicture({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  Future<bool> checkImage() async =>
      (await http.head(imageUrl)).statusCode == 200
          ? Future<bool>.value(true)
          : Future<bool>.value(false);

  @override
  Widget build(BuildContext context) {
    // bool isGood = checkImage().then((value) => value) as bool;
    return InkWell(
      onTap: () {},
      child: Container(
        height: 120,
        width: 120,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 70.0,
              backgroundImage: NetworkImage(imageUrl),
              // child: isGood ? null : Icon(Icons.person),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.camera_alt),
            ),
          ],
        ),
      ),
    );
  }
}
