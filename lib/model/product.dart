import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  late String name;
  late String image;
  late double price;

  Product({
    required this.name,
    required this.image,
    required this.price
  });

  // Product.fromDocumentSnapshot({ required DocumentSnapshot documentSnapshot}) {
  //   name = documentSnapshot["name"];
  //   image = documentSnapshot["image"];
  //   price = documentSnapshot["price"];
  // }

  Product.fromMap(DocumentSnapshot data) {
    name = data["name"];
    image = data["image"];
    price = double.parse(data["price"].toString());
  }
}

