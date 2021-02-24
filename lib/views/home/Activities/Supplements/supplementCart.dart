import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/supplement/supplementCartModel.dart';

class SupplementCart extends StatefulWidget {
  @override
  _SupplementCartState createState() => _SupplementCartState();
}

class _SupplementCartState extends State<SupplementCart> {
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
          "My Basket",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        //ToDo: Add Place Order POST req and Navigate to Order Placed
        onPressed: null,
        label: Container(
          height: 50,
          width: 330,
          child: Center(
            child: Text(
              "Checkout",
              style: TextStyle(
                  color: Colors.white, decoration: TextDecoration.underline),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder(
        future: getSupplementCart(),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (s.hasData && s.connectionState == ConnectionState.done) {
            var model = supplementCartModelFromJson(s.data.data);
            print(model);
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: model.item.length,
                        itemBuilder: (c, i) {
                          return SupplementCartItem(
                            imgPath: "lib/assets/protien.jpg",
                            title: model.item[i].product.name,
                            size: model.item[i].product.weight.toString(),
                            flavour: "API SAD",
                            price: model.item[i].product.price.toString(),
                            seller: model.item[i].product.vendor.name,
                            setState: () => setState(() {}),
                            id: model.item[i].id,
                          );
                        }),
                  ),
                ),
                //ToDO: Align These
                //ToDo: Must restrict double value to 2 decimal places
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tax",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Text((model.amount * 0.18).toString() + " Rs"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26, right: 26),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFDADADA),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 3, left: 32, bottom: 5, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Bill",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(model.amount.toString() + " Rs"),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Final Bill",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Text(
                      (model.amount + (model.amount * 0.18)).toString() + " Rs",
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
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
