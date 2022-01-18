import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sanket/model/category.dart';

class slider extends StatelessWidget {
  // const slider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: Carousel.length,
      options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 0.97,
          initialPage: 0,
          enlargeCenterPage: true ,
          ),
      itemBuilder: (BuildContext context, int Index, int page) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 40,
              shadowColor: Colors.green,
              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                      image: NetworkImage(Carousel[Index].Images),
                      fit: BoxFit.cover),
                ),
              )),
        );
        // return Container(
        //   child: Stack(children: [

        //     Container(
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20),
        //         color: Colors.black54.withOpacity(0.3),
        //       ),
        //       width: double.infinity,
        //       height: double.infinity,
        //       child: Text(
        //         Carousel[Index].Text,
        //         style: TextStyle(fontSize: 30, color: Colors.white),
        //       ),
        //     ),
        //   ]),
        // );
      },
    );
  }
}
