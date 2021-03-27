import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderHistoryTrainerTile extends StatelessWidget {
  const OrderHistoryTrainerTile({
    Key key,
    @required this.imgPath,
    @required this.name,
    @required this.startDate,
    @required this.endDate,
    @required this.price,
  }) : super(key: key);

  final String imgPath;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String price;

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: GestureDetector(
        //ToDO: Navigate to ItemDetails...
        onTap: null,
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
                        //ToDO:How to Wrap Long text without \n
                        Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Start Date : " + formatter.format(startDate),
                          style: TextStyle(fontSize: 8),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "End Date : " + formatter.format(endDate),
                          style: TextStyle(fontSize: 8),
                        ),
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
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
