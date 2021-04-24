import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/apis.dart';
import 'package:gym_app/models/customer/my_trainer_model.dart';
import 'package:gym_app/models/customer/trainer_review_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as ta;

int trainerID;

class MyTrainer extends StatelessWidget {
  const MyTrainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController reviewController = TextEditingController();

    // final int _ratings = 3;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'lib/assets/logo.png',
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
              future: myTrainer(),
              builder: (c, s) {
                if (s.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                else if (s.connectionState == ConnectionState.done) {
                  var mt = myTrainerModelFromJson(s.data.data);

                  trainerID = mt.id;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: CircleAvatar(
                              radius: 40.0,
                              backgroundImage: NetworkImage(
                                baseURL + mt.image ??
                                    '/media/customer/photo/noimage.jpg',
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                mt.firstName + ' ' + mt.lastName,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              subtitle: Text(
                                '${DateTime.now().year - mt.dob.year}, ${mt.gender}\n ${mt.address1}',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              trailing: CircleAvatar(
                                backgroundColor: Colors.green,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    await launch('tel:${mt.phone}');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 20.0, top: 15.0, bottom: 5.0),
                        child: Text('Avg. Rating'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0, bottom: 15.0),
                        child: SmoothStarRating(
                          isReadOnly: true,
                          rating: mt.averageRating.toDouble(),
                        ),
                      ),
                    ],
                  );
                } else
                  return Center(child: Text('Something went wrong'));
              }),
          GestureDetector(
            onTap: () {
              int _rating = 0;
              return showDialog(
                context: (context),
                builder: (context) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: reviewController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Write your review here...',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SmoothStarRating(
                        allowHalfRating: false,
                        onRated: (double v) {
                          _rating = v.toInt();
                        },
                        starCount: 5,
                        rating: 0,
                        size: 40.0,
                        isReadOnly: false,
                        color: Colors.amber,
                        borderColor: Colors.yellow,
                        spacing: 0.0,
                      ),
                    ],
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        side: BorderSide(),
                      ),
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        ApiResponse res = await ApiHelper().postReq(
                          endpoint:
                              'https://api.health2offer.com/core/trainerfeedback/',
                          data: {
                            "feedback": reviewController.text.trim(),
                            "rating": _rating.toString(),
                            "source": 'App',
                            "user": await ApiHelper().getUserObjectID(),
                            "trainer": trainerID
                          },
                        );

                        if (res.error) {
                          Fluttertoast.showToast(
                              msg: 'Already Given the feedback');
                        }

                        // reviewController.dispose();
                        Navigator.pop(context);
                      },
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        side: BorderSide(),
                      ),
                      child: Text(
                        'Post Review',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              // height: 60.0,
              margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Write a Review',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 5.0, bottom: 15.0),
            child: Text(
              'Customer Reviews',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: trainerReview(),
              builder: (c, s) {
                if (s.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                else if (s.connectionState == ConnectionState.done) {
                  var tr = trainerReviewModelFromJson(s.data.data);

                  if (tr.length == 0) return Center(child: Text('No Reviews'));
                  return ListView.builder(
                    itemCount: tr.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SmoothStarRating(
                                  isReadOnly: true,
                                  rating: double.parse(
                                    tr[index].rating,
                                  ),
                                  color: Colors.yellow,
                                  starCount: 5,
                                  borderColor: Colors.yellow,
                                ),
                                Spacer(),
                                Text(
                                  ta.format(tr[index].date),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                tr[index].feedback,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: Text('Something went wrong'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
