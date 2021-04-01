import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';

class ShowSortCafeteria extends StatefulWidget {
  const ShowSortCafeteria(
      {this.veg, this.nonVeg, this.categoryLow, this.categoryHigh});

  final Function veg;
  final Function nonVeg;
  final Function categoryLow;
  final Function categoryHigh;

  @override
  _ShowSortCafeteriaState createState() => _ShowSortCafeteriaState();
}

class _ShowSortCafeteriaState extends State<ShowSortCafeteria> {
  FoodType f;
  Price p;
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
                      value: FoodType.VEG,
                      groupValue: f,
                      onChanged: (FoodType value) {
                        setState(() {
                          f = value;
                        });
                        widget.veg();
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Non-Veg"),
                  Radio(
                      value: FoodType.NONVEG,
                      groupValue: f,
                      onChanged: (FoodType value) {
                        setState(() {
                          f = value;
                        });
                        widget.nonVeg();
                      }),
                ],
              ),
              // Text("Price"),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("Low To High"),
              //     Radio(
              //         value: Price.LOWTOHIGH,
              //         groupValue: p,
              //         onChanged: (Price value) {
              //           setState(() {
              //             p = value;
              //           });
              //           widget.categoryLow();
              //         }),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("High To Low"),
              //     Radio(
              //         value: Price.HIGHTOLOW,
              //         groupValue: p,
              //         onChanged: (Price value) {
              //           setState(() {
              //             p = value;
              //           });
              //           widget.categoryHigh();
              //         }),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
