import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:sanket/app_screen/Nursery_owner/User/Search_Appbar.dart';
import 'package:sanket/app_screen/Nursery_owner/User/plants_detail.dart';
import 'package:animate_do/animate_do.dart';
import 'package:sanket/app_screen/Nursery_owner/User/productspage.dart';
import 'package:sanket/app_screen/Nursery_owner/User/slider.dart';
import 'package:sanket/model/productslider.dart';
import '../../../model/category.dart';

class homescreen extends StatelessWidget {
  String Nurseryname;
  homescreen({Key? key, required this.Nurseryname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 10),
        slider(),
        SizedBox(height: 10),
        Text(
          "Categories",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(child: product(Nurseryname))
      ],
    ));
  }
}

Widget product(String Nurseryname) {
  return ListView.builder(
      itemCount: categoryp.length,
      itemBuilder: (BuildContext context, int index) {
        return FadeInDown(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => productpage(
                        Title: '${categoryp[index].name}',
                        Namenursery: Nurseryname,
                      )));
            },
            child: Expanded(
              child: Card(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 40,
                shadowColor: Colors.green,
                child: Container(
                  padding: EdgeInsets.all(30),
                  height: 100,
                  width: double.infinity,
                  child: Center(
                    child: Text(categoryp[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
