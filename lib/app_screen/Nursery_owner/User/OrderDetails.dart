import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanket/app_screen/Nursery_owner/User/Cart.dart';

import '../MyNursery_body.dart';

class OrderDetail extends StatefulWidget {
  final String name;
  final String img;
  final num price;
  final String NurseryName;
  final String OrderedDate;
  final String DeliveryDate;

  OrderDetail(
      {Key? key,
      required this.DeliveryDate,
      required this.OrderedDate,
      required this.NurseryName,
      required this.img,
      required this.name,
      required this.price})
      : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  CollectionReference users = FirebaseFirestore.instance.collection('User');
  FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("User");
  String getRandomString(int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (_) => _chars.codeUnitAt(
            _rnd.nextInt(_chars.length),
          ),
        ),
      );
  num discount() {
    return widget.price - (widget.price * 20 / 100);
  }

  @override
  Widget build(BuildContext context) {
    num Discount = widget.price * 20 / 100;
    num DeliveryCharges = 50;
    num Price = widget.price;
    num AmountPayable = widget.price - Discount + DeliveryCharges;
    print(getRandomString(12));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          child: Text("Order Details",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Order ID : Agventure${getRandomString(12)}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Material(
              color: Colors.white,
              // elevation: 2.0,
              borderRadius: BorderRadius.circular(5),
              shadowColor: Colors.green,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              right: 1, left: 1, top: 8, bottom: 8),
                          width: 125,
                          height: 135,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              color: Colors.blue.shade200,
                              image: DecorationImage(
                                  image: NetworkImage(widget.img),
                                  fit: BoxFit.cover)),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 8, top: 4),
                                  child: Text(widget.name,
                                      maxLines: 2,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 6),
                                Text(widget.NurseryName,
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                SizedBox(height: 2),
                                Container(
                                  child: Text("₹ ${widget.price}",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ),
                                SizedBox(height: 4),
                              ],
                            ),
                          ),
                          flex: 100,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Shipping Details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                FutureBuilder<DocumentSnapshot>(
                  future: users.doc(_auth.currentUser!.uid).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return Text("Document does not exist");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${data["Name"]}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${data["Address"]}",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${data["MObile No"]}",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      );
                    }

                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Material(
              color: Colors.white,
              // elevation: 2.0,
              borderRadius: BorderRadius.circular(5),
              shadowColor: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Price Details",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text("Price",
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.6558,
                              ),
                              Text("+ ${widget.price}"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text("Discount",
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.58,
                              ),
                              Text("- ${Discount}"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text("Delivery Charges",
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.448,
                              ),
                              Text("+ ${DeliveryCharges}"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text("Amount Payable",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.448,
                              ),
                              Text("+ ${AmountPayable}"),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          // Container(
          //   child: StreamBuilder(
          //     stream: db
          //         .collection('User')
          //         .doc(_auth.currentUser!.uid)
          //         .collection("OrderList")
          //         .snapshots(),
          //     builder: (context, snapshot) {
          //       if (!snapshot.hasData)
          //         return Center(child: CircularProgressIndicator());
          //       final Value = (snapshot.data! as QuerySnapshot).docs;

          //       return ListView.builder(
          //         itemCount: Value.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Container(
          //             padding: EdgeInsets.all(8.0),
          //             alignment: Alignment.topLeft,
          //             child: Text(
          //               "Delivery Date : ${Value[index]["OrderDate"]}",
          //               style: TextStyle(
          //                   fontSize: 18, fontWeight: FontWeight.bold),
          //             ),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.topLeft,
            child: Text("Delivery Date : ${widget.DeliveryDate}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
//  Container(
          //       child: Material(
          //     color: Colors.white,
          //     // elevation: 2.0,
          //     borderRadius: BorderRadius.circular(5),
          //     shadowColor: Colors.green,
          //     child: FutureBuilder<DocumentSnapshot>(
          //       future: users.doc(_auth.currentUser!.uid).get(),
          //       builder: (BuildContext context,
          //           AsyncSnapshot<DocumentSnapshot> snapshot) {
          //         if (snapshot.hasError) {
          //           return Text("Something went wrong");
          //         }

          //         if (snapshot.hasData && !snapshot.data!.exists) {
          //           return Text("Document does not exist");
          //         }

          //         if (snapshot.connectionState == ConnectionState.done) {
          //           Map<String, dynamic> data =
          //               snapshot.data!.data() as Map<String, dynamic>;
          //           return Column(
          //             children: [
          //               Text(
          //                 "${data["Name"]}",
          //                 textAlign: TextAlign.left,
          //                 style: TextStyle(
          //                   fontSize: 15,
          //                 ),
          //               ),
          //               SizedBox(height: 5),
          //               Text(
          //                 "${data["Address"]}",
          //                 style: TextStyle(fontSize: 15),
          //               ),
          //               SizedBox(height: 5),
          //               Text(
          //                 "${data["MObile No"]}",
          //                 style: TextStyle(fontSize: 15),
          //               ),
          //             ],
          //           );
          //         }

          //         return Center(child: Text("Thoda Ruk be"));
          //       },
          //     ),
          //   )),
          //   SizedBox(height: 10),
          //   FlatButton(
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10)),
          //     color: Colors.green[500],
          //     onPressed: () {
          //       Navigator.pushNamed(context, "");
          //     },
          //     child: Container(
          //       height: 50,
          //       child: Center(
          //         child: Text(
          //           "Change or Upadate Address",
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 15,
          //               fontWeight: FontWeight.w600),
          //         ),
          //       ),
          //     ),
          //   ),
          //   SizedBox(height: 10),