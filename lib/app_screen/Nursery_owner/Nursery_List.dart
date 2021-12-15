import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sanket/model/category.dart';

class O_Nursery_List extends StatefulWidget {
  @override
  State<O_Nursery_List> createState() => _O_Nursery_ListState();
}

class _O_Nursery_ListState extends State<O_Nursery_List> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            padding: EdgeInsets.only(right: 8, left: 3),
            child: Text("Select Your Nursery",
                style: TextStyle(
                  fontSize: 20,
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

          GridView.builder(
              itemCount: 6,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                    });
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
                        Nursery_Name[index],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )))),
                );
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
