import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Expanded(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35, top: 130),
                  child: Text(
                    "Welcome back \n Dear User 🤗",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 280),
                  child: Text(
                    "Account Information",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.43,
                      left: 10,
                      right: 10),
                  child: Column(
                    children: [
                      Data(context, "Name"),
                      SizedBox(
                        height: 25,
                      ),
                      Data(context, "email"),
                      SizedBox(
                        height: 25,
                      ),
                      Data(context, "MObile No"),
                      SizedBox(
                        height: 25,
                      ),
                      Data(context, "Address"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget Data(context, String parameter) {
  CollectionReference users = FirebaseFirestore.instance.collection('User');
  FirebaseAuth _auth = FirebaseAuth.instance;

  final uid = _auth.currentUser!.uid;
  print(uid);

  return FutureBuilder<DocumentSnapshot>(
    future: users.doc(uid).get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text("Something went wrong");
      }

      if (snapshot.hasData && !snapshot.data!.exists) {
        return Text("Document does not exist");
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            " ${parameter}: ${data[parameter]}",
            style: TextStyle(fontSize: 18),
          ),
        );
      }

      return Center(child: Text("Thoda Ruk be"));
    },
  );
}
