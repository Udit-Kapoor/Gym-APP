import 'package:flutter/material.dart';
import 'package:gym_app/models/cafe/cafeteria_items.dart';

const kOrange = Color(0xFFEB3223);

class addToCartView extends StatefulWidget {
  final CafeteriaItems model;

  addToCartView({Key key, this.model}) : super(key: key);

  @override
  _addToCartViewState createState() => _addToCartViewState();
}

class _addToCartViewState extends State<addToCartView> {
  int qty = 1;
  String size = "small";
  int price;
  int bill;
  int idx = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          //ToDo: Add POST REQUEST and NAVIGATE to CART
          elevation: 5,
          onPressed: () => addToCart({
            "quantity": qty,
            "item": widget.model.itemVarients[idx].id,
          }),
          label: Container(
            height: 50,
            width: 330,
            // decoration: BoxDecoration(
            //   color: kOrange,
            //   // border: Border.all(color: Colors.black, width: 0.0),
            //   borderRadius: new BorderRadius.all(Radius.elliptical(45, 45)),
            // ),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //ToDO: Add MediaQuery height and width
              height: 300,
              //width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("lib/assets/burger.jpg"),
                ),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () => {Navigator.pop(context)}),
              ),
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
                    widget.model.ingredients,
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
                    widget.model.name,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Text(
                    price.toString() + "Rs / 1 pc",
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
                  Spacer(),
                  IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () => {
                            setState(() {
                              qty++;
                              bill = price * qty;
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
                              bill = price * qty;
                            }),
                          }),
                  // Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 40, right: 30),
              child: Row(
                children: [
                  Text("Size"),
                  Spacer(
                    flex: 4,
                  ),
                  for (var i in widget.model.itemVarients)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: GestureDetector(
                        onTap: () => {
                          setState(() {
                            size = i.size;
                            price = i.price;
                            bill = price * qty;
                          }),
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: size == i.size ? kOrange : Colors.white,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Center(
                              child: Text(
                            i.size,
                            style: TextStyle(
                              color:
                                  size == i.size ? Colors.white : Colors.black,
                            ),
                          )),
                        ),
                      ),
                    ),
                  // Spacer(
                  //   flex: 1,
                  // ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 70, left: 33, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Bill :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    (bill).toString() + " Rs",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
