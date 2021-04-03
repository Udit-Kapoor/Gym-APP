import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/supplement/SupplementProduct.dart';

class SupplementView extends StatefulWidget {
  @override
  _SupplementViewState createState() => _SupplementViewState();
}

class _SupplementViewState extends State<SupplementView> {
  String vendor = 'All';
  String search = "";
  String price = "";

  highToLow() {
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        price = "ordering=-price";
      });
    });
  }

  lowToHigh() {
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        price = "ordering=price";
      });
    });
  }

  Widget sort() {
    return IconButton(
      icon: Icon(
        Icons.sort,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) {
              return ShowSortSupplements(
                lowToHigh: lowToHigh,
                highToLow: highToLow,
              );
            });
      },
    );
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
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 340,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.0),
              borderRadius: new BorderRadius.all(Radius.elliptical(45, 45)),
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  search = "search=" + value;
                });
              },
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: kOrangeCol,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                  hintText: "Search Supplements... "),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  hint: Text("Select Vendor"),
                  value: vendor,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    setState(() {
                      vendor = newValue;
                    });
                  },
                  items: <String>[
                    'All',
                    'MyNutraMart',
                    'HealthKart',
                    'New Partner'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                sort(),
              ],
            ),
          ),
          FutureBuilder(
            future: getSupplements("?" +
                search +
                "&" +
                price +
                (vendor == "All" ? "" : "&vendor__name=" + vendor)),
            builder: (c, s) {
              if (s.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (s.hasData &&
                  s.connectionState == ConnectionState.done) {
                var model = s.data;
                print(model);
                return Expanded(
                  child: ListView.builder(
                      // shrinkWrap: true,

                      itemCount: model.results.length,
                      itemBuilder: (c, i) {
                        return SupplementTile(
                          imgPath: model.results[i].image1,
                          title: model.results[i].name,
                          size: model.results[i].weight.toString(),
                          flavour: "",
                          price: model.results[i].price.toString(),
                          seller: model.results[i].vendor.name,
                          protein: "",
                          cal: "",
                          vit: "",
                          model: model.results[i],
                          slug: model.results[i].slug,
                        );
                      }),
                );
              } else {
                return Text("No data found");
              }
            },
          ),
        ],
      ),
    );
  }
}
