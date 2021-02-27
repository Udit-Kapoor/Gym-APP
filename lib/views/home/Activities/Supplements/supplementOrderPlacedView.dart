import 'package:flutter/material.dart';

class supplementOrderPlacedView extends StatelessWidget {
  final String orderId;
  const supplementOrderPlacedView({@required this.orderId});
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 280,
          width: 320,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.check_circle,
                color: Color(0xFF44D32D),
                size: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 5,
                ),
                child: Text(
                  "Your order has been booked and you will receive a notification when it’s ready.\nThank You!",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Text("Order ID- " + orderId),
            ],
          ),
        ),
      ),
    );
  }
}
