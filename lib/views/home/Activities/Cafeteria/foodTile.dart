import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
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
          return AddToCartView(
            model: model,
          );
        })),
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(imgPath),
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
                    Custom.add_item,
                    size: 30,
                    color: kOrangeCol,
                  ),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddToCartView(
                        model: model,
                      );
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
