import 'package:ecommerce_app_flutter_firebase/screens/detailscreen.dart';
import 'package:ecommerce_app_flutter_firebase/ProductList/listproduct.dart';
import 'package:ecommerce_app_flutter_firebase/ProductList/newAchiveList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'singleproduct.dart';
import 'dart:core';

class NewAchives extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  final String name2;
  final String image2;
  final double price2; 
  const NewAchives({ Key? key,
    required this.name,
    required this.image,
    required this.price,
    required this.name2,
    required this.image2,
    required this.price2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("New Achives",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Get.to( NewAchiveList());
                },
                child: const Text("View more",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              )
            ]
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Get.to(
                   DetailScreen(
                    image: image , 
                    name: name, 
                    price: price
                  )
                );
              },
              child: SingleProduct(
                name: name, 
                image: image, 
                price: price
              ),
            ),

            GestureDetector(
              onTap: (){
                Get.to(
                   DetailScreen(
                    image: image2 , 
                    name: name2, 
                    price: price2
                  )
                );
              },
              child: SingleProduct(
                name: name2, 
                image: image2, 
                price: price2
              ),
            ),
          ],
        ),
      ],
    );
  }
}