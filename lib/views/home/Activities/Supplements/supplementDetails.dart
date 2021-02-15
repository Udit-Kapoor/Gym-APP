import 'package:flutter/material.dart';
import 'supplementCart.dart';

const korangeCol = Color(0xFFEB3223);

enum seller { HealthKart, VendorC }

class supplementDetails extends StatefulWidget {
  @override
  _supplementDetailsState createState() => _supplementDetailsState();
}

class _supplementDetailsState extends State<supplementDetails> {
  seller s = seller.HealthKart;
  String size = "4.4 lbs";
  String flavour = "Chocolate";

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
          Expanded(
              child: ListView(
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
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        image: DecorationImage(
                          image: AssetImage("image/protien.jpg"),
                        )),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 150,
                    width: 105,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        image: DecorationImage(
                          image: AssetImage("image/protien.jpg"),
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
                      "MuscleBlaze Weight Gainer with Added \nDigezyme",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "6.6 lb, Chocolate",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rs 2099",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text(
                          "Seller: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Radio(
                            value: seller.HealthKart,
                            groupValue: s,
                            onChanged: (seller value) {
                              setState(() {
                                s = value;
                              });
                            }),
                        Text(
                          "HealthKart",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Radio(
                            value: seller.VendorC,
                            groupValue: s,
                            onChanged: (seller value) {
                              setState(() {
                                s = value;
                              });
                            }),
                        Text(
                          "Vendor C",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                    //ToDO: Align the dropdown Buttons
                    Container(
                      width: 320,
                      height: 50,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(45, 45))),
                      child: Row(
                        children: [
                          Text("Size"),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: DropdownButton<String>(
                                value: size,
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 42,
                                underline: SizedBox(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    size = newValue;
                                  });
                                },
                                items: <String>[
                                  '4.4 lbs',
                                  '2.0 lbs',
                                  '3.5 lbs',
                                  '4.3 lbs'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Center(child: Text(value)),
                                  );
                                }).toList()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 320,
                      height: 50,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(45, 45))),
                      child: Row(
                        children: [
                          Text("Flavour"),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: DropdownButton<String>(
                                value: flavour,
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 42,
                                underline: SizedBox(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    flavour = newValue;
                                  });
                                },
                                items: <String>[
                                  'Chocolate',
                                  'Strawberry',
                                  'Banana',
                                  'Almond'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Center(child: Text(value)),
                                  );
                                }).toList()),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            //ToDO: Add To Cart Instant?
                            onTap: null,
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
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "About Product",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: Text(
                      "MuscleBlaze Super Gainer XXL Banana is crafted especially for hardcore fitness enthusiasts who work hard to gain big and sturdy muscles and a sculpted physique.This advanced formula offers 15g protein per 100g serving. It has a blend of fast and slow-releasing proteins.It offers 75g of simple and complex carbs per serving of 100g that ensures a robust and sustained calorie release in your body to fuel your muscles for a longer duration MuscleBlaze Super Gainer XXL is enriched with 27 vital vitamins and minerals that help in boosting the immunity and regulating enzymes in your body Available in scrumptious Banana flavor, MuscleBlaze Super Gainer XXL is free from any added sugars and trans fats",
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
                    Text(
                        "Kcal 375 \nProtein 15 g \nCarbs 75 g \nDietary Fiber 1.4 g"),
                  ],
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
