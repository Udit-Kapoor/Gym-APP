import 'package:flutter/material.dart';
import 'package:gym_app/apis/api_endpoints.dart';

class ProfilePicture extends StatelessWidget {
  final String imageUrl;
  const ProfilePicture({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(baseURL + imageUrl),

      radius: 70.0,
      // child: FadeInImage.assetNetwork(
      //     placeholder: 'lib/assets/profile.png', image: baseURL+ imageUrl),
    );
  }
}
