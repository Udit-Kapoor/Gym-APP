import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';

class SupplementCartItem extends StatefulWidget {
  const SupplementCartItem({
    Key key,
    @required this.imgPath,
    @required this.title,
    @required this.size,
    @required this.flavour,
    @required this.price,
    @required this.seller,
  }) : super(key: key);

  final String imgPath;
  final String title;
  final String size;
  final String flavour;
  final String price;
  final String seller;

  @override
  _SupplementCartItemState createState() => _SupplementCartItemState();
}

class _SupplementCartItemState extends State<SupplementCartItem> {
  @override
  Widget build(BuildContext context) {
    Seller s = Seller.HEALTHKART;
    int qty = 1;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
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
                          image: AssetImage(widget.imgPath),
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //ToDO:How to Wrap Long text without \n
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.size + " , " + widget.flavour,
                        style: TextStyle(fontSize: 8),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Rs " + widget.price,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              // Row(
                              //   children: [
                              //     Text(
                              //       "Seller: ",
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 12),
                              //     ),
                              //     Radio(
                              //         value: seller.HealthKart,
                              //         groupValue: s,
                              //         onChanged: (seller value) {
                              //           setState(() {
                              //             s = value;
                              //           });
                              //         }),
                              //     Text(
                              //       "HealthKart",
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 12),
                              //     ),
                              //     Radio(
                              //         value: seller.VendorC,
                              //         groupValue: s,
                              //         onChanged: (seller value) {
                              //           setState(() {
                              //             s = value;
                              //           });
                              //         }),
                              //     Text(
                              //       "Vendor C",
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 12),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () => {
                                    setState(() {
                                      qty++;
                                    }),
                                  }),
                          Text('$qty'),
                          IconButton(
                              icon: Icon(
                                Icons.remove_circle,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () => {
                                    setState(() {
                                      if (qty > 1) qty--;
                                    }),
                                  })
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
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
    );
  }
}
