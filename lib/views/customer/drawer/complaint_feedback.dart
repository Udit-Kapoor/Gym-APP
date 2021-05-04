import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/apis.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ComplaintFeedback extends StatefulWidget {
  const ComplaintFeedback({Key key}) : super(key: key);

  @override
  _ComplaintFeedbackState createState() => _ComplaintFeedbackState();
}

enum ChoiceMethod { complaint, feedback }

List<String> dropDownMenuItem = [
  'Employee',
  'Hygiene',
  'Gym Equipments',
  'Cafeteria',
  'Poolboard',
  'App',
  'Website'
];

class _ComplaintFeedbackState extends State<ComplaintFeedback> {
  String _dropDownValue = dropDownMenuItem[0];

  ChoiceMethod _method = ChoiceMethod.complaint;

  TextEditingController _decriptionController = TextEditingController();
  TextEditingController _topicController = TextEditingController();
  int rating = 0;

  Future<void> complaintFeedback() async {
    ApiResponse res = await ApiHelper().postReq(
      endpoint: _method == ChoiceMethod.complaint
          ? 'https://api.health2offer.com/customer/complaint/'
          : 'https://api.health2offer.com/customer/feedback/',
      data: _method == ChoiceMethod.complaint
          ? {
              "name": "Anonymous",
              "topic": _topicController.text.trim(),
              "complaint": _decriptionController.text.trim(),
              "resolve": false,
              "source": "App",
              "user": await ApiHelper().getUserObjectID(),
            }
          : {
              "name": "Anonymous",
              "topic": _dropDownValue,
              "feedback": _decriptionController.text.trim(),
              "rating": rating.toString(),
              "source": "App",
              "user": await ApiHelper().getUserObjectID(),
            },
    );
    if (res.error) {
      Fluttertoast.showToast(msg: 'Something went wrong...');
    } else {
      Fluttertoast.showToast(msg: 'Success');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
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
        title: Text(
          'Compaint and Feedback',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: ChoiceMethod.complaint,
                    groupValue: _method,
                    onChanged: (value) {
                      setState(() {
                        _method = value;
                      });
                    },
                    title: Text('Complaint'),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: ChoiceMethod.feedback,
                    groupValue: _method,
                    onChanged: (value) {
                      setState(() {
                        _method = value;
                      });
                    },
                    title: Text('Feedback'),
                  ),
                ),
              ],
            ),
            if (_method == ChoiceMethod.complaint)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: TextField(
                  controller: _topicController,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.black),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Topic',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.black),
                    hintText: 'enter topic',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.grey),
                  ),
                ),
              ),
            if (_method == ChoiceMethod.feedback)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: InputDecorator(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: 'Topic',
                    labelStyle: Theme.of(context).textTheme.headline6,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      isDense: true,
                      value: _dropDownValue,
                      onChanged: (value) {
                        setState(() {
                          _dropDownValue = value;
                        });
                      },
                      // selectedItemBuilder: (context) {return },
                      items: dropDownMenuItem.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            if (_method == ChoiceMethod.feedback)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: SmoothStarRating(
                  allowHalfRating: false,
                  onRated: (double v) {
                    rating = v.toInt();
                  },
                  starCount: 5,
                  rating: 2,
                  size: 40.0,
                  isReadOnly: false,
                  color: Colors.amber,
                  borderColor: Colors.yellow,
                  spacing: 0.0,
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TextField(
                controller: _decriptionController,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
                maxLines: 10,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  labelText: 'Description',
                  labelStyle: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black),
                  hintText: 'Write here...',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: FlatButton(
                onPressed: complaintFeedback,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  side: BorderSide(width: 1.5),
                ),
                child: Text(
                  'Submit',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
