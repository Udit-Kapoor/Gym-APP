import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/lib.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool showPass = false;
  bool isCustomer = true;
  String number, pass;
  // Widget _userType(bool ut, String label) => GestureDetector(
  //       onTap: () => setState(() => isCustomer = ut),
  //       child: Container(
  //         height: 80,
  //         width: 80,
  //         child: Center(
  //           child: Text(
  //             label,
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //               color: isCustomer ? whiteColor : greyColor,
  //               fontSize: 14,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //         ),
  //         decoration: BoxDecoration(
  //           border: Border.all(
  //               color: isCustomer ? whiteColor : greyColor, width: 2),
  //           shape: BoxShape.circle,
  //         ),
  //       ),
  //     );

  Widget _cusOrEmp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isCustomer = true;
            });
          },
          child: Container(
            height: 80,
            width: 80,
            child: Center(
              child: Text(
                'Customer',
                style: TextStyle(
                    color: isCustomer ? Colors.white : Color(0xFF868686),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: isCustomer ? Colors.white : Color(0xFF868686),
                    width: 2),
                shape: BoxShape.circle),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 130,
          width: 1,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isCustomer = false;
            });
          },
          child: Container(
            height: 80,
            width: 80,
            child: Center(
              child: Text(
                'H2O \n Employee',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: isCustomer ? Color(0xFF868686) : Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: isCustomer ? Color(0xFF868686) : Colors.white,
                    width: 2),
                shape: BoxShape.circle),
          ),
        ),
      ],
    );
  }

  Widget _showForgotPass() {
    String email;
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0)), //this right here
                  child: Container(
                    height: 200,
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              "Send a password reset link to:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(top: 28.0, left: 25),
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         height: 12,
                            //         width: 12,
                            //         decoration: BoxDecoration(
                            //             shape: BoxShape.circle,
                            //             border: Border.all(
                            //                 color: Colors.black, width: 1.0)),
                            //       ),
                            //       SizedBox(
                            //         width: 15,
                            //       ),
                            //       Text(
                            //         "Phone",
                            //         style: TextStyle(
                            //             fontWeight: FontWeight.w400,
                            //             fontSize: 15),
                            //       ),
                            //       SizedBox(
                            //         width: 20,
                            //       ),
                            //       Container(
                            //         height: 30,
                            //         width: 150,
                            //         child: TextField(
                            //           keyboardType: TextInputType.number,
                            //           decoration: InputDecoration(
                            //             contentPadding: EdgeInsets.fromLTRB(
                            //                 5.0, 15.0, 20.0, 10.0),
                            //             hintText: "91-",
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 26.0, top: 20),
                              child: Row(
                                children: [
                                  // Container(
                                  //   height: 12,
                                  //   width: 12,
                                  //   decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       border: Border.all(
                                  //           color: Colors.black, width: 1.0)),
                                  // ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 150,
                                    child: TextField(
                                      maxLines: 1,
                                      onChanged: (value) {
                                        email = value;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            5.0, 15.0, 20.0, 10.0),
                                        hintText: "abcd@gmail.com",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 40.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => {Navigator.pop(context)},
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (!RegExp(
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                          .hasMatch(email)) {
                                        Fluttertoast.showToast(
                                            msg: "Enter a Valid Email");
                                      } else {
                                        postForgotPass({"email": email});
                                      }
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "Confirm",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                );
              });
        },
        child: Text('Forgot Password?'),
      ),
    );
  }

  Widget showChangePass() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0)), //this right here
                  child: Container(
                    height: 330,
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              "Change Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "Current Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 160,
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      5.0, 15.0, 20.0, 10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "New Password",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 160,
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      5.0, 15.0, 20.0, 10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "Confirm Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 160,
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      5.0, 15.0, 20.0, 10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 20.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => {Navigator.pop(context)},
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: null,
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "Confirm",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                );
              });
        },
        child: Text('ADD IT LATER WHEREVER'),
      ),
    );
  }

  Widget wishToChangePass() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0)), //this right here
                  child: Container(
                    height: 130,
                    child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Wish to change password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 20.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => {Navigator.pop(context)},
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "No",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: null,
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                );
              });
        },
        child: Text('CHANGE PASSWORD'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(loginIMG),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    _cusOrEmp(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                        hintText: loginUsernameHeader,
                      ),
                      onChanged: (value) => number = value,
                    ),
                    TextField(
                      obscureText: !showPass,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: loginPasswordHeader,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () =>
                                setState(() => showPass = !showPass),
                          )),
                      onChanged: (value) => pass = value,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => ApiHelper().submit(context, number, pass),
                      child: Icon(Icons.arrow_forward_rounded, size: 40),
                    ),
                    _showForgotPass(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
