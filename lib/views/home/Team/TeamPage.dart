import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'TeamPageWidgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TeamPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          height: 165,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/team1.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 17.0,
              ),
              child: ShowIcon(
                isIcon: true,
                title: "Cafeteria",
                col: Color(0xFFF5A300),
                img: Custom.cafeteria,
                route: "/CafeteriaView",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: ShowIcon(
                  isIcon: false,
                  title: "PoolBoard",
                  col: Color(0xFFEB3223),
                  img: "lib/assets/poolIcon.png"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 17.0,
              ),
              child: ShowIcon(
                isIcon: true,
                title: "Diet Food \n Subscription",
                col: Color(0xFF1CB203),
                img: Custom.apple,
                route: "/DietView",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: ShowIcon(
                  isIcon: true,
                  title: "Buy Gym \n Supplements",
                  col: Color(0xFF5985F5),
                  img: Custom.supplement,
                  route: "/SupplementView"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: Text(
              "Founders",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: TeamImage(
                  name: "Kapil(Founder)", img: "lib/assets/profile.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: TeamImage(
                  name: "Pawan(Co-Founder)", img: "lib/assets/profile.png"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Text(
              "Trainers",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: TeamImage(name: "Kapil", img: "lib/assets/profile.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: TeamImage(name: "Pawan", img: "lib/assets/profile.png"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: TeamImage(name: "Kuldeep", img: "lib/assets/profile.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: TeamImage(name: "Pooja", img: "lib/assets/profile.png"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: TeamImage(name: "Shankar", img: "lib/assets/profile.png"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Text(
              "Diet Partners",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: TeamImage(name: "Lorem", img: "lib/assets/profile.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: TeamImage(name: "Ipsum", img: "lib/assets/profile.png"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Text(
              "Supplement Partners",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: TeamImage(name: "Lorem", img: "lib/assets/profile.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              child: TeamImage(name: "Ipsum", img: "lib/assets/profile.png"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Text(
              "Transformation Stories",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Image.asset(
                'lib/assets/story1.jpeg',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Image.asset(
                'lib/assets/story2.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Text(
              "Behind The Scenes",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ),
        Container(
          width: 400,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/story2.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Text(
              "Group Activities",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ),
        Container(
          width: 400,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/story2.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Text(
              "What our customers say about us",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CarouselSlider(
              options: CarouselOptions(
                  height: 250, autoPlay: false, enlargeCenterPage: true),
              items: [
                ReviewCard("lib/assets/profile.png", "Neha K.", "Female", "24",
                    "lorem ipsum"),
                ReviewCard("lib/assets/profile.png", "Neha K.", "Female", "24",
                    "Lorem ipsum"),
                ReviewCard("lib/assets/profile.png", "Neha K.", "Female", "24",
                    "Lorem ipsum"),
              ]),
        ),
      ],
    );
  }
}
