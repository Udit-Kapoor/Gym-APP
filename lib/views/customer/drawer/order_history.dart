import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';

import 'OrderHistoryCafeTile.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order History"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              //TODO: Add a function which changes future builder
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(45, 45)),
                        color: korangeCol,
                      ),
                      child: Center(
                        child: Text(
                          "Cafeteria",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(45, 45)),
                        color: korangeCol,
                      ),
                      child: Center(
                        child: Text(
                          "Supplement",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(45, 45)),
                        color: korangeCol,
                      ),
                      child: Center(
                        child: Text(
                          "Trainer",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
                //TODO: Add future builder
                child: ListView(
              children: [
                OrderHistoryCafeTile(
                  imgPath: "",
                  title: "TRIAL",
                  size: "1",
                  price: "23",
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
