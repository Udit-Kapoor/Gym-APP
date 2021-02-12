import 'package:flutter/material.dart';

class OnboardingSingleView extends StatelessWidget {
  final String imgPath;
  final String bottomText;
  final int currentPos;
  final List<String> listPaths = [
    "image/bg1.png",
    "image/bg2.png",
    "image/bg3.png",
  ];

  OnboardingSingleView(this.imgPath, this.bottomText, this.currentPos);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) =>
          Navigator.pushReplacementNamed(context, '/LoginScreen'),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgPath),
            fit: BoxFit.fill,
            colorFilter:
                ColorFilter.mode(Colors.grey.withAlpha(50), BlendMode.darken),
          ),
        ),
        child: Column(
          children: [
            Spacer(),
            Text(
              "Welcome to H2O GYM",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            Spacer(flex: 9),
            Text(
              bottomText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            Icon(
              Icons.keyboard_arrow_up,
              size: 50,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listPaths.map((url) {
                int index = listPaths.indexOf(url);
                return Container(
                  width: 8,
                  height: 8,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          currentPos == index ? Colors.white : Colors.white60),
                );
              }).toList(),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
