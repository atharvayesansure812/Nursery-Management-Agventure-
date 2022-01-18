import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanket/app_screen/Nursery_owner/User/PlaceOrder.dart';
import 'package:sanket/model/category.dart';

class Atharv extends StatefulWidget {
  const Atharv({Key? key}) : super(key: key);

  @override
  State<Atharv> createState() => _AtharvState();
}

class _AtharvState extends State<Atharv> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            padding: EdgeInsets.only(right: 1, left: 20),
            child: Text("Shopping Cart",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[
              SizedBox(height: 10),
              // createHeader(),
              createSubTitle(),
              SizedBox(height: 10),
              createCartList(),
              footer(context)
            ],
          );
        },
      ),
    );
  }

  final List cart = [
    "https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg",
    // "https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg",
    // "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Mango_4.jpg/580px-Mango_4.jpg",
    // "https://images.all-free-download.com/images/graphicthumb/eggplant_01_hq_pictures_168421.jpg",
    "https://st.depositphotos.com/1642482/2529/i/600/depositphotos_25296471-stock-photo-corn.jpg"
  ];
  List<String> cart_Name = [
    "Tomato",
    "Tomato",
    "Tomato",
    "Corn",
    "Mango",
    "Brinjal",
    "Corn"
  ];

  // createHeader() {
  //   return Container(
  //     alignment: Alignment.topCenter,
  //     child: Text(
  //       "SHOPPING CART",
  //       textAlign: TextAlign.center,
  //       style: CustomTextStyle.textFormFieldBold
  //           .copyWith(fontSize: 25, color: Colors.black),
  //     ),
  //     margin: EdgeInsets.only(left: 12, top: 12),
  //   );
  // }

  createSubTitle() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    FirebaseAuth _auth = FirebaseAuth.instance;
    return StreamBuilder<Object>(
        stream: db
            .collection("User")
            .doc(_auth.currentUser!.uid)
            .collection("CartList")
            .snapshots(),
        builder: (context, snapshot) {
          final Value = (snapshot.data as QuerySnapshot).docs;
          return Container(
            alignment: Alignment.topCenter,
            child: Text("Total ${Value.length} Items",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            margin: EdgeInsets.only(left: 12, top: 4),
          );
        });
  }

  createCartList() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    FirebaseAuth _auth = FirebaseAuth.instance;
    return StreamBuilder(
        stream: db
            .collection("User")
            .doc(_auth.currentUser!.uid)
            .collection("CartList")
            .snapshots(),
        builder: (context, snapshot) {
          final Value = (snapshot.data as QuerySnapshot).docs;
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, int position) {
              return createCartListItem(position, Value);
            },
            itemCount: Value.length,
          );
        });
  }

  Widget delet() {
    return Container(
      padding: EdgeInsets.only(right: 15),
      alignment: Alignment.centerRight,
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  ShowSnackBar(context, item, position) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("data")));
  }

  remove(position) {
    setState(() {
      cart.removeAt(position);
    });
  }

  createCartListItem(position, Value) {
    int number = 1;
    return Dismissible(
      key: Key(cart[position]),
      onDismissed: (direction) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('item dismissed')));

        // ShowSnackBar(context, item, position);
      },
      background: delet(),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlaceOrder(
                      name: Value[position]["ProductName"],
                      img: Value[position]["Image"],
                      NurseryName: Value[position]["NurseryName"],
                      price: Value[position]["ProductPrice"])));
        },
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
                    margin:
                        EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        color: Colors.blue.shade200,
                        image: DecorationImage(
                            image: NetworkImage(Value[position]["Image"]),
                            fit: BoxFit.fill)),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 8, top: 4),
                            child: Text(
                              Value[position]["ProductName"],
                              maxLines: 2,
                              softWrap: true,
                              style: CustomTextStyle.textFormFieldSemiBold
                                  .copyWith(fontSize: 14),
                            ),
                          ),
                          Utils.getSizedBox(height: 6),
                          Text(
                            Value[position]["NurseryName"],
                            style: CustomTextStyle.textFormFieldRegular
                                .copyWith(color: Colors.grey, fontSize: 14),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "₹" + "${Value[position]["ProductPrice"]}",
                                  style: CustomTextStyle.textFormFieldBlack
                                      .copyWith(color: Colors.green),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Theme.of(context).accentColor),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                number--;
                                              });
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 16,
                                            )),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 3),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3, vertical: 2),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: Colors.white),
                                          child: Text(
                                            '1',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                number++;
                                              });
                                              number = number++;
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 16,
                                            )),
                                      ],
                                    ),
                                  ),
                                )
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
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  remove(position);
                },
                child: Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10, top: 8),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Colors.green),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

footer(BuildContext context) {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  return StreamBuilder(
      stream: db
          .collection("User")
          .doc(_auth.currentUser!.uid)
          .collection("CartList")
          .snapshots(),
      builder: (context, snapshot) {
        final Value = (snapshot.data as QuerySnapshot).docs;
        num price = 0;
        for (var i = 0; i < Value.length; i++) {
          price = price + Value[i]["ProductPrice"];
        }

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      "Total",
                      style: CustomTextStyle.textFormFieldMedium
                          .copyWith(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Text(
                      "₹ ${price}",
                      style: CustomTextStyle.textFormFieldBlack.copyWith(
                          color: Colors.greenAccent.shade700, fontSize: 20),
                    ),
                  ),
                ],
              ),
              Utils.getSizedBox(height: 30),
              // RaisedButton(
              //   onPressed: () {
              //     // Navigator.push(
              //     //     context,
              //     //     new MaterialPageRoute(
              //     //         builder: (context) =>
              //     //             MyHomePage(title: 'Flutter Hello World')));
              //   },
              //   color: Colors.green,
              //   padding:
              //       EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(24))),
              //   child: Text(
              //     "Checkout",
              //     style: CustomTextStyle.textFormFieldSemiBold
              //         .copyWith(color: Colors.white),
              //   ),
              // ),
              Utils.getSizedBox(height: 8),
            ],
          ),
          margin: EdgeInsets.only(top: 16),
        );
      });
}

class Utils {
  static getSizedBox({double? width, double? height}) {
    return SizedBox(
      height: height,
      width: width,
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
