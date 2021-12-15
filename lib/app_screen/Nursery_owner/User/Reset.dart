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
        title: Text("Reset Password"),
      ),
      body: ListView(
        children: [
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
                // TextFormField(
                //   // onChanged: (value) {
                //   //   email = value;
                //   // },
                //   obscureText: false,
                //   style: TextStyle(fontSize: 15),
                //   decoration: InputDecoration(
                //       labelText: "Password",
                //       labelStyle: TextStyle(color: Colors.black),
                //       prefixIcon: Icon(Icons.password_sharp),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide:
                //               BorderSide(color: Colors.amber, width: 2)),
                //       hintText: "Enter your Password",
                //       contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // TextFormField(
                //   // onChanged: (value) {
                //   //   email = value;
                //   // },
                //   obscureText: false,
                //   style: TextStyle(fontSize: 15),
                //   decoration: InputDecoration(
                //       labelText: "Confirm   Password",
                //       labelStyle: TextStyle(color: Colors.black),
                //       prefixIcon: Icon(Icons.password_sharp),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide:
                //               BorderSide(color: Colors.amber, width: 2)),
                //       hintText: "Enter your Password",
                //       contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                // ),
                // SizedBox(
                //   height: 40,
                // ),
                Container(
                  height: 45,
                  width: 110,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: ElevatedButton(
                      onPressed: () async {
                        _auth.sendPasswordResetEmail(email: email);
                        SP(BuildContext, context);
                        await Future.delayed(Duration(seconds: 3));
                        Navigator.pushNamed(context, "/");
                      },
                      child: Text("Submit")),
                )
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