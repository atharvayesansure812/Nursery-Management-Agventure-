import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class ResetP extends StatelessWidget {
  const ResetP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        title: Text("Reset Password"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Center(
              child: Text("Verify Your Email",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
                "Please enter your Email ID and\n then check your Gmail Account",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              child: Lottie.network(
                  "https://assets3.lottiefiles.com/private_files/lf30_GjhcdO.json")),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  obscureText: false,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: "Email ID",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.email_outlined),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.amber, width: 2)),
                      hintText: "Enter your Email Address",
                      contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)),
                  width: 170,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void SP(BuildContext, Context) {
  var alertDialog = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: AlertDialog(
        title: Text(
          'Set Your Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text("From Your Registered Email"),
      ));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}
