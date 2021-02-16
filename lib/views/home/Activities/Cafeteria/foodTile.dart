import 'package:flutter/material.dart';
import 'package:gym_app/models/cart/cafeteria_items.dart';
import 'addToCartView.dart';

const korangeCol = Color(0xFFEB3223);

class foodTile extends StatelessWidget {
  const foodTile({
    Key key,
    @required this.imgPath,
    @required this.name,
    @required this.desc,
    @required this.rate,
    this.model,
  }) : super(key: key);

  final String imgPath;
  final String name;
  final String desc;
  final String rate;
  final CafeteriaItems model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return addToCartView(
            model: model,
          );
        })),
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    Text(
                      desc,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Text(rate),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    size: 30,
                    color: korangeCol,
                  ),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return addToCartView();
                    })),
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
