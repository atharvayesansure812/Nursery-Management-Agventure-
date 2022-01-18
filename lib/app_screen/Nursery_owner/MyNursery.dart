import "package:flutter/material.dart";
import 'package:sanket/app_screen/Nursery_owner/MyNursery_body.dart';
import 'package:sanket/app_screen/Nursery_owner/User/ListView_N.dart';

class MyNursery extends StatefulWidget {
  String NurseryName;
  MyNursery({required this.NurseryName, Key? key}) : super(key: key);

  @override
  _MyNurseryState createState() => _MyNurseryState();
}

class _MyNurseryState extends State<MyNursery>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  var index;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 30,
          title: Text("${widget.NurseryName}"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          bottom: TabBar(isScrollable: true, controller: _controller, tabs: [
            Tab(text: "Air Plant"),
            Tab(text: "Indoor Plant"),
            Tab(text: "Avenue Tree"),
            Tab(text: "Aromatic Plant"),
            Tab(text: "Winter Plant")
          ]),
        ),
        body: TabBarView(controller: _controller, children: <Widget>[
          MyNursery_body(
            Category: "Air Plant",
            NurseryName: widget.NurseryName,
          ),
          MyNursery_body(
              Category: "Indoor Plant", NurseryName: widget.NurseryName),
          MyNursery_body(
              Category: "Avenue Tree", NurseryName: widget.NurseryName),
          MyNursery_body(
              Category: "Aromatic Plant", NurseryName: widget.NurseryName),
          MyNursery_body(
              Category: "Winter Plant", NurseryName: widget.NurseryName)
        ]));
  }
}
