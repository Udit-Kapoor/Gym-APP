import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/models/customer%20model/transformation_image_model.dart';
import 'package:gym_app/views/customer/my_attendance.dart';
import 'package:gym_app/views/customer/my_goal_title.dart';
import 'package:gym_app/views/customer/todays_workout_tile.dart';
import 'package:gym_app/views/customer/weight_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeIndex extends StatefulWidget {
  HomeIndex({Key key}) : super(key: key);

  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        // addAutomaticKeepAlives: false,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          TodaysWorkoutTile(
              // dateNum: '30',
              // month: 'Oct',
              // batchTime: '09.30-10.30',
              // dayName: 'Chest',
              ),
          MyGoalTile(),
          WeightChart(),
          SizedBox(height: 20.0),
          MyAttendance(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Text(
              'My Transformation',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          CustomerTransformationWidget()
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CustomerTransformationWidget extends StatefulWidget {
  const CustomerTransformationWidget({
    Key key,
  }) : super(key: key);

  @override
  _CustomerTransformationWidgetState createState() =>
      _CustomerTransformationWidgetState();
}

class _CustomerTransformationWidgetState
    extends State<CustomerTransformationWidget> {
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: customerTransformation(),
      builder: (c, s) {
        var widget;
        if (s.connectionState == ConnectionState.waiting) {
          widget = Center(child: CircularProgressIndicator());
        } else if (s.hasData && s.connectionState == ConnectionState.done) {
          var ti = transformaionImageModelFromJson(s.data.data);

          widget = Wrap(
            alignment: WrapAlignment.center,
            spacing: 5.0,
            children: [
              for (var img in ti)
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SafeArea(
                        child: Scaffold(
                          appBar: AppBar(backgroundColor: Colors.transparent),
                          backgroundColor: Colors.transparent,
                          body: Center(
                            child: Image.network(
                              img.image,
                              loadingBuilder: (_, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    height: 100,
                    width: 100,
                    child: CachedNetworkImage(
                      imageUrl: img.image,
                      placeholder: (_, __) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              Container(
                height: 100,
                width: 100,
                child: IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: () async {
                    PickedFile image = await _picker.getImage(
                      source: ImageSource.gallery,
                      imageQuality: 90,
                    );

                    if (image == null)
                      Fluttertoast.showToast(msg: "No image selected");
                    else {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      MultipartRequest postImage = MultipartRequest(
                        "POST",
                        Uri.parse(
                            'https://p2c-gym.herokuapp.com/customer/transformation/'),
                      );

                      postImage.headers.addAll(
                        {
                          HttpHeaders.authorizationHeader:
                              "TOKEN ${sp.getString("AUTH_KEY")}"
                        },
                      );

                      postImage.fields.addAll({
                        //TODO: add customer's id
                        "customer": "34"
                      });

                      postImage.files.add(
                        MultipartFile.fromBytes(
                          "image",
                          File(image.path).readAsBytesSync(),
                          filename: image.path.split("/").last,
                        ),
                      );

                      StreamedResponse response = await postImage.send();
                      Response kuchBhi = await Response.fromStream(response);

                      if (kuchBhi.statusCode >= 200 &&
                          kuchBhi.statusCode <= 205) {
                        print("voila!");
                      } else
                        print('Just die');

                      print(kuchBhi.body.toString());
                    }
                  },
                ),
              ),
            ],
          );
        } else
          widget = Center(child: Text("OOPS! NO DATA!"));
        return widget;
      },
    );
  }
}
