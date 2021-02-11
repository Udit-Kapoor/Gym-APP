import 'package:flutter/material.dart';

const korangeCol = Color(0xFFEB3223);

class FoodTile extends StatelessWidget {
  const FoodTile({
    Key key,
    @required this.imgPath,
    @required this.name,
    @required this.desc,
    @required this.rate,
  }) : super(key: key);

  final String imgPath;
  final String name;
  final String desc;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  Text(
                    desc,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
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
                onPressed: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
