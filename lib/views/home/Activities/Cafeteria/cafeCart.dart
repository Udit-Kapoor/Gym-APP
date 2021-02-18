import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';

class CafeCart extends StatefulWidget {
  @override
  _CafeCartState createState() => _CafeCartState();
}

class _CafeCartState extends State<CafeCart> {
  CafeteriaCart localModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        //ToDo: Add Place Order POST req and Navigate to Order Placed
        elevation: 5,
        onPressed: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return cafeOrderPlacedView();
          })),
        },
        label: Container(
          height: 50,
          width: 330,
          // decoration: BoxDecoration(
          //   color: kOrangeCol,
          //   // border: Border.all(color: Colors.black, width: 0.0),
          //   borderRadius: new BorderRadius.all(Radius.elliptical(45, 45)),
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Final Bill",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (localModel == null ? 0 : localModel.totalBill).toString() +
                        " Rs",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Text(
                "Checkout",
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context)),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "My Basket",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 26),
            child: Container(
              height: 500,
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
                  FutureBuilder(
                    future: getCart(),
                    builder: (c, s) {
                      if (s.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (s.hasData &&
                          s.connectionState == ConnectionState.done) {
                        //ToDO: Change Container UI
                        var model = cafeteriaCartFromJson(s.data.data);
                        print(model);
                        if (model[0].active) {
                          localModel = model[0];
                          return Expanded(
                            child: ListView.builder(
                                itemCount: model[0].order.length,
                                itemBuilder: (c, i) {
                                  return BillItem(
                                      name: model[0].order[i].item.item.name,
                                      size: model[0].order[i].item.size,
                                      qty:
                                          model[0].order[i].quantity.toString(),
                                      bill: (model[0].order[i].item.price *
                                              model[0].order[i].quantity)
                                          .toString());
                                }),
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
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17.0, left: 57, right: 56),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tax",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text((localModel == null
                            ? 0
                            : localModel.totalBill - localModel.totalCost)
                        .toString() +
                    " Rs"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 26, right: 26),
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
                    Text((localModel == null ? 0 : localModel.totalCost)
                            .toString() +
                        " Rs"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BillItem extends StatelessWidget {
  const BillItem({
    Key key,
    @required this.name,
    @required this.size,
    @required this.qty,
    @required this.bill,
  }) : super(key: key);

  final String name;
  final String size;
  final String qty;
  final String bill;

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
            //ToDo: Add Remove from Cart POST req
            onPressed: null)
      ],
    );
  }
}
