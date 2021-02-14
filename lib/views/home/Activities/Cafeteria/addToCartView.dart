import 'package:flutter/material.dart';

const kOrange = Color(0xFFEB3223);

class addToCartView extends StatefulWidget {
  @override
  _addToCartViewState createState() => _addToCartViewState();
}

class _addToCartViewState extends State<addToCartView> {
  int qty = 0;
  String size = "small";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                //ToDO: Add MediaQuery height and width
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("image/burger.jpg"),
                  ),
                ),
              ),
              Positioned(
                top: 25,
                child: IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () => {Navigator.pop(context)}),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 25),
            child: Container(
              height: 30,
              width: 340,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.0),
                borderRadius: new BorderRadius.all(Radius.elliptical(45, 45)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10),
                child: Text(
                  "lorem ipsum delicious blavla...",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Burger A",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(
                  "50 Rs / 1 pc",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 40, right: 10),
            child: Row(
              children: [
                Text("Qty"),
                SizedBox(
                  width: 200,
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 40, right: 10),
            child: Row(
              children: [
                Text("Size"),
                SizedBox(
                  width: 195,
                ),
                GestureDetector(
                  onTap: () => {
                    setState(() {
                      size = "small";
                    }),
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: size == "small" ? kOrange : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Center(
                        child: Text(
                      "S",
                      style: TextStyle(
                        color: size == "small" ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () => {
                    setState(() {
                      size = "medium";
                    }),
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: size == "medium" ? kOrange : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Center(
                        child: Text(
                      "M",
                      style: TextStyle(
                        color: size == "medium" ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () => {
                    setState(() {
                      size = "large";
                    }),
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: size == "large" ? kOrange : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Center(
                        child: Text(
                      "L",
                      style: TextStyle(
                        color: size == "large" ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0, left: 33, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Bill :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "100 Rs",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 25),
            child: GestureDetector(
              //ToDo: Add POST REQUEST and NAVIGATE to CART
              onTap: null,
              child: Container(
                height: 50,
                width: 330,
                decoration: BoxDecoration(
                  color: kOrange,
                  // border: Border.all(color: Colors.black, width: 0.0),
                  borderRadius: new BorderRadius.all(Radius.elliptical(45, 45)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add To Basket",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
