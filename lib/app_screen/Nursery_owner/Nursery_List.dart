import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sanket/app_screen/Nursery_owner/MyNursery.dart';
import 'package:sanket/model/category.dart';

class O_Nursery_List extends StatefulWidget {
  @override
  State<O_Nursery_List> createState() => _O_Nursery_ListState();
}

class _O_Nursery_ListState extends State<O_Nursery_List> {
  int selected = -1;
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            padding: EdgeInsets.only(right: 8, left: 3),
            child: Text("Select Your Nursery",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      body:
          // SizedBox(
          //   height: 30,
          // ),
          // Lottie.network(
          //     "https://assets8.lottiefiles.com/packages/lf20_ge6ykru0.json"),

          StreamBuilder(
              stream: db.collection('Sanket').snapshots(),
              builder: (context, snapshot) {
                final Value = (snapshot.data! as QuerySnapshot).docs;
                return GridView.builder(
                    itemCount: Value.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 0),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyNursery(
                                      NurseryName: Value[index]["NurseryName "],
                                    )),
                          );
                        },
                        child: Card(
                            margin: EdgeInsets.all(10),
                            shape: selected == index
                                ? RoundedRectangleBorder(
                                    side: new BorderSide(
                                        color: Colors.green, width: 3.0),
                                    borderRadius: BorderRadius.circular(40))
                                : RoundedRectangleBorder(
                                    side: new BorderSide(
                                        color: Colors.white, width: 3.0),
                                    borderRadius: BorderRadius.circular(40)),
                            elevation: 20,
                            shadowColor: Colors.green,
                            child: GridTile(
                                // header: Center(
                                //   child: Text(
                                //     "Blossom Valley",
                                //     style: TextStyle(
                                //         fontSize: 28, fontWeight: FontWeight.bold),
                                //   ),
                                // ),
                                child: Center(
                                    child: Text(
                              Value[index]["NurseryName "],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )))),
                      );
                    });
              }),
    );
  }
}

Widget Nursery() {
  return ListView.builder(itemBuilder: (BuildContext Context, int index) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 40,
        shadowColor: Colors.green,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 100,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("xyz",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "chh",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  });
}
