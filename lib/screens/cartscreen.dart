import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/controller/cartcontroller.dart';
import 'package:ecommerce_app_flutter_firebase/controller/productControlller.dart';
import 'package:ecommerce_app_flutter_firebase/screens/checkout.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homescreen.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/single_card_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  // final double price;
  // final String name;
  // final String image;
  const CartScreen({ Key? key,
    // required this.name,
    // required this.image,
    // required this.price
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // int count = 1;

  // Widget _buildSingleCartProduct() {
  //   return 
  // }

  final CartController cartController = Get.put(CartController());
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart Page",
          style: TextStyle(
            color: kBackgroundColor
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomIconButton(
          onPress: (){
            Get.to( const HomeScreen());
          }, 
          icon: Icons.arrow_back
        ),
        actions: const [
          // CustomIconButton(onPress: (){}, icon: Icons.notifications_none)
        ],
      ),
      // body: ListView(
      //   children: [
      //     // _buildSingleCartProduct(),
      //     // _buildSingleCartProduct(),
      //     // _buildSingleCartProduct(),
      //     // _buildSingleCartProduct(),
      //     // _buildSingleCartProduct(),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: cartController.cartModelList.length,
        itemBuilder: (context, index) {
          return SingleCardProduct(
            isCount: false,
            name: cartController.getCartModelList[index].name, 
            image: cartController.getCartModelList[index].image, 
            price: cartController.getCartModelList[index].price, 
            quantity: cartController.getCartModelList[index].quantity.toInt()
          );
        }
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
            onPressed: (){
              productController.addNotification("Notification");
              Get.to( const CheckOut());
            }, 
            child: const Text("Continous",
              style: TextStyle(
                color: kTextColor,
                fontSize: 18
              ),
            )
          ),
        ),
      ),
    );
  }
}