import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        title: Text(
          "Contact Us",
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: Row(children: [
              SizedBox(width: 10),
              Text(
                "Sanket Hake",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 60),
              Column(
                children: [
                  Text(" 8356994981",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  SizedBox(height: 20),
                  Text(" sankethake4847@gmail.com",
                      style: TextStyle(
                        fontSize: 12,
                      ))
                ],
              )
            ]),
          ),
          Divider(),
          SizedBox(height: 20),
          Row(children: [
            SizedBox(width: 10),
            Text(
              "   Atharv \nYesansure",
              style: TextStyle(
                fontSize: 25,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 60),
            Column(
              children: [
                Text(" 7030595091",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                SizedBox(height: 20),
                Text(" atharvyesansure831@gmail.com",
                    style: TextStyle(
                      fontSize: 12,
                    ))
              ],
            )
          ]),
          Divider()
        ],
      ),
    );
  }
}
