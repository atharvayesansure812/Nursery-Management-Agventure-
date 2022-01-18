import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dropdownfield/dropdownfield.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sanket/model/product_add_model.dart';
import 'package:sanket/model/category.dart';

class Add_Producct extends StatefulWidget {
  const Add_Producct({Key? key}) : super(key: key);

  @override
  State<Add_Producct> createState() => _Add_ProducctState();
}

class _Add_ProducctState extends State<Add_Producct> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Sanket");
  List<String> Nursary = [
    'Blossom Valley',
    'Evergreen',
    'Paradise',
    'Garden Gate',
    'Tanuja Hightech'
  ]; // Option 2
  var SelectedNursery;
  List<Categoryp> categoryp = [
    Categoryp(name: "Air Plants"),
    Categoryp(name: "Indoor Plants"),
    Categoryp(name: "Avenue Trees"),
    Categoryp(name: "Aromatic Plants"),
    Categoryp(name: "Winter Plant"),
  ];
  List<String> Category = [
    "Air Plant",
    "Indoor Plant",
    "Avenue Tree",
    "Aromatic Plant",
    "Winter Plant"
  ]; // Option 2
  var SelectedCategory; // Option 2
  @override
  Widget build(BuildContext context) {
    TextEditingController _productName = TextEditingController();
    TextEditingController _productImage = TextEditingController();
    TextEditingController _NurseryName = TextEditingController();
    TextEditingController _productPrice = TextEditingController();
    TextEditingController _ProductDetail = TextEditingController();
    TextEditingController _productCategory = TextEditingController();
    bool issale = false;

    final _key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            padding: EdgeInsets.only(right: 1, left: 0),
            child: Text("Add Products",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                )),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Form(
              child: Column(
            children: [
              Container(
                height: 70,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton(
                  hint: Text("Select your Nursery ",
                      style: TextStyle(fontSize: 18)),
                  value: SelectedNursery,
                  dropdownColor: Colors.white,
                  elevation: 20,
                  isExpanded: true,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  icon: Icon(
                    Icons.arrow_drop_down_circle_sharp,
                    size: 30,
                  ),
                  onChanged: (newValueSelected) {
                    setState(() {
                      SelectedNursery = newValueSelected;
                    });
                  },
                  items: Nursary.map((dropDownStringItem) {
                    return DropdownMenuItem(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton(
                  hint: Text("Select Product Category ",
                      style: TextStyle(fontSize: 18)),
                  value: SelectedCategory,
                  dropdownColor: Colors.white,
                  elevation: 20,
                  isExpanded: true,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  icon: Icon(
                    Icons.arrow_drop_down_circle_sharp,
                    size: 30,
                  ),
                  onChanged: (newValueSelected) {
                    setState(() {
                      SelectedCategory = newValueSelected;
                    });
                  },
                  items: Category.map((dropDownStringItem) {
                    return DropdownMenuItem(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 20,
              ),
              data(" ProductName", "Enter ProductName", false, _productName),
              SizedBox(
                height: 20,
              ),
              data(
                "Image",
                "Enter product Network Image",
                false,
                _productImage,
              ),
              SizedBox(
                height: 20,
              ),
              data(
                  " ProductPrice", "Enter Product Price", false, _productPrice),
              SizedBox(
                height: 20,
              ),
              data(" ProductDetail", "Enter deatail description of product",
                  false, _ProductDetail),
              SizedBox(
                height: 20,
              ),
              SwitchListTile(
                  contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
                  title: Text(
                    "Is product on sale ?",
                    style: TextStyle(fontSize: 18),
                  ),
                  value: issale,
                  onChanged: (v) {
                    issale = v;
                  }),
              SizedBox(
                height: 50,
              ),
              Container(
                  color: Colors.green,
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        collectionReference
                            .doc(SelectedNursery)
                            .collection(SelectedCategory)
                            .add({
                          "ProductName": _productName.text,
                          "ProductImage": _productImage.text,
                          "productprice": int.parse(_productPrice.text),
                          "discription": _ProductDetail.text,
                        });
                        SAP(BuildContext, context);
                      },
                      child: Text("Upload Product"))),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/O_Nursery_List');
                    },
                    icon: Icon(
                      Icons.skip_next_sharp,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Next',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class _ProductName {}

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

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

Widget data(
  String labelText,
  String hintText,
  bool x,
  TextEditingController z,
) {
  return Container(
    height: 60,
    width: double.infinity,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextFormField(
      controller: z,
      style: TextStyle(fontSize: 15),
      validator: (value) {
        if (value!.isEmpty) {
          return "please Enter some text";
        }
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black, fontSize: 18),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.amber, width: 2)),
          // prefixIcon: myicon,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
    ),
  );
}
