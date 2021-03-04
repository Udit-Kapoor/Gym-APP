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
    return CircleAvatar(
      radius: 70.0,
      child: FadeInImage.assetNetwork(
          placeholder: 'lib/assets/profile.png', image: imageUrl),
    );
  }
}
