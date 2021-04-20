import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/views/customer/drawer/profile_picture.dart';
import '../customer/workout/text_field_widget.dart';

class TrainerProfileView extends StatelessWidget {
  const TrainerProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          'My Profile',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.qr_code_scanner,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
          future: trainerPro(),
          builder: (c, s) {
            var widget;

            if (s.connectionState == ConnectionState.waiting) {
              widget = Center(child: CircularProgressIndicator());
            } else if (s.hasData &&
                !s.data.error &&
                s.connectionState == ConnectionState.done) {
              var tp = trainerProfileModelFromJson(s.data.data);

              String _fullName =
                  [tp.firstName, tp.middleName ?? '', tp.lastName].join(' ');

              widget = Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    ProfilePicture(
                      imageUrl: tp.image ??
                          baseURL + '/media/customer/photo/noimage.jpg',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Hi! ${tp.firstName}',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Expanded(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          TextFieldWidget(
                            borderText: 'T_ID',
                            bodyText: tp.tid.toString(),
                          ),
                          TextFieldWidget(
                            borderText: 'Full Name',
                            // bodyText:
                            //     '${tp.firstName} ${tp.middleName} ${tp.lastName}',
                            bodyText: _fullName,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldWidget(
                                  borderText: 'D.O.B',
                                  bodyText: '12-06-1998',
                                ),
                              ),
                              Expanded(
                                child: TextFieldWidget(
                                  borderText: 'Gender',
                                  bodyText: tp.gender,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldWidget(
                                  borderText: 'Phone No.',
                                  bodyText: tp.phone,
                                ),
                              ),
                              Expanded(
                                child: TextFieldWidget(
                                  borderText: 'Alt.Phone No.',
                                  bodyText: tp.altPhone,
                                ),
                              ),
                            ],
                          ),
                          TextFieldWidget(
                            borderText: 'Email ID',
                            bodyText: tp.email,
                          ),
                          TextFieldWidget(
                            borderText: 'Address Line 1',
                            bodyText: tp.address1,
                          ),
                          TextFieldWidget(
                            borderText: 'Address Line 2',
                            bodyText: tp.address2,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldWidget(
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 5.0, 10.0),
                                  borderText: 'City',
                                  bodyText: tp.city,
                                ),
                              ),
                              Expanded(
                                child: TextFieldWidget(
                                  padding: EdgeInsets.fromLTRB(
                                      5.0, 10.0, 20.0, 10.0),
                                  borderText: 'State',
                                  bodyText: tp.state,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldWidget(
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 5.0, 10.0),
                                  borderText: 'Pin Code',
                                  bodyText: tp.pincode.toString(),
                                ),
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                        
                          TextFieldWidget(
                            borderText: 'ID Proof',
                            bodyText: tp.idProof,
                          ),
                          TextFieldWidget(
                            borderText: 'Resume/CV',
                            bodyText: tp.resume,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldWidget(
                                  borderText: 'Joining Date',
                                  bodyText: tp.joiningDate.toString(),
                                ),
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                          TextFieldWidget(
                            borderText: 'MonthlySalary',
                            bodyText: tp.salary.toString(),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldWidget(
                                  borderText: 'Next Salary Date',
                                  bodyText: tp.salaryDueDate.toString(),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else
              widget = Center(child: Text("OOPS! NO DATA!"));

            return widget;
          }),
    );
  }
}
