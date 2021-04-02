import 'package:flutter/material.dart';
import 'package:gym_app/apis/apis.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController currentPassword = TextEditingController();
    final TextEditingController newPassword = TextEditingController();
    final TextEditingController confirmNewPassword = TextEditingController();

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
        title: Text(
          'Forgot Password',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              controller: currentPassword,
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
                labelText: 'Current Password',
                labelStyle: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              controller: newPassword,
              obscureText: true,
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
                labelText: 'New Password',
                labelStyle: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              controller: confirmNewPassword,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
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
                labelText: 'Confirm New Password',
                labelStyle: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      side: BorderSide(width: 1.5),
                    ),
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: FlatButton(
                    onPressed: () async {
                      await ApiHelper().changePassword({
                        "old_password": currentPassword.text,
                        "new_password1": newPassword.text,
                        "new_password2": confirmNewPassword.text
                      });
                    },
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
