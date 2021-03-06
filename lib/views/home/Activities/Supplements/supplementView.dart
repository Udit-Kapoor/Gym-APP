import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';
import 'package:gym_app/models/supplement/SupplementProduct.dart';

class SupplementView extends StatefulWidget {
  @override
  _SupplementViewState createState() => _SupplementViewState();
}

class _SupplementViewState extends State<SupplementView> {
  String supplementType = 'All';
  String query = "";

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
              return ShowSortSupplements();
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
            //ToDo: Show Cart
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
                sort(),
              ],
            ),
          ),
          FutureBuilder(
            future: getSupplements(query),
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
                          imgPath: 'lib/assets/protien.jpg',
                          title: model.results[i].name,
                          size: model.results[i].weight.toString(),
                          flavour: "API mai ni hai",
                          price: model.results[i].price.toString(),
                          seller: model.results[i].vendor.name,
                          protein: "api",
                          cal: "api",
                          vit: "api",
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
