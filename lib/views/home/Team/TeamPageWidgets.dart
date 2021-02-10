import 'package:flutter/material.dart';

class TeamImage extends StatelessWidget {
  const TeamImage({
    Key key,
    @required this.name,
    @required this.img,
  }) : super(key: key);

  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(img),
            ),
          ),
        ),
        SizedBox(height: 3),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ],
    );
  }
}

class ShowIcon extends StatelessWidget {
  const ShowIcon({
    Key key,
    @required this.title,
    @required this.col,
    @required this.img,
  }) : super(key: key);

  final String title;
  final Color col;
  final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //ToDo: Navigate to respective screens using PARAMETER
      onTap: null,
      child: Column(
        children: [
          Container(
            height: 44.5,
            width: 44.5,
            decoration: BoxDecoration(shape: BoxShape.circle, color: col),
            child: Center(
              child: Image.asset(img),
            ),
          ),
          SizedBox(height: 3),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w700, color: col),
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String imgPath;
  final String name;
  final String gender;
  final String age;
  final String story;

  ReviewCard(this.imgPath, this.name, this.gender, this.age, this.story);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 25.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              15.0, // Move to right 10  horizontally
              15.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 18),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(imgPath),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                    Text(
                      gender + ", " + age + " yrs",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 25),
            child: Text(story),
          ),
        ],
      ),
    );
  }
}
