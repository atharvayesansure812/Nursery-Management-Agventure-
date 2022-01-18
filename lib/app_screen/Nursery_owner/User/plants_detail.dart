import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sanket/app_screen/Nursery_owner/User/PlaceOrder.dart';
import 'package:sanket/theme/color.dart';
import 'package:sanket/model/productslider.dart';
import 'package:flutter/material.dart';
import 'package:sanket/app_screen/Nursery_owner/User/utils.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String img;
  final int price;
  final String Des;
  final NurseryName;
  // final List<String> MulImage;
  const ProductDetailPage({
    Key? key,
    // required this.MulImage,
    required this.name,
    required this.img,
    required this.price,
    required this.Des,
    required this.NurseryName,
  }) : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("User");

  FirebaseAuth _auth = FirebaseAuth.instance;
  int activeSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 15,
            // ),
            // FadeInDownBig(
            //   child: Text(
            //     "${widget.NurseryName} ",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: black.withOpacity(0.1),
                  spreadRadius: 1,
                )
              ], borderRadius: BorderRadius.circular(30), color: grey),
              child: SafeArea(
                child: Stack(
                  children: <Widget>[
                    FadeInDownBig(
                        child: Image(image: NetworkImage(widget.img))),
                    SafeArea(
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // SizedBox(
            //   height: 30,
            // ),
            FadeInDownBig(
              delay: Duration(milliseconds: 350),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 35, fontWeight: FontWeight.w600, height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FadeInDownBig(
              delay: Duration(milliseconds: 400),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  "₹ " + "${widget.price}",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FadeInDownBig(
                      delay: Duration(milliseconds: 450),
                      child: Text(
                        "Description",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeInDownBig(
                      delay: Duration(milliseconds: 450),
                      child: Text(
                        widget.Des,
                        style: TextStyle(
                            fontSize: 15, color: black.withOpacity(0.7)),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 25,
            ),

            FadeInDownBig(
              delay: Duration(milliseconds: 550),
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                color: black.withOpacity(0.1))
                          ],
                          color: grey),
                      child: InkWell(
                        onTap: () {
                          collectionReference
                              .doc(_auth.currentUser!.uid)
                              .collection("CartList")
                              .add({
                            "ProductName": widget.name,
                            "ProductPrice": widget.price,
                            "Discription ": widget.Des,
                            "Image": widget.img,
                            "NurseryName": widget.NurseryName,
                          });

                          Navigator.pushNamed(context, "/Cart");
                        },
                        child: Center(
                          child: Icon(Icons.add_shopping_cart),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.lightGreen,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlaceOrder(
                                    name: widget.name,
                                    img: widget.img,
                                    NurseryName: widget.NurseryName,
                                    price: widget.price)),
                          );
                        },
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                  color: white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}

void SAP(BuildContext, Context) {
  var alertDialog = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Container(
        child: AlertDialog(
          title: Text(
            'Product Added',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Succesfully",
            textAlign: TextAlign.center,
          ),
        ),
      ));
}
