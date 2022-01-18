import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sanket/app_screen/Nursery_owner/User/Cart.dart';
import 'package:sanket/app_screen/Nursery_owner/User/OrderDetails.dart';
import 'package:sanket/model/category.dart';

class Order extends StatefulWidget {
  Order({
    Key? key,
  }) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          padding: EdgeInsets.only(right: 1, left: 108),
          child: Text("My Orders",
              textAlign: TextAlign.center,
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
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: db
            .collection('User')
            .doc(_auth.currentUser!.uid)
            .collection("OrderList")
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderDetail(
                                    img: Value[index]["Image"],
                                    name: Value[index]["ProductName"],
                                    NurseryName: Value[index]["NurseryName"],
                                    price: Value[index]["ProductPrice"],
                                    DeliveryDate: Value[index]["DeliveryDate"],
                                    OrderedDate: '',
                                  ),
                                ),
                              );
                            },
                            child: Container(
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
                                    width: 110,
                                    height: 115,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14)),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                Value[index]["Image"]),
                                            fit: BoxFit.fill)),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              padding: EdgeInsets.only(
                                                  right: 8, top: 4),
                                              child: Value[index]
                                                          ["DeliveryDate"] !=
                                                      DateTime.now()
                                                  ? Text(
                                                      "Delivery On ${Value[index]["DeliveryDate"]}",
                                                      maxLines: 2,
                                                      softWrap: true,
                                                      style: CustomTextStyle
                                                          .textFormFieldSemiBold
                                                          .copyWith(
                                                              fontSize: 14),
                                                    )
                                                  : Text(
                                                      "Delivered On ${Value[index]["DeliveryDate"]}",
                                                      maxLines: 2,
                                                      softWrap: true,
                                                      style: CustomTextStyle
                                                          .textFormFieldSemiBold
                                                          .copyWith(
                                                              fontSize: 18),
                                                    )),
                                          Utils.getSizedBox(height: 6),
                                          Container(
                                            padding: EdgeInsets.only(
                                                right: 8, top: 4),
                                            child: Text(
                                              Value[index]["ProductName"],
                                              maxLines: 2,
                                              softWrap: true,
                                              style: CustomTextStyle
                                                  .textFormFieldSemiBold
                                                  .copyWith(fontSize: 14),
                                            ),
                                          ),
                                          Utils.getSizedBox(height: 6),
                                          Text(
                                            Value[index]["NurseryName"],
                                            style: CustomTextStyle
                                                .textFormFieldRegular
                                                .copyWith(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "₹" +
                                                      "${Value[index]["ProductPrice"]}",
                                                  style: CustomTextStyle
                                                      .textFormFieldBlack
                                                      .copyWith(
                                                          color: Colors.green),
                                                ),
                                              ],
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
