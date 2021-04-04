import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'TeamPageWidgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId:
        YoutubePlayer.convertUrlToId("https://youtu.be/Y1bYgOmkqHk"),
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
    ),
  );

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  viewportFraction: 1.0),
              items: [
                Image.asset("lib/assets/slider/slider1.jpg"),
                Image.asset("lib/assets/slider/slider2.jpg"),
                Image.asset("lib/assets/slider/slider3.jpg"),
                Image.asset("lib/assets/slider/slider4.jpg"),
                Image.asset("lib/assets/slider/slider5.jpg"),
                Image.asset("lib/assets/slider/slider6.jpg"),
                Image.asset("lib/assets/slider/slider7.jpg"),
                Image.asset("lib/assets/slider/slider9.jpg"),
                Image.asset("lib/assets/slider/slider10.jpg"),
                Image.asset("lib/assets/slider/slider11.jpg"),
                Image.asset("lib/assets/slider/slider12.jpg"),
              ]),
          // Container(
          //   height: 165,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('lib/assets/team1.jpg'),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
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
                    name: "Kapil(Founder)", img: "lib/assets/team/Kapil.webp"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                ),
                child: TeamImage(
                    name: "Pawan(Co-Founder)",
                    img: "lib/assets/team/Pawan.webp"),
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
                child:
                    TeamImage(name: "Kapil", img: "lib/assets/team/Kapil.webp"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                ),
                child:
                    TeamImage(name: "Pawan", img: "lib/assets/team/Pawan.webp"),
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
                child: TeamImage(
                    name: "Kuldeep", img: "lib/assets/team/Kuldeep.webp"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                ),
                child:
                    TeamImage(name: "Pooja", img: "lib/assets/team/Pooja.webp"),
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
                child: TeamImage(
                    name: "Shankar", img: "lib/assets/team/Shankar.webp"),
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
                child: TeamImage(
                    name: "Blufit", img: "lib/assets/partners/Blufit.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                ),
                child: TeamImage(
                    name: "Parafit", img: "lib/assets/partners/parafit.png"),
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
                child: TeamImage(
                    name: "HealthKart",
                    img: "lib/assets/partners/healthkart.png"),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 18.0,
              //   ),
              //   child: TeamImage(
              //       name: "My Nutra Mart", img: "lib/assets/profile.png"),
              // ),
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
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
              options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  viewportFraction: 1.0),
              items: [
                Image.asset("lib/assets/transformation/1.png"),
                Image.asset("lib/assets/transformation/2.png"),
                Image.asset("lib/assets/transformation/3.png"),
                Image.asset("lib/assets/transformation/4.png"),
              ]),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Image.asset(
          //         'lib/assets/story1.jpeg',
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //     Expanded(
          //       child: Image.asset(
          //         'lib/assets/story2.jpg',
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ],
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 30.0),
          //   child: Center(
          //     child: Text(
          //       "Behind The Scenes",
          //       style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          //     ),
          //   ),
          // ),
          // Container(
          //   width: 400,
          //   height: 160,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("lib/assets/story2.jpg"),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: Text(
                "Group Activities",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          YoutubePlayer(
            controller: _controller,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(isExpanded: true),
            ],
            liveUIColor: Colors.amber,
          ),
          // Container(
          //   width: 400,
          //   height: 160,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("lib/assets/story2.jpg"),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
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
                    height: 250, autoPlay: true, enlargeCenterPage: true),
                items: [
                  ReviewCard(
                      "lib/assets/review/kanika.webp",
                      "Kanika Chawla",
                      "Female",
                      "24",
                      " I’ve met amazing people at H2O gym. From owners to staff and other members everyone behaves very politely and are very helpful."),
                  ReviewCard(
                      "lib/assets/review/rahulgupta.webp",
                      "Rahul R. Gupta",
                      "Male",
                      "24",
                      "There are people here of every age, shape, size and fitness level which inspire me the most. And I specially feel like at home here in the gym center because of the people here. "),
                  ReviewCard(
                      "lib/assets/review/tarishigoel.webp",
                      "Tarishi Goel",
                      "Female",
                      "24",
                      " After one year I feel wonderful about myself now. It wouldn’t have been possible without the trainers of H2O gym who has been constantly supporting me to transform to my best."),
                  ReviewCard(
                      "lib/assets/review/divyamgupta.webp",
                      "Divyam Gupta",
                      "Male",
                      "24",
                      "This isn’t an usual fitness gym like others. It’s a home away from home and has everything I need. The morning sessions are totally to die for."),
                  ReviewCard(
                      "lib/assets/review/nikhilgarg.webp",
                      "Nikhil Garg",
                      "Male",
                      "24",
                      "It was a good experience of working out with the professional trainers at H2O Gym. Procedurally they have everything down to make fit. I was able to transform myself"),
                  ReviewCard(
                      "lib/assets/review/pranaygupta.webp",
                      "Pranay Gupta",
                      "Male",
                      "24",
                      "I enjoy the social atmosphere of the gym. The facilities are first class and the trainers very friendly and helpful. In fact I feel that my physical fitness has improved in last 2 months."),
                  ReviewCard(
                      "lib/assets/review/sarangwalia.webp",
                      "Sarang Walia",
                      "Male",
                      "24",
                      "The trainers are very professional yet they helped me in every way needed. Have made some very close friends too here."),
                  ReviewCard(
                      "lib/assets/review/ankurverma.webp",
                      "Ankur Verma",
                      "Male",
                      "24",
                      "I used to work out at home before but after joining this gym I craved for fitness much more. Thank you H2O gym. "),
                ]),
          ),
        ],
      ),
    );
  }
}
