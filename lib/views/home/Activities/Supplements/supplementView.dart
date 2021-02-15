import 'package:flutter/material.dart';
import 'supplementTile.dart';
import 'showSortSupplements.dart';
import 'supplementCart.dart';

const korangeCol = Color(0xFFEB3223);

class supplementView extends StatefulWidget {
  @override
  _supplementViewState createState() => _supplementViewState();
}

class _supplementViewState extends State<supplementView> {
  String supplementType = 'All';

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
              return showSortSupplements();
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
                  "Supplements",
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
                      return supplementCart();
                    })),
                  },
                  //ToDo: Show Cart
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
                  hintText: "Search Supplements... "),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: supplementType,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    setState(() {
                      supplementType = newValue;
                    });
                  },
                  items: <String>[
                    'All',
                    'Protiens',
                    'Gainers',
                    'Pre/Post Workout',
                    'Vitamins',
                    'Minerals'
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
          Expanded(
            child: ListView(
              children: [
                supplementTile(
                    imgPath: "image/protien.jpg",
                    title: "MuscleBlaze Weight Gainer with\nAdded Digezyme",
                    size: "6.6 lb",
                    flavour: "Chocolate",
                    price: "2099",
                    seller: "HealthKart",
                    protein: "12 gm protein",
                    cal: "387 calories",
                    vit: "27 vitamins and minerals"),
                supplementTile(
                    imgPath: "image/protien.jpg",
                    title: "MuscleBlaze Weight Gainer with\nAdded Digezyme",
                    size: "6.6 lb",
                    flavour: "Chocolate",
                    price: "2099",
                    seller: "HealthKart",
                    protein: "12 gm protein",
                    cal: "387 calories",
                    vit: "27 vitamins and minerals"),
                supplementTile(
                    imgPath: "image/protien.jpg",
                    title: "MuscleBlaze Weight Gainer with\nAdded Digezyme",
                    size: "6.6 lb",
                    flavour: "Chocolate",
                    price: "2099",
                    seller: "HealthKart",
                    protein: "12 gm protein",
                    cal: "387 calories",
                    vit: "27 vitamins and minerals"),
                supplementTile(
                    imgPath: "image/protien.jpg",
                    title: "MuscleBlaze Weight Gainer with\nAdded Digezyme",
                    size: "6.6 lb",
                    flavour: "Chocolate",
                    price: "2099",
                    seller: "HealthKart",
                    protein: "12 gm protein",
                    cal: "387 calories",
                    vit: "27 vitamins and minerals"),
                supplementTile(
                    imgPath: "image/protien.jpg",
                    title: "MuscleBlaze Weight Gainer with\nAdded Digezyme",
                    size: "6.6 lb",
                    flavour: "Chocolate",
                    price: "2099",
                    seller: "HealthKart",
                    protein: "12 gm protein",
                    cal: "387 calories",
                    vit: "27 vitamins and minerals"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
