import 'package:flutter/material.dart';
import 'package:gym_app/models/customer/my_trainer_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';

class MyTrainer extends StatelessWidget {
  const MyTrainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController reviewController = TextEditingController();
    final List<Map<String, dynamic>> _reviews = [
      {
        'profile_picture': 'lib/assets/profile.png',
        'name': 'Raja Kumar',
        'rating': 4,
        'time': 'a week ago',
        'description':
            'He is very good trainer. He is very good trainer. He is very good trainer. He is very good trainer. He is very good trainer. '
      },
      {
        'profile_picture': 'lib/assets/profile.png',
        'name': 'Raja Kumar',
        'rating': 4,
        'time': 'a week ago',
        'description': 'He is very good trainer'
      },
      {
        'profile_picture': 'lib/assets/profile.png',
        'name': 'Raja Kumar',
        'rating': 4,
        'time': 'a week ago',
        'description': 'He is very good trainer'
      },
      {
        'profile_picture': 'lib/assets/profile.png',
        'name': 'Raja Kumar',
        'rating': 4,
        'time': 'a week ago',
        'description': 'He is very good trainer'
      },
    ];

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
                  return CircularProgressIndicator();
                else if (s.connectionState == ConnectionState.done) {
                  var mt = myTrainerModelFromJson(s.data.data);

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
                              child: Image.asset('lib/assets/profile.png'),
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
              return showDialog(
                context: (context),
                builder: (context) => AlertDialog(
                  title: Row(
                    children: [
                      CircleAvatar(
                        // radius: 30.0,
                        child: Image.asset(
                          'lib/assets/profile.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Raja Kumar',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  content: TextField(
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
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
                      onPressed: () {
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
            child: ListView.builder(
              itemCount: _reviews.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            child: Image.asset(
                              _reviews[index]['profile_picture'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              _reviews[index]['name'],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          for (var i = 1; i <= _reviews[index]['rating']; i++)
                            Icon(Icons.star, color: Colors.yellow),
                          Spacer(),
                          Text(
                            _reviews[index]['time'],
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
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          _reviews[index]['description'],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
