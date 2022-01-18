import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:sanket/app_screen/Nursery_owner/User/Cart.dart';
import 'package:sanket/app_screen/Nursery_owner/User/plants_detail.dart';
import 'package:sanket/model/category.dart';

class productpage extends StatelessWidget {
  String Title;
  String Namenursery;
  productpage({Key? key, required this.Title, required this.Namenursery})
      : super(key: key);
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        title: Center(child: Text(Title)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      body: StreamBuilder(
        stream: db
            .collection('Sanket')
            .doc(Namenursery)
            .collection(Title)
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
                                    builder: (context) => ProductDetailPage(
                                          name: Value[index]["ProductName"],
                                          img: Value[index]["ProductImage"],
                                          price: Value[index]["productprice"],
                                          Des: Value[index]["discription"],
                                          NurseryName: Namenursery,
                                        )),
                              );
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 16, right: 16, top: 16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  )),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: 8, left: 8, top: 8, bottom: 8),
                                    width: 110,
                                    height: 115,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.white, width: 3),
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                Value[index]["ProductImage"]),
                                            fit: BoxFit.fill)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
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
                                                  .copyWith(fontSize: 20),
                                            ),
                                          ),
                                          Utils.getSizedBox(height: 6),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "₹" +
                                                      "${Value[index]["productprice"]}",
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
