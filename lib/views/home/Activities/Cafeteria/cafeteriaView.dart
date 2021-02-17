import 'package:flutter/material.dart';
import 'package:gym_app/models/cart/cafeteria_items.dart';
import 'package:gym_app/views/home/Activities/Cafeteria/cafeCart.dart';
import 'foodTile.dart';
import 'showSortCafeteria.dart';

const korangeCol = Color(0xFFEB3223);

class cafeteriaView extends StatefulWidget {
  @override
  _cafeteriaViewState createState() => _cafeteriaViewState();
}

class _cafeteriaViewState extends State<cafeteriaView> {
  String foodValue = 'All';

  Widget SORT() {
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
              return showSortCafeteria();
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context)),
                Text(
                  "Cafetreia",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black),
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return cafeCart();
                    })),
                  }, //ToDo: Show Cart
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 340,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.0),
              borderRadius: new BorderRadius.all(Radius.elliptical(45, 45)),
            ),
            child: TextField(
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
                    'Fruit Shakes',
                    'Meals',
                    'Burgers',
                    'Beverages',
                    'Deserts'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SORT(),
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
            future: getCafeItems(),
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
                        return foodTile(
                          imgPath: 'image/burger.jpg',
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
