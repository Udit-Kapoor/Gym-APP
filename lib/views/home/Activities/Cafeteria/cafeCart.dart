import 'package:flutter/material.dart';
import 'package:gym_app/models/cart/cafeteria_items.dart';
import 'cafeOrderPlacedView.dart';

const kOrange = Color(0xFFEB3223);

class cafeCart extends StatefulWidget {
  @override
  _cafeCartState createState() => _cafeCartState();
}

class _cafeCartState extends State<cafeCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Item",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Size",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        width: 36,
                      ),
                      Text(
                        "Qty",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        width: 43,
                      ),
                      Text(
                        "Bill",
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
                        //ToDO: Change Model + Contact Sameer
                        var model = cafeteriaItemsFromJson(s.data.data);
                        print(model);
                        return Expanded(
                          child: ListView.builder(
                              itemCount: model.length,
                              itemBuilder: (c, i) {
                                return BillItem(
                                    name: null,
                                    size: null,
                                    qty: null,
                                    bill: null);
                              }),
                        );
                      } else {
                        return Text("No data found");
                      }
                    },
                  ),
                  BillItem(
                      name: "Burger A", size: "S", qty: "2", bill: "Rs 100"),
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
                Text("20 Rs"),
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
                    Text("120 Rs"),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350.0),
            child: GestureDetector(
              //ToDo: Add Place Order POST req and Navigate to Order Placed
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return cafeOrderPlacedView();
                })),
              },
              child: Container(
                height: 50,
                width: 330,
                decoration: BoxDecoration(
                  color: kOrange,
                  // border: Border.all(color: Colors.black, width: 0.0),
                  borderRadius: new BorderRadius.all(Radius.elliptical(45, 45)),
                ),
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
                          "120 Rs",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        ),
        SizedBox(
          width: 50,
        ),
        Text(
          size,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        ),
        SizedBox(
          width: 36,
        ),
        Text(
          qty,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        ),
        SizedBox(
          width: 43,
        ),
        Text(
          bill,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        ),
        SizedBox(
          width: 14,
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
