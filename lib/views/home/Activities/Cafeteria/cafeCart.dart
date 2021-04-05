import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/cafe/cafeCartTrainer.dart';
import 'dart:async';

class CafeCart extends StatefulWidget {
  @override
  _CafeCartState createState() => _CafeCartState();
  const CafeCart({this.isCustomer});
  final bool isCustomer;
}

class _CafeCartState extends State<CafeCart> {
  CafeteriaCartTrainer localModel = new CafeteriaCartTrainer();
  CafeteriaCart localModel1 = new CafeteriaCart();
  // customerSetter() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   String s = sp.get("USER_TYPE");
  //   if (s == "CUSTOMER")
  //     widget.isCustomer = true;
  //   else
  //     widget.isCustomer = false;
  // }

  Widget showDynamicBody() {
    if (!widget.isCustomer) {
      return FutureBuilder(
        future: getCart(),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var model = cafeteriaCartTrainerFromJson(s.data.data);
            print(model);
            if (model[0].active) {
              localModel = model[0];
              return Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26.0, right: 26),
                    child: Container(
                      height: 470,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFDADADA),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Item",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                "Size",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Qty",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Bill",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Remove",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: model[0].order.length,
                                itemBuilder: (c, i) {
                                  return BillItem(
                                    name: model[0].order[i].item.item.name,
                                    size: model[0].order[i].item.size,
                                    qty: model[0].order[i].quantity.toString(),
                                    bill: (model[0].order[i].item.price *
                                            model[0].order[i].quantity)
                                        .toString(),
                                    id: model[0].order[i].id,
                                    setState: () => setState(() {}),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 17.0, left: 57, right: 56),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tax",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(model[0].tax.toString() + " Rs"),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 26, right: 26),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFDADADA),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 3, left: 32, bottom: 5, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Bill",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text((model[0].totalCost).toString() + " Rs"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 26, right: 26),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFDADADA),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 3, left: 32, bottom: 5, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Final Bill",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              (model[0].totalBill).toString() + " Rs",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text("Nothing in Cart"),
              );
            }
          } else {
            return Text("No data found");
          }
        },
      );
    } else {
      return FutureBuilder(
        future: getCart(),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var model = cafeteriaCartFromJson(s.data.data);
            print(model);
            if (model[0].active) {
              localModel1 = model[0];
              return Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26.0, right: 26),
                    child: Container(
                      height: 470,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFDADADA),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Item",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                "Size",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Qty",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Bill",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Remove",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: model[0].order.length,
                                itemBuilder: (c, i) {
                                  return BillItem(
                                    name: model[0].order[i].item.item.name,
                                    size: model[0].order[i].item.size,
                                    qty: model[0].order[i].quantity.toString(),
                                    bill: (model[0].order[i].item.price *
                                            model[0].order[i].quantity)
                                        .toString(),
                                    id: model[0].order[i].id,
                                    setState: () => setState(() {}),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 17.0, left: 57, right: 56),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tax",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text((model[0].totalBill - model[0].totalCost)
                                .toString() +
                            " Rs"),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 26, right: 26),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFDADADA),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 3, left: 32, bottom: 5, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Bill",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text((model[0].totalCost).toString() + " Rs"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 26, right: 26),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFDADADA),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 3, left: 32, bottom: 5, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Final Bill",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              (model[0].totalBill).toString() + " Rs",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text("Nothing in Cart"),
              );
            }
          } else {
            return Text("No data found");
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool b;
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          elevation: 5,
          onPressed: () async => {
            //ToDo: TEST ORDER PLACING
            if (widget.isCustomer)
              {
                b = await placeOrder({
                  "customer": localModel1.order[0].customer.id,
                  "cart": localModel1.id
                }),
              }
            else
              {
                b = await placeOrder({
                  "trainer": localModel.order[0].trainer.id,
                  "cart": localModel.id
                }),
              },
            if (!b)
              {
                Timer(Duration(seconds: 1), () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CafeOrderPlacedView();
                  }));
                }),
              }
          },
          label: Container(
            height: 50,
            width: 330,
            // decoration: BoxDecoration(
            //   color: kOrangeCol,
            //   // border: Border.all(color: Colors.black, width: 0.0),
            //   borderRadius: new BorderRadius.all(Radius.elliptical(45, 45)),
            // ),
            child: Center(
              child: Text(
                "Checkout",
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.underline),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 40,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context)),
          title: Text(
            "My Basket",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          //centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: showDynamicBody());
  }
}

class BillItem extends StatelessWidget {
  const BillItem({
    Key key,
    @required this.name,
    @required this.size,
    @required this.qty,
    @required this.bill,
    @required this.id,
    @required this.setState,
  }) : super(key: key);

  final String name;
  final String size;
  final String qty;
  final String bill;
  final int id;

  final Function setState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        ),
        SizedBox(
          width: 60,
        ),
        Text(
          size,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          qty,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          bill,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        ),
        SizedBox(
          width: 5,
        ),
        IconButton(
            icon: Icon(
              Icons.remove_circle,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () => {
                  delItem(id),
                  Timer(Duration(seconds: 2), () {
                    setState();
                  }),
                })
      ],
    );
  }
}
