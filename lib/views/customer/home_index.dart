import 'package:flutter/material.dart';
import 'package:gym_app/models/customer%20model/transformation_image_model.dart';
import 'package:gym_app/views/customer/my_attendance.dart';
import 'package:gym_app/views/customer/my_goal_title.dart';
import 'package:gym_app/views/customer/todays_workout_tile.dart';
import 'package:gym_app/views/customer/weight_chart.dart';

class HomeIndex extends StatelessWidget {
  HomeIndex({Key key}) : super(key: key);

  final List<String> _images = List.generate(
    8,
    (index) =>
        'https://images.unsplash.com/photo-1559949557-7d0ac3e655f2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=770&q=80',
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          TodaysWorkoutTile(
            dateNum: '30',
            month: 'Oct',
            batchTime: '09.30-10.30',
            dayName: 'Chest',
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
          FutureBuilder(
            future: customerTransformation(),
            builder: (c, s) {
              var widget;
              if (s.connectionState == ConnectionState.waiting) {
                widget = Center(child: CircularProgressIndicator());
              } else if (s.hasData &&
                  s.connectionState == ConnectionState.done) {
                var ti = transformaionImageModelFromJson(s.data.data);

                widget = Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 5.0,
                  children: [
                    for (var img in ti)
                      Container(
                        padding: EdgeInsets.only(bottom: 5.0),
                        height: 100,
                        width: 100,
                        // child: Image.network(img.image, fit: BoxFit.cover,),
                        child: FadeInImage.assetNetwork(
                          //TODO: Add transparent image
                          placeholder: 'lib/assets/profile.png',
                          image: img.image,
                          imageErrorBuilder: (_,__,___)=>Icon(Icons.error),
                        ),
                      ),
                    Container(
                      height: 100,
                      width: 100,
                      child: IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: () {},
                      ),
                    ),
                  ],
                );
              } else
                widget = Center(child: Text("OOPS! NO DATA!"));
              return widget;
            },
          )
        ],
      ),
    );
  }
}
