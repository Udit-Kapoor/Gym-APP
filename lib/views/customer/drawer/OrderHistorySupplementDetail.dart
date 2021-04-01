import 'package:flutter/material.dart';
import 'package:gym_app/models/pastOrder/PastSupplementOrderDetail.dart';

import 'package:intl/intl.dart';

class OrderHistorySupplementDetails extends StatefulWidget {
  final int id;
  OrderHistorySupplementDetails({Key key, this.id}) : super(key: key);
  @override
  _OrderHistorySupplementDetailsState createState() =>
      _OrderHistorySupplementDetailsState();
}

class _OrderHistorySupplementDetailsState
    extends State<OrderHistorySupplementDetails> {
  DateFormat formatter = DateFormat('dd-MM-yyyy');
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
          "Order Details",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: getOrderDetails(widget.id),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var model = supplementPastOrderDetailFromJson(s.data.data);
            print(model);
            return Column(
              children: [
                Expanded(
                    child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 105,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    model.cart.item[0].product.image1),
                              )),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 150,
                          width: 105,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    model.cart.item[0].product.image1),
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.cart.item[0].product.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          // SizedBox(
                          //   height: 8,
                          // ),
                          // Text(
                          //   model.cart.item[0].product.weight.toString(),
                          //   style: TextStyle(fontSize: 12),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rs " + model.cart.item[0].product.price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Seller: " + model.cart.item[0].product.vendor.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 320,
                            height: 50,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(45, 45))),
                            child: Row(
                              children: [
                                Text("Size"),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Center(
                                      child: Text(model
                                              .cart.item[0].product.weight
                                              .toString() +
                                          " Kgs")),
                                  // child: DropdownButton<String>(
                                  //     value: size,
                                  //     isExpanded: true,
                                  //     icon: Icon(Icons.keyboard_arrow_down),
                                  //     iconSize: 42,
                                  //     underline: SizedBox(),
                                  //     onChanged: (String newValue) {
                                  //       setState(() {
                                  //         size = newValue;
                                  //       });
                                  //     },
                                  //     items: <String>[
                                  //       '4.4 lbs',
                                  //       '2.0 lbs',
                                  //       '3.5 lbs',
                                  //       '4.3 lbs'
                                  //     ].map<DropdownMenuItem<String>>(
                                  //         (String value) {
                                  //       return DropdownMenuItem<String>(
                                  //         value: value,
                                  //         child: Center(child: Text(value)),
                                  //       );
                                  //     }).toList()),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Container(
                          //   width: 320,
                          //   height: 50,
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 5),
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       border:
                          //           Border.all(color: Colors.black, width: 1),
                          //       borderRadius: BorderRadius.all(
                          //           Radius.elliptical(45, 45))),
                          //   child: Row(
                          //     children: [
                          //       Text("Flavour"),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       Expanded(
                          //         child: DropdownButton<String>(
                          //             value: flavour,
                          //             isExpanded: true,
                          //             icon: Icon(Icons.keyboard_arrow_down),
                          //             iconSize: 42,
                          //             underline: SizedBox(),
                          //             onChanged: (String newValue) {
                          //               setState(() {
                          //                 flavour = newValue;
                          //               });
                          //             },
                          //             items: <String>[
                          //               'Chocolate',
                          //               'Strawberry',
                          //               'Banana',
                          //               'Almond'
                          //             ].map<DropdownMenuItem<String>>(
                          //                 (String value) {
                          //               return DropdownMenuItem<String>(
                          //                 value: value,
                          //                 child: Center(child: Text(value)),
                          //               );
                          //             }).toList()),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Order Id : " + model.cart.orderid,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: Text(
                            "Date Ordered: " + formatter.format(model.date),
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          )),
                        ],
                      ),
                    )
                  ],
                )),
              ],
            );
          } else {
            return Text("No data found");
          }
        },
      ),
    );
  }
}
