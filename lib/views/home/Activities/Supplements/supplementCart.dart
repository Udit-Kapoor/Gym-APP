import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/supplement/supplementCartModel.dart';
import 'package:gym_app/views/home/Activities/Supplements/supplementOrderPlacedView.dart';

class SupplementCart extends StatefulWidget {
  @override
  _SupplementCartState createState() => _SupplementCartState();
}

class _SupplementCartState extends State<SupplementCart> {
  SupplementCartModel local;
  bool b;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        //ToDo: Works only for Customer
        onPressed: () async => {
          if (local.item == null)
            {
              Fluttertoast.showToast(msg: "Nothing in the Cart"),
            }
          else
            {
              b = await placeSupplementCart(
                  {"MOP": "app", "mode": "Pay at Gym"}),
              //ToDo: Add if else of error
              if (b)
                {}
              else
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SupplementOrderPlacedView(
                        orderId: local.orderid,
                      ),
                    ),
                  ),
                }
            }
        },
        label: Container(
          height: 50,
          width: 330,
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
      body: FutureBuilder(
        future: getSupplementCart(),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var check = jsonDecode(s.data[1].data);
            if (check.runtimeType == String) {
              return Center(
                child: Text("Cart is Empty"),
              );
            } else {
              var model = supplementCartModelFromJson(
                  s.data[1].data, s.data[0] == "CUSTOMER");
              local = model;
              print(model);
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          itemCount: model.item.length,
                          itemBuilder: (c, i) {
                            return SupplementCartItem(
                              imgPath: "lib/assets/protien.jpg",
                              title: model.item[i].product.name,
                              size: model.item[i].product.weight.toString(),
                              flavour: "",
                              price: model.item[i].product.price.toString(),
                              seller: model.item[i].product.vendor.name,
                              setState: () => setState(() {}),
                              id: model.item[i].id,
                              qty: model.item[i].quantity,
                            );
                          }),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 55),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Tax",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       ),
                  //       // SizedBox(
                  //       //   width: 200,
                  //       // ),
                  //       Text((model.amount * 0.18).toString() + " Rs"),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFDADADA),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 3, left: 30, bottom: 5, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Bill",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(model.amount.toString() + " Rs"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 55),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Final Bill",
                  //         style: TextStyle(
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       // SizedBox(
                  //       //   width: 200,
                  //       // ),
                  //       Text(
                  //         (model.amount + (model.amount * 0.18))
                  //                 .toStringAsFixed(2) +
                  //             " Rs",
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              );
            }
          } else {
            return Text("No data found");
          }
        },
      ),
    );
  }
}
