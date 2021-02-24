import 'package:flutter/material.dart';
import 'package:gym_app/models/supplement/SupplementProduct.dart';
import 'package:gym_app/models/supplement/supplementSlug.dart';

import 'Supplements.dart';

class SupplementTile extends StatelessWidget {
  const SupplementTile({
    Key key,
    @required this.imgPath,
    @required this.title,
    @required this.size,
    @required this.flavour,
    @required this.price,
    @required this.seller,
    @required this.protein,
    @required this.cal,
    @required this.vit,
    @required this.slug,
    @required this.model,
  }) : super(key: key);

  final String imgPath;
  final String title;
  final String size;
  final String flavour;
  final String price;
  final String seller;
  final String protein;
  final String cal;
  final String vit;
  final Result model;
  final String slug;
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
                builder: (context) => SupplementDetails(
                      slug: slug,
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
                            image: AssetImage(imgPath),
                          )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          size + " , " + flavour,
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
                                  "Rs " + price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Text(
                                  "Seller: " + seller,
                                  style: TextStyle(fontSize: 8),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            GestureDetector(
                              onTap: () => {
                                addToSupplementCart({
                                  "product_id": model.id,
                                  "quantity": 1,
                                })
                              },
                              child: Container(
                                width: 70,
                                height: 26,
                                decoration: BoxDecoration(
                                    color: Color(0xFFEB3223),
                                    borderRadius: BorderRadius.circular(28.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "ADD",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "A single serve of 30g contains:",
                  style: TextStyle(fontSize: 8),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      protein,
                      style: TextStyle(fontSize: 8),
                    ),
                    Text(
                      cal,
                      style: TextStyle(fontSize: 8),
                    ),
                    Text(
                      vit,
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Helps in gaining weight",
                  style: TextStyle(fontSize: 8),
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
