import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:sanket/app_screen/Nursery_owner/User/OrderList.dart';
import 'package:sanket/rough_screen/NurseryToPlant.dart';

class PlaceOrder extends StatefulWidget {
  final String name;
  final String img;
  final num price;
  final String NurseryName;

  const PlaceOrder({
    Key? key,
    required this.name,
    required this.img,
    required this.price,
    required this.NurseryName,
  }) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  CollectionReference users = FirebaseFirestore.instance.collection('User');
  FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("User");

  @override
  Widget build(BuildContext context) {
    num discount() {
      return widget.price - (widget.price * 20 / 100);
    }

    num Discount = widget.price * 20 / 100;
    num DeliveryCharges = 50;
    num Price = widget.price;
    num AmountPayable = widget.price - Discount + DeliveryCharges;
    var now = new DateTime.now();

    var DeliveryDate = now.add(new Duration(days: 6));
    final String OrderDate = "${now.day}/${now.month}/${now.year}";
    final String Delivery =
        "${DeliveryDate.day}/${DeliveryDate.month}/${DeliveryDate.year}";

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            padding: EdgeInsets.only(right: 1, left: 24),
            child: Text("Order Summery",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                )),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Container(
                child: Material(
              color: Colors.white,
              // elevation: 2.0,
              borderRadius: BorderRadius.circular(5),
              shadowColor: Colors.green,
              child: FutureBuilder<DocumentSnapshot>(
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            "${data["Name"]}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "${data["Address"]}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "${data["MObile No"]}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    );
                  }

                  return Center(child: Text("Thoda Ruk be"));
                },
              ),
            )),
            SizedBox(height: 10),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.green[500],
              onPressed: () {
                Navigator.pushNamed(context, "");
              },
              child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    "Change or Upadate Address",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
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
                            width: 90,
                            height: 100,
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
                                            fontWeight: FontWeight.bold)
                                        // style: CustomTextStyle.textFormFieldSemiBold
                                        //     .copyWith(fontSize: 14),
                                        ),
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
                                  Text("Delivery On :  ${Delivery}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
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
              height: 20,
            ),
            Container(
              child: Material(
                color: Colors.white,
                // elevation: 2.0,
                borderRadius: BorderRadius.circular(5),
                shadowColor: Colors.green,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Price Detail",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                              Text("+ ${Price}"),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.22),
            Container(
              child: Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Text(
                            "Total",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "₹ ${AmountPayable}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.28,
                    ),
                    InkWell(
                      onTap: () {
                        final id = collectionReference
                            .doc(_auth.currentUser!.uid)
                            .collection("OrderList")
                            .add({
                          "ProductName": widget.name,
                          "ProductPrice": AmountPayable,
                          "Image": widget.img,
                          "NurseryName": widget.NurseryName,
                          "DeliveryDate": Delivery,
                          "OrderDate": OrderDate
                        });

                        Fluttertoast.showToast(
                            msg: " Order successful ",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Navigator.pushNamed(context, "/Place_Order");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50)),
                        width: 170,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Place Order",
                            style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void Ordercomplete(BuildContext, Context) {
  var alertDialog = Container(
      child: Lottie.network(
          "https://assets3.lottiefiles.com/packages/lf20_gsigmrhp.json"));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}
