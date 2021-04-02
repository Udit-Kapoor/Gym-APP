import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:shared_preferences/shared_preferences.dart';

const korangeCol = Color(0xFFEB3223);

class CafeteriaView extends StatefulWidget {
  @override
  _CafeteriaViewState createState() => _CafeteriaViewState();
}

class _CafeteriaViewState extends State<CafeteriaView> {
  String foodValue = 'All';
  String search = "";
  String ordering = "";

  veg() {
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        ordering = "ordering=-type";
      });
    });
  }

  nonVeg() {
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        ordering = "ordering=type";
      });
    });
  }

  categoryLow() {
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        ordering = "ordering=category";
      });
    });
  }

  categoryHigh() {
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        ordering = "ordering=-category";
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
              return ShowSortCafeteria(
                veg: veg,
                nonVeg: nonVeg,
                categoryLow: categoryLow,
                categoryHigh: categoryHigh,
              );
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences sp;
    String s;
    bool isCustomer;
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
          "Cafetreia",
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
            onPressed: () async => {
              // customerSetter() async {
              sp = await SharedPreferences.getInstance(),
              s = sp.get("USER_TYPE"),
              if (s == "CUSTOMER")
                {
                  isCustomer = true,
                }
              else
                {
                  isCustomer = false,
                },
              // }
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CafeCart(
                  isCustomer: isCustomer,
                );
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
                    color: korangeCol,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                  hintText: "Search food items... "),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: foodValue,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    setState(() {
                      foodValue = newValue;
                    });
                  },
                  items: <String>[
                    'All',
                    // 'Fruit Shakes',
                    // 'Meals',
                    // 'Burgers',
                    // 'Beverages',
                    // 'Deserts'
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
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 40),
            child: Row(
              children: [
                Text(
                  "Item",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 165.0),
                  child: Text("Price (Rs)",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: getCafeItems("?" + search + "&" + ordering),
            builder: (c, s) {
              if (s.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (s.hasData &&
                  s.connectionState == ConnectionState.done) {
                var model = cafeteriaItemsFromJson(s.data.data);
                print(model);
                return Expanded(
                  child: ListView.builder(
                      itemCount: model.length,
                      itemBuilder: (c, i) {
                        return FoodTile(
                          imgPath:
                              "http://api.health2offer.com/" + model[i].photo,
                          name: model[i].name,
                          desc: model[i].ingredients,
                          rate: model[i].itemVarients[0].price.toString(),
                          model: model[i],
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
