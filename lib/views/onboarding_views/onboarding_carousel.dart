import 'package:flutter/material.dart';
import 'onboarding_single_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

var currentPos = 1;

class OnboardingViews extends StatefulWidget {
  @override
  _OnboardingViewsState createState() => _OnboardingViewsState();
}

class _OnboardingViewsState extends State<OnboardingViews> {
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
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 1),
              viewportFraction: 1.0),
          items: [
            OnboardingSingleView("lib/assets/onboarding/bg1.png",
                "Here we help you achieve \n your physical goals", 0),
            OnboardingSingleView(
                "lib/assets/onboarding/bg2.png",
                "Hundreds of successful\n transformation stories are\n the proof of our gym’s\n brilliance",
                1),
            OnboardingSingleView("lib/assets/onboarding/bg3.png",
                "Join now and achieve\n your dream physique", 2),
          ]),
    ));
  }
}
