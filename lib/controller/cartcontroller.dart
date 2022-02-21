import 'package:ecommerce_app_flutter_firebase/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> cartModelList = [];
  late CartModel cartModel;

  void getCartData({
    required String name,
    required String image,
    required double quantity,
    required double price    
  }) {
    cartModel = CartModel(
      name: name, 
      image: image, 
      price: price, 
      quantity: quantity
    );

    cartModelList.add(cartModel);
  }

  List<CartModel> get getCartModelList {
    return List.from(cartModelList);
  }

  //  get getCardModelListLength async {
  //   return cartModelList.length;
  // }
}