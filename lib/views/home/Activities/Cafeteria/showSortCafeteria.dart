import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';

class ShowSortCafeteria extends StatefulWidget {
  @override
  _ShowSortCafeteriaState createState() => _ShowSortCafeteriaState();
}

class _ShowSortCafeteriaState extends State<ShowSortCafeteria> {
  FoodType f = FoodType.VEG;
  Price p = Price.LOWTOHIGH;
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
                      }),
                ],
              ),
              Text("Price"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Low To High"),
                  Radio(
                      value: Price.LOWTOHIGH,
                      groupValue: p,
                      onChanged: (Price value) {
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
                      value: Price.HIGHTOLOW,
                      groupValue: p,
                      onChanged: (Price value) {
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
