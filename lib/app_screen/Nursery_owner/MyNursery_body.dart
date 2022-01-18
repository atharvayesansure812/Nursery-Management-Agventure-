import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'User/Cart.dart';

class MyNursery_body extends StatefulWidget {
  String Category;
  String NurseryName;
  MyNursery_body({required this.Category, required this.NurseryName, Key? key})
      : super(key: key);

  @override
  _MyNursery_bodyState createState() => _MyNursery_bodyState();
}

class _MyNursery_bodyState extends State<MyNursery_body> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: db
            .collection('Sanket')
            .doc(widget.NurseryName)
            .collection("${widget.Category}")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          final Value = (snapshot.data! as QuerySnapshot).docs;
          return FadeInDown(
            delay: Duration(milliseconds: 800),
            child: Value.length > 0
                ? ListView.builder(
                    itemCount: Value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(left: 16, right: 16, top: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 8, left: 8, top: 8, bottom: 8),
                                  width: 92,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              Value[index]["ProductImage"]),
                                          fit: BoxFit.fill)),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                            right: 8,
                                          ),
                                          child: Text(
                                            Value[index]["ProductName"],
                                            maxLines: 2,
                                            softWrap: true,
                                            style: CustomTextStyle
                                                .textFormFieldSemiBold
                                                .copyWith(fontSize: 20),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Text(
                                            "₹" +
                                                "${Value[index]["productprice"]}",
                                            style: CustomTextStyle
                                                .textFormFieldBlack
                                                .copyWith(color: Colors.green),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  flex: 100,
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    })
                : Center(
                    child: Text(
                      "Data Not Available",
                      style: TextStyle(fontSize: 25, color: Colors.green),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class CustomTextStyle {
  static var textFormFieldRegular = TextStyle(
      fontSize: 16,
      fontFamily: "Helvetica",
      color: Colors.black,
      fontWeight: FontWeight.w400);

  static var textFormFieldLight =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w200);

  static var textFormFieldMedium =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w500);

  static var textFormFieldSemiBold =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w600);

  static var textFormFieldBold =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w700);

  static var textFormFieldBlack =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w900);
}
