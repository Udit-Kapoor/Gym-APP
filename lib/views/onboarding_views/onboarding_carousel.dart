import 'package:flutter/material.dart';
import 'onboarding_single_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

var currentPos = 1;

class onboarding_views extends StatefulWidget {
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<onboarding_views> {
  @override
  Widget build(BuildContext context) {
    var getScreenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Center(
      child: CarouselSlider(
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentPos = index;
                });
              },
              height: getScreenHeight,
              autoPlay: false,
              viewportFraction: 1.0),
          items: [
            onboarding_single_view("image/bg1.png",
                "Here we help you achieve \n your physical goals", 0),
            onboarding_single_view(
                "image/bg2.png",
                "Hundreds of successful\n transformation stories are\n the proof of our gym’s\n brilliance",
                1),
            onboarding_single_view("image/bg3.png",
                "Join now and achieve\n your dream physique", 2),
          ]),
    ));
  }
}
