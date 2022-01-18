import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';

class Nursery_Regestration extends StatelessWidget {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Sanket");
  @override
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();
  final TextEditingController _textEditingController5 = TextEditingController();
  final TextEditingController _textEditingController6 = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            padding: EdgeInsets.only(right: 8, left: 3),
            child: Text("Nursery Registration",
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
        delay: Duration(milliseconds: 500),
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.only(left: 12, right: 12, bottom: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Column(children: [
                      Text('Add Your Nursery',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "Already Registered Nursery",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Click On plus Icon",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/addproduct");
                        },
                        child: Lottie.network(
                            "https://assets1.lottiefiles.com/packages/lf20_baB1GS.json"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      register("Nursery Owner / Seller", "Enter Your Name",
                          false, Icon(Icons.person), _textEditingController1),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      register("Nursery Name", "Enter Your Nursery Name", false,
                          Icon(Icons.people), _textEditingController2),
                      SizedBox(
                        height: 10,
                      ),
                      register(
                          "Location",
                          "Enter Address Of Nursery",
                          false,
                          Icon(Icons.location_city_outlined),
                          _textEditingController3),
                      SizedBox(
                        height: 10,
                      ),
                      register(
                          "Contact",
                          "Enter Your Contact Information",
                          false,
                          Icon(Icons.contact_page_rounded),
                          _textEditingController4),
                      SizedBox(
                        height: 10,
                      ),
                      register(
                          "About",
                          "Enter Detailed Information About Nursery",
                          false,
                          Icon(Icons.info_outline),
                          _textEditingController5),
                      SizedBox(
                        height: 10,
                      ),
                      register("Images", "Enter image link of your nursery",
                          false, Icon(Icons.image), _textEditingController6),

                      InkWell(
                        onTap: () {
                          collectionReference
                              .doc(_textEditingController2.text)
                              .set({
                            "NurseryOwner": _textEditingController1.text,
                            "NurseryName ": _textEditingController2.text,
                            "Location ": _textEditingController3.text,
                            "Contact No":
                                int.parse(_textEditingController4.text),
                            "About Nursery": _textEditingController5.text,
                            "Images": _textEditingController6.text
                          });
                          SC(BuildContext, context);
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(40)),
                        ),
                      ),

                      // Container(
                      //   height: 60,
                      //   width: 380,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: TextFormField(
                      //     onChanged: (value) {
                      //       email = value;
                      //     },
                      //     controller: _textEditingController3,
                      //     obscureText: false,
                      //     validator: (value) {
                      //       if (value == null || value.isEmpty) {
                      //         return "please Enter some text";
                      //       }
                      //     },
                      //     style: TextStyle(fontSize: 15),
                      //     decoration: InputDecoration(
                      //         labelText: "Email ID",
                      //         labelStyle: TextStyle(color: Colors.black),
                      //         prefixIcon: Icon(Icons.email_outlined),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(50),
                      //             borderSide:
                      //                 BorderSide(color: Colors.amber, width: 2)),
                      //         hintText: "Enter your Email Address",
                      //         contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   height: 60,
                      //   width: 380,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: TextFormField(
                      //     onChanged: (value) {
                      //       password = value;
                      //     },
                      //     controller: _textEditingController4,
                      //     obscureText: false,
                      //     validator: (value) {
                      //       if (value == null || value.isEmpty) {
                      //         return "please Enter some text";
                      //       }
                      //     },
                      //     style: TextStyle(fontSize: 15),
                      //     decoration: InputDecoration(
                      //         labelText: "Password",
                      //         prefixIcon: Icon(Icons.password_sharp),
                      //         labelStyle: TextStyle(color: Colors.black),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(50),
                      //             borderSide:
                      //                 BorderSide(color: Colors.amber, width: 2)),
                      //         hintText: "Enter your password",
                      //         contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // register(
                      //     "Confirm Password",
                      //     "Confirmed Your Password",
                      //     true,
                      //     Icon(Icons.password_outlined),
                      //     "confirmedp",
                      //     _textEditingController5),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      // InkWell(
                      //   onTap: () async {
                      //     await collectionReference.add({
                      //       'Name': _textEditingController1.text,
                      //       'MObile No': _textEditingController2.text,
                      //       'email': _textEditingController3.text,
                      //       'password': _textEditingController4.text
                      //     }).then((value) => _textEditingController1.clear());
                      //     try {
                      //       UserCredential userCredential = await FirebaseAuth
                      //           .instance
                      //           .createUserWithEmailAndPassword(
                      //               email: email, password: password);
                      //       SC(BuildContext, context);
                      //       await Future.delayed(Duration(seconds: 4));
                      //       Navigator.pushNamed(context, '/');
                      //     } on FirebaseAuthException catch (e) {
                      //       if (e.code == 'weak-password') {
                      //         WP(BuildContext, context);
                      //         print('The password provided is too weak.');
                      //       } else if (e.code == 'email-already-in-use') {
                      //         EU(BuildContext, context);
                      //         print('The account already exists for that email.');
                      //       }
                      //     } catch (e) {
                      //       print(e);
                      //     }
                      //     // setState(() async {
                      //     //
                      //     // });
                      //   },
                      //   child: Container(
                      //     height: 50,
                      //     alignment: Alignment.center,
                      //     child: Text(
                      //       "Register",
                      //       style: TextStyle(
                      //           color: Colors.black,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 18),
                      //     ),
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         border: Border.all(color: Colors.black),
                      //         borderRadius: BorderRadius.circular(50)),
                      //   ),
                      // ),
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
    TextEditingController z) {
  return Container(
    height: 60,
    width: 380,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      // onChanged: (value) {
      //   String y = value;
      // },
      obscureText: x,
      controller: z,
      style: TextStyle(fontSize: 15),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please Enter some text";
        }
      },
      decoration: InputDecoration(
          border: InputBorder.none,
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

void SC(BuildContext, Context) {
  var alertDialog = AlertDialog(
    title: Text(
      "Nursery Added Succesfully",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
      ),
    ),
    content: Text("Password Will Send on Your Registered Email ID ",
        style: TextStyle(
          fontSize: 15,
        ),
        textAlign: TextAlign.center),
    // content: Text("Now you can Buy a product")
  );

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}
