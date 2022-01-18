import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Place_Order extends StatefulWidget {
  const Place_Order({Key? key}) : super(key: key);

  @override
  _Place_OrderState createState() => _Place_OrderState();
}

class _Place_OrderState extends State<Place_Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 180,
          ),
          Container(
            child: Lottie.network(
                "https://assets3.lottiefiles.com/packages/lf20_gsigmrhp.json"),
          ),
        ],
      ),
    );
  }
}
