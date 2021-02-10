import 'package:flutter/material.dart';

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
              'image/profile.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
