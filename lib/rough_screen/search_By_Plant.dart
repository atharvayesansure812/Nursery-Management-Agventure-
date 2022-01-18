import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PLANTS'),
      ),
      body: Container(
        child: Products(),
      ),
    );
  }
}

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final list_item = [
    {
      "name": "AGRICULTURAL CROPS",
      "pic": "assets/images/agricultural crops.jpg"
    },
    {"name": "FLOWERING PLANTS", "pic": "assets/images/flowering plants.jpg"},
    {"name": "FRUIT PLANTS", "pic": "assets/images/fruit plants.jpg"},
    {"name": "MEDICINAL PLANTS", "pic": "assets/images/medicinal-plants.jpg"},
    {"name": "ORNAMENTAL PLANTS", "pic": "assets/images/ornamental plants.jpg"},
    {"name": "VEGETABLE PLANTS", "pic": "assets/images/vegetable plants.jpeg"},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list_item.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Product(
          product_name: list_item[index]['name'],
          product_pic: list_item[index]['pic'],
        );
      },
    );
  }
}

class Product extends StatelessWidget {
  final product_name;
  final product_pic;

  Product({this.product_name, this.product_pic});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
              footer: Container(
                color: Colors.black12,
                child: ListTile(
                  leading: Text(
                    product_name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              child: Image.asset(
                product_pic,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
