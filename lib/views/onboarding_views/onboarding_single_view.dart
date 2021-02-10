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
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset(
              imgPath,
              color: Colors.black45,
              colorBlendMode: BlendMode.darken,
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Text(
                "Welcome to H2O GYM",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 450.0),
              child: Text(
                bottomText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: GestureDetector(
                //ToDo : Navigate to Login Screen
                onTap: null,
                child: Container(
                  width: 300,
                  height: 20,
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
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
                        color: currentPos == index
                            ? Colors.white
                            : Colors.white60),
                  );
                }).toList(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
