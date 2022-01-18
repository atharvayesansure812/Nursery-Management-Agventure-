import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            padding: EdgeInsets.only(right: 1, left: 24),
            child: Text("About",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                )),
          ),
          shape: RoundedRectangleBorder(   
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              "      Our goal is to support thousands of smallholder farmers and plant nursery owners across India, by providing them with a app who can sell their"
              "crops and various plants. And this app gives a platform to the farmers and nursery owners to sell their products directly to the consumers.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
