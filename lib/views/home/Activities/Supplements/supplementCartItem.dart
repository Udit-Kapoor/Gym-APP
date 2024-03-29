import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/supplement/supplementCartModel.dart';

// ignore: must_be_immutable
class SupplementCartItem extends StatelessWidget {
  SupplementCartItem({
    Key key,
    @required this.imgPath,
    @required this.title,
    @required this.size,
    @required this.flavour,
    @required this.price,
    @required this.seller,
    @required this.setState,
    @required this.id,
    @required this.qty,
  }) : super(key: key);

  final String imgPath;
  final String title;
  final String size;
  final String flavour;
  final String price;
  final String seller;
  final Function setState;
  final int id;
  int qty;

  Seller s = Seller.HEALTHKART;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 97,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        image: DecorationImage(
                          image: AssetImage(imgPath),
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        size + " , " + flavour,
                        style: TextStyle(fontSize: 8),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Rs " + price,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              // Row(
                              //   children: [
                              //     Text(
                              //       "Seller: ",
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 12),
                              //     ),
                              //     Radio(
                              //         value: seller.HealthKart,
                              //         groupValue: s,
                              //         onChanged: (seller value) {
                              //           setState(() {
                              //             s = value;
                              //           });
                              //         }),
                              //     Text(
                              //       "HealthKart",
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 12),
                              //     ),
                              //     Radio(
                              //         value: seller.VendorC,
                              //         groupValue: s,
                              //         onChanged: (seller value) {
                              //           setState(() {
                              //             s = value;
                              //           });
                              //         }),
                              //     Text(
                              //       "Vendor C",
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 12),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () => {
                                    updateSupplementCartItem(
                                        {"item": id, "todo": "add"}),
                                    Timer(Duration(seconds: 1), () {
                                      setState();
                                    }),
                                  }),
                          Text('$qty'),
                          IconButton(
                              icon: Icon(
                                Icons.remove_circle,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () => {
                                    if (qty > 1)
                                      {
                                        updateSupplementCartItem(
                                            {"item": id, "todo": "remove"}),
                                        Timer(Duration(seconds: 1), () {
                                          setState();
                                        }),
                                      }
                                    else
                                      {
                                        Fluttertoast.showToast(
                                            msg: "Use Remove Button"),
                                      }
                                  }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () => {
                  delSupplementItem({"type": "product", "item": id}),
                  Timer(Duration(seconds: 2), () {
                    setState();
                  }),
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Remove',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
