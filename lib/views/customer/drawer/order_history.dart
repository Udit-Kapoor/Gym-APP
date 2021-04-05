import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/pastOrder/PastCafeteriaOrder.dart';
import 'package:gym_app/models/pastOrder/PastCafeteriaOrderTrainer.dart';
import 'package:gym_app/models/pastOrder/PastSupplementOrder.dart';
import 'package:gym_app/models/pastOrder/PastTrainerOrder.dart';
import 'package:gym_app/views/customer/drawer/OrderHistoryCafeTile.dart';
import 'package:gym_app/views/customer/drawer/OrderHistoryTrainerTile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'OrderHistorySupplementTile.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({this.isCustomer});
  final bool isCustomer;
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  int idx = 0;

  Widget showDynamicBody(int idx) {
    if (idx == 0) {
      if (widget.isCustomer) {
        return FutureBuilder(
          future: getPastCafeOrder(),
          builder: (c, s) {
            if (s.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (s.hasData && s.connectionState == ConnectionState.done) {
              var model = cafeteriaPastOderFromJson(s.data.data);
              model = List.from(model.reversed);
              print(model);
              return Expanded(
                child: ListView.builder(
                    itemCount: model.length,
                    itemBuilder: (c, i) {
                      return OrderHistoryCafeTile(
                          imgPath: model[i].cart.order[0].item.item.photo,
                          name:
                              model[i].cart.order[0].item.item.name.toString(),
                          orderDate: model[i].cart.order[0].createdAt,
                          quantity: model[i].cart.order[0].quantity.toString(),
                          price: (model[i].cart.order[0].price *
                                  model[i].cart.order[0].quantity)
                              .toString());
                    }),
              );
            } else {
              return Text("No data found");
            }
          },
        );
      } else {
        return FutureBuilder(
          future: getPastCafeOrder(),
          builder: (c, s) {
            if (s.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (s.hasData && s.connectionState == ConnectionState.done) {
              var model = cafeteriaPastOrderTrainerFromJson(s.data.data);
              model = List.from(model.reversed);
              print(model);
              return Expanded(
                child: ListView.builder(
                    itemCount: model.length,
                    itemBuilder: (c, i) {
                      return OrderHistoryCafeTile(
                          imgPath: model[i].cart.order[0].item.item.photo,
                          name:
                              model[i].cart.order[0].item.item.name.toString(),
                          orderDate: model[i].cart.order[0].createdAt,
                          quantity: model[i].cart.order[0].quantity.toString(),
                          price: (model[i].cart.order[0].price *
                                  model[i].cart.order[0].quantity)
                              .toString());
                    }),
              );
            } else {
              return Text("No data found");
            }
          },
        );
      }
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
            model = List.from(model.reversed);
            print(model);
            return Expanded(
              //TODO: Add future builder
              child: ListView.builder(
                  itemCount: model.length,
                  itemBuilder: (c, i) {
                    return OrderHistorySupplementTile(
                      id: model[i].id,
                      imgPath: model[i].cart.item[0].product.image1,
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
      return FutureBuilder(
        future: getPastTrainerOrder(),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var model = pastTrainerOrderFromJson(s.data.data);
            model = List.from(model.reversed);
            print(model);
            return Expanded(
              //TODO: Add future builder
              child: ListView.builder(
                  itemCount: model.length,
                  itemBuilder: (c, i) {
                    return OrderHistoryTrainerTile(
                        imgPath: "",
                        name: model[i].slot.trainer.firstName +
                            model[i].slot.trainer.lastName,
                        startDate: model[i].startDate,
                        endDate: model[i].endDate,
                        price: model[i].amount.toString());
                  }),
            );
          } else {
            return Text("No data found");
          }
        },
      );
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
