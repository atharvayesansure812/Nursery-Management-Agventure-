import 'package:flutter/material.dart';
import 'package:sanket/app_screen/Nursery_owner/User/Search_Appbar.dart';
import 'package:sanket/app_screen/Nursery_owner/User/drawer.dart';
import 'package:sanket/app_screen/Nursery_owner/User/ListView_N.dart';
import 'package:sanket/model/category.dart';

class home_Nursery extends StatefulWidget {
  const home_Nursery({Key? key}) : super(key: key);

  @override
  _home_NurseryState createState() => _home_NurseryState();
}

class _home_NurseryState extends State<home_Nursery>
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
          title: Center(child: Text("Grab your products")),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          bottom: TabBar(isScrollable: true, controller: _controller, tabs: [
            Tab(text: "Blossom Valley "),
            Tab(text: "Tanuja Hightech"),
            Tab(text: "Evergreen"),
            Tab(text: "Paradise Nursery"),
            Tab(text: "Garden Gate")
          ]),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: TabBarView(controller: _controller, children: <Widget>[
          homescreen(Nurseryname: "Blossom Valley"),
          homescreen(Nurseryname: "Tanuja Hightech"),
          homescreen(Nurseryname: "Evergreen"),
          homescreen(Nurseryname: "Paradise Nursery"),
          homescreen(Nurseryname: "Garden Gate")
        ]));
  }
}
