import 'package:flutter/material.dart';
import 'package:gym_app/models/supplement/supplementSlug.dart';

import '../../../../constants/constants.dart';
import 'Supplements.dart';

class SupplementDetails extends StatefulWidget {
  final String slug;
  SupplementDetails({Key key, this.slug}) : super(key: key);
  @override
  _SupplementDetailsState createState() => _SupplementDetailsState();
}

class _SupplementDetailsState extends State<SupplementDetails> {
  //Seller s = Seller.HEALTHKART;
  //String size = "4.4 lbs";
  //String flavour = "Chocolate";

  Widget showAddToCartButton(bool b, var model) {
    if (b) {
      if (!model.productExits) {
        return Padding(
          padding: const EdgeInsets.only(top: 22.0, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => {
                  addToSupplementCart({
                    "product_id": model.id,
                    "quantity": 1,
                  }),
                  setState(() {}),
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
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(top: 22.0, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Item Already in Cart"),
            ],
          ),
        );
      }
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 22.0, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Out Of Stock"),
          ],
        ),
      );
    }
  }

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
          "Supplements",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SupplementCart();
              })),
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: getSlugDetails(widget.slug),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var model = supplementSlugFromJson(s.data.data);
            print(model);
            return Column(
              children: [
                Expanded(
                    child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 105,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              image: DecorationImage(
                                image: NetworkImage(model.image1),
                              )),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 150,
                          width: 105,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              image: DecorationImage(
                                image: NetworkImage(model.image2),
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            model.weight.toString(),
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rs " + model.price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Seller: " + model.vendor.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 320,
                            height: 50,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(45, 45))),
                            child: Row(
                              children: [
                                Text("Size"),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Center(
                                      child: Text(
                                          model.weight.toString() + " Kgs")),
                                  // child: DropdownButton<String>(
                                  //     value: size,
                                  //     isExpanded: true,
                                  //     icon: Icon(Icons.keyboard_arrow_down),
                                  //     iconSize: 42,
                                  //     underline: SizedBox(),
                                  //     onChanged: (String newValue) {
                                  //       setState(() {
                                  //         size = newValue;
                                  //       });
                                  //     },
                                  //     items: <String>[
                                  //       '4.4 lbs',
                                  //       '2.0 lbs',
                                  //       '3.5 lbs',
                                  //       '4.3 lbs'
                                  //     ].map<DropdownMenuItem<String>>(
                                  //         (String value) {
                                  //       return DropdownMenuItem<String>(
                                  //         value: value,
                                  //         child: Center(child: Text(value)),
                                  //       );
                                  //     }).toList()),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Container(
                          //   width: 320,
                          //   height: 50,
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 5),
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       border:
                          //           Border.all(color: Colors.black, width: 1),
                          //       borderRadius: BorderRadius.all(
                          //           Radius.elliptical(45, 45))),
                          //   child: Row(
                          //     children: [
                          //       Text("Flavour"),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       Expanded(
                          //         child: DropdownButton<String>(
                          //             value: flavour,
                          //             isExpanded: true,
                          //             icon: Icon(Icons.keyboard_arrow_down),
                          //             iconSize: 42,
                          //             underline: SizedBox(),
                          //             onChanged: (String newValue) {
                          //               setState(() {
                          //                 flavour = newValue;
                          //               });
                          //             },
                          //             items: <String>[
                          //               'Chocolate',
                          //               'Strawberry',
                          //               'Banana',
                          //               'Almond'
                          //             ].map<DropdownMenuItem<String>>(
                          //                 (String value) {
                          //               return DropdownMenuItem<String>(
                          //                 value: value,
                          //                 child: Center(child: Text(value)),
                          //               );
                          //             }).toList()),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          showAddToCartButton(model.isStock, model),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "About Product",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: Text(
                            model.desc,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Nutritional Info For Mass Gainers",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(model.nutrition),
                        ],
                      ),
                    )
                  ],
                )),
              ],
            );
          } else {
            return Text("No data found");
          }
        },
      ),
    );
  }
}
