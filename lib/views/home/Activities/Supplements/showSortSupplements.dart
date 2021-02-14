import 'package:flutter/material.dart';

enum foodType { Veg, NonVeg }
enum price { LowtoHigh, HightoLow }
enum seller { All, HealthKart, VendorC }

class showSortSupplements extends StatefulWidget {
  @override
  _showSortSupplementsState createState() => _showSortSupplementsState();
}

class _showSortSupplementsState extends State<showSortSupplements> {
  foodType f = foodType.Veg;
  price p = price.LowtoHigh;
  seller s = seller.All;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: 420,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Preference"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Veg"),
                  Radio(
                      value: foodType.Veg,
                      groupValue: f,
                      onChanged: (foodType value) {
                        setState(() {
                          f = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Non-Veg"),
                  Radio(
                      value: foodType.NonVeg,
                      groupValue: f,
                      onChanged: (foodType value) {
                        setState(() {
                          f = value;
                        });
                      }),
                ],
              ),
              Text("Price"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Low To High"),
                  Radio(
                      value: price.LowtoHigh,
                      groupValue: p,
                      onChanged: (price value) {
                        setState(() {
                          p = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("High To Low"),
                  Radio(
                      value: price.HightoLow,
                      groupValue: p,
                      onChanged: (price value) {
                        setState(() {
                          p = value;
                        });
                      }),
                ],
              ),
              Text("Seller"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("All"),
                  Radio(
                      value: seller.All,
                      groupValue: s,
                      onChanged: (seller value) {
                        setState(() {
                          s = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("HealthKart"),
                  Radio(
                      value: seller.HealthKart,
                      groupValue: s,
                      onChanged: (seller value) {
                        setState(() {
                          s = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Vendor C"),
                  Radio(
                      value: seller.VendorC,
                      groupValue: s,
                      onChanged: (seller value) {
                        setState(() {
                          s = value;
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
