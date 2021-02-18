import 'package:flutter/material.dart';
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
              image: AssetImage('image/team1.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17.0, left: 75),
              child: ShowIcon(
                title: "Cafeteria",
                col: Color(0xFFF5A300),
                img: "image/cafeIcon.png",
                route: "/CafeteriaView",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 139),
              child: ShowIcon(
                  title: "PoolBoard",
                  col: Color(0xFFEB3223),
                  img: "image/poolIcon.png"),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17.0, left: 65),
              child: ShowIcon(
                title: "Diet Food \n Subscription",
                col: Color(0xFF1CB203),
                img: "image/dietIcon.png",
                route: "/DietView",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 120),
              child: ShowIcon(
                  title: "Buy Gym \n Supplements",
                  col: Color(0xFF5985F5),
                  img: "image/gymIcon.png",
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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 30),
              child:
                  TeamImage(name: "Kapil(Founder)", img: "image/profile.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 70),
              child: TeamImage(
                  name: "Pawan(Co-Founder)", img: "image/profile.png"),
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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 30),
              child: TeamImage(name: "Kapil", img: "image/profile.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 70),
              child: TeamImage(name: "Pawan", img: "image/profile.png"),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 30),
              child: TeamImage(name: "Kuldeep", img: "image/profile.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 70),
              child: TeamImage(name: "Pooja", img: "image/profile.png"),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 30),
              child: TeamImage(name: "Shankar", img: "image/profile.png"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Text(
              "Dieticians",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 30),
              child: TeamImage(name: "Lorem", img: "image/profile.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 70),
              child: TeamImage(name: "Ipsum", img: "image/profile.png"),
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
                'image/story1.jpeg',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Image.asset(
                'image/story2.jpg',
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
              image: AssetImage("image/story2.jpg"),
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
                ReviewCard("image/profile.png", "Neha K.", "Female", "24",
                    "lorem ipsum"),
                ReviewCard("image/profile.png", "Neha K.", "Female", "24",
                    "Lorem ipsum"),
                ReviewCard("image/profile.png", "Neha K.", "Female", "24",
                    "Lorem ipsum"),
              ]),
        ),
      ],
    );
  }
}
