import 'package:flutter/material.dart';
import '../../../../constants/constants.dart';

class ShowSortSupplements extends StatefulWidget {
  const ShowSortSupplements({this.lowToHigh, this.highToLow});

  final Function lowToHigh;
  final Function highToLow;

  @override
  _ShowSortSupplementsState createState() => _ShowSortSupplementsState();
}

class _ShowSortSupplementsState extends State<ShowSortSupplements> {
  // FoodType f = FoodType.VEG;
  Price p;
  // Seller s = Seller.ALL;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 130,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Text("Preference"),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("Veg"),
              //     Radio(
              //         value: FoodType.VEG,
              //         groupValue: f,
              //         onChanged: (FoodType value) {
              //           setState(() {
              //             f = value;
              //           });
              //         }),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("Non-Veg"),
              //     Radio(
              //         value: FoodType.NONVEG,
              //         groupValue: f,
              //         onChanged: (FoodType value) {
              //           setState(() {
              //             f = value;
              //           });
              //         }),
              //   ],
              // ),
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
                        widget.lowToHigh();
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
                        widget.highToLow();
                      }),
                ],
              ),
              // Text("Seller"),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("All"),
              //     Radio(
              //         value: Seller.ALL,
              //         groupValue: s,
              //         onChanged: (Seller value) {
              //           setState(() {
              //             s = value;
              //           });
              //         }),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("HealthKart"),
              //     Radio(
              //         value: Seller.HEALTHKART,
              //         groupValue: s,
              //         onChanged: (Seller value) {
              //           setState(() {
              //             s = value;
              //           });
              //         }),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("Vendor C"),
              //     Radio(
              //         value: Seller.VENDORC,
              //         groupValue: s,
              //         onChanged: (Seller value) {
              //           setState(() {
              //             s = value;
              //           });
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
