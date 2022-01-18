import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class registration_page extends StatelessWidget {
  @override
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("User");

  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();
  final TextEditingController _textEditingController5 = TextEditingController();
  final TextEditingController _textEditingController6 = TextEditingController();
  final TextEditingController _textEditingController7 = TextEditingController();
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            padding: EdgeInsets.only(right: 1, left: 0),
            child: Text("Registration",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                )),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      body: FadeInDownBig(
        child: ListView(
          padding: EdgeInsets.only(left: 10, right: 10),
          children: [
            Container(
                child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Column(children: [
                  Text('Create Your Account',
                      style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Create a new account',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  register("Name", "Enter Your Name", false, Icon(Icons.people),
                      "", _textEditingController1),
                  SizedBox(
                    height: 10,
                  ),
                  register("Number", "Enter Your Mobile Number", false,
                      Icon(Icons.contact_page), "", _textEditingController2),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      controller: _textEditingController3,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter some text";
                        }
                      },
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          labelText: "Email ID",
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.email_outlined),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 2)),
                          hintText: "Enter your Email Address",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  register("Image", "Paste your image url", false,
                      Icon(Icons.lock), "", _textEditingController7),
                  SizedBox(
                    height: 10,
                  ),
                  register("Address", "Enter your address", false,
                      Icon(Icons.location_city), "", _textEditingController6),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      controller: _textEditingController4,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter some text";
                        }
                      },
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.password_sharp),
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 2)),
                          hintText: "Enter your password",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  register("Confirm Password", "Confirmed Your Password", true,
                      Icon(Icons.lock), "confirmedp", _textEditingController5),
                  InkWell(
                    onTap: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: email, password: password);
                        SC(BuildContext, context);
                        await Future.delayed(Duration(seconds: 4));
                        Navigator.pushNamed(context, '/');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          WP(BuildContext, context);
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          EU(BuildContext, context);
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                      await collectionReference
                          .doc(_auth.currentUser!.uid)
                          .set({
                        'Name': _textEditingController1.text,
                        'MObile No': _textEditingController2.text,
                        'email': _textEditingController3.text,
                        'Image': _textEditingController7.text,
                        'password': _textEditingController4.text,
                        'Address': _textEditingController6.text,
                        "uid": _auth.currentUser!.uid
                      }).then((value) => _textEditingController1.clear());
                      // setState(() async {
                      //
                      // });
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ]))
              ],
            ))
          ],
        ),
      ),
    );
  }

  void setState(Future<Null> Function() param0) {}
}

Widget register(String labelText, String hintText, bool x, Icon myicon,
    String y, TextEditingController z) {
  return Container(
    height: 55,
    width: 380,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      onChanged: (value) {
        String y = value;
      },
      obscureText: x,
      controller: z,
      style: TextStyle(fontSize: 15),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please Enter some text";
        }
      },
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.amber, width: 2)),
          prefixIcon: myicon,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
    ),
  );
}

void WP(BuildContext, Context) {
  var alertDialog = AlertDialog(
    title: Text("Please Enter Strong Password"),
    // content: Text("Now you can Buy a product")
  );

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

void EU(BuildContext, Context) {
  var alertDialog = AlertDialog(
    title: Text("The account already exists for that email."),
    content: Text("Please enter new Email ID"),
    // content: Text("Now you can Buy a product")
  );

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

void SC(BuildContext, Context) {
  var alertDialog = AlertDialog(
    title: Text("You have successfuly registered on Agventure"),
    content: Text("Please Sign In"),
    // content: Text("Now you can Buy a product")
  );

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}
