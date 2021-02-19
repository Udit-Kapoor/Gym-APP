import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';

class SupplementCart extends StatefulWidget {
  @override
  _SupplementCartState createState() => _SupplementCartState();
}

class _SupplementCartState extends State<SupplementCart> {
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
        //ToDo: Add Place Order POST req and Navigate to Order Placed
        onPressed: null,
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
                    "2199 Rs",
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
          SizedBox(
            height: 10,
          ),
          //ToDo: Not Updating qty..
          SupplementCartItem(
            imgPath: "lib/assets/protien.jpg",
            title: "MuscleBlaze Weight Gainer with\nAdded Digezyme",
            size: "6.6 lb",
            flavour: "Chocolate",
            price: "2099",
            seller: "HealthKart",
            setState: () => setState(() {}),
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
                Text("100 Rs"),
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
                    Text("2199 Rs"),
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
