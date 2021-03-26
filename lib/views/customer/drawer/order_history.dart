import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/pastOrder/PastSupplementOrder.dart';

import 'OrderHistoryCafeTile.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  int idx = 0;

  Widget showDynamicBody(int idx) {
    if (idx == 0) {
      return Text("try 1");
    } else if (idx == 1) {
      return FutureBuilder(
        future: getPastSupplementOrder(),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var model = pastSupplementOrderFromJson(s.data.data);
            print(model);
            return Expanded(
              //TODO: Add future builder
              child: ListView.builder(
                  itemCount: model.length,
                  itemBuilder: (c, i) {
                    return OrderHistorySupplementTile(
                      imgPath: "",
                      title: model[i].cart.item[0].product.name,
                      size: model[i].cart.item[0].product.brand,
                      price: model[i].amount.toString(),
                    );
                  }),
            );
          } else {
            return Text("No data found");
          }
        },
      );
    } else if (idx == 2) {
      return Text("try 2");
    } else {
      return Text("No data Found");
    }
  }

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
                    onTap: () {
                      setState(() {
                        idx = 0;
                      });
                    },
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
                    onTap: () {
                      setState(() {
                        idx = 1;
                      });
                    },
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
                    onTap: () {
                      setState(() {
                        idx = 2;
                      });
                    },
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
            showDynamicBody(idx),
          ],
        ),
      ),
    );
  }
}
