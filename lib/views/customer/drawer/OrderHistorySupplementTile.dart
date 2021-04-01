import 'package:flutter/material.dart';
import 'package:gym_app/views/customer/drawer/OrderHistorySupplementDetail.dart';

class OrderHistorySupplementTile extends StatelessWidget {
  const OrderHistorySupplementTile({
    Key key,
    @required this.id,
    @required this.imgPath,
    @required this.title,
    @required this.size,
    @required this.price,
  }) : super(key: key);

  final int id;
  final String imgPath;
  final String title;
  final String size;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: GestureDetector(
        //ToDO: Navigate to ItemDetails...
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderHistorySupplementDetails(
                      id: id,
                    )),
          )
        },
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
                            image: NetworkImage(imgPath),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //ToDO:How to Wrap Long text without \n
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          size,
                          style: TextStyle(fontSize: 8),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Rs " + price + " /Per Unit",
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
