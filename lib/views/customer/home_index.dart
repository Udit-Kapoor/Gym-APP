import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/models/weight_graph_model.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/models/customer/transformation_image_model.dart';
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
    super.build(context);

    return Expanded(
      child: ListView(
        // addAutomaticKeepAlives: false,
        cacheExtent: 999,

        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          TodaysWorkoutTile(),
          MyGoalTile(),
          FutureBuilder(
              future: customerWeightGraph(),
              builder: (context, s) {
                if (s.connectionState == ConnectionState.done)
                  return WeightChart(res: s.data);
                else if (s.connectionState == ConnectionState.waiting)
                  return LinearProgressIndicator();
                return Container();
              }),
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
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    setState(() => this._imageFile = null);
    final PickedFile imageFile = await showDialog<PickedFile>(
      context: context,
      builder: (ctx) => SimpleDialog(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take picture'),
            onTap: () async {
              final PickedFile pickedFile =
                  await _picker.getImage(source: ImageSource.camera);
              setState(() {
                _imageFile = pickedFile;
              });
              Navigator.pop(ctx);
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Pick from gallery'),
            onTap: () async {
              try {
                final PickedFile pickedFile =
                    await _picker.getImage(source: ImageSource.gallery);
                setState(() {
                  _imageFile = pickedFile;
                });
                Navigator.pop(ctx);
              } catch (e) {
                print(e);
                Navigator.pop(ctx);
              }
            },
          ),
        ],
      ),
    );
    if (_imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please pick one image first.')),
      );
      return;
    }
    setState(() => this._imageFile = imageFile);
    print('picked image: ${this._imageFile}');
    return;
  }

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
                    await _pickImage();
                    if (_imageFile != null) {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      MultipartRequest postImage = MultipartRequest(
                        "POST",
                        Uri.parse(
                            'https://api.health2offer.com/customer/transformation/'),
                      );

                      postImage.headers.addAll(
                        {
                          HttpHeaders.authorizationHeader:
                              "TOKEN ${sp.getString("AUTH_KEY")}"
                        },
                      );

                      postImage.fields.addAll(
                          {"customer": sp.getInt("USER_OBJECT_ID").toString()});

                      postImage.files.add(
                        MultipartFile.fromBytes(
                          "image",
                          File(_imageFile.path).readAsBytesSync(),
                          filename: _imageFile.path.split("/").last,
                        ),
                      );

                      StreamedResponse response = await postImage.send();
                      Response kuchBhi = await Response.fromStream(response);

                      if (kuchBhi.statusCode >= 200 &&
                          kuchBhi.statusCode <= 205) {
                        Fluttertoast.showToast(msg: "Image added");
                      } else
                        Fluttertoast.showToast(msg: "Failed to add image");
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
