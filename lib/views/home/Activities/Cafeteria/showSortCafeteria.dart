import 'package:flutter/material.dart';

enum foodType { Veg, NonVeg }
enum price { LowtoHigh, HightoLow }

class showSortCafeteria extends StatefulWidget {
  @override
  _showSortCafeteriaState createState() => _showSortCafeteriaState();
}

class _showSortCafeteriaState extends State<showSortCafeteria> {
  foodType f = foodType.Veg;
  price p = price.LowtoHigh;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: 250,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Food Type"),
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
            ],
          ),
        ),
      ),
    );
  }
}
