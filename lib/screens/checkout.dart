import 'package:ecommerce_app_flutter_firebase/controller/cartcontroller.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homescreen.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/notification_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/single_card_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'homepage.dart';

class CheckOut extends StatefulWidget {
  final double? price;
  final String? name;
  final String? image;
  const CheckOut({ Key? key,
    this.price,
    this.name,
    this.image
  }) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  final CartController cartController = Get.put(CartController());

  Widget _buildBottomDetail({String? startName, String? endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          startName!,
          style: const TextStyle(
            fontSize: 18
          ),
        ),
        Text(
          endName!,
          style: const TextStyle(
            fontSize: 18
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    double subTotal = 0;
    double discount = 3;
    double discountRupees;
    double shipping = 60;
    double total;
    // cartController.getCheckoutModelList.forEach((element) {
        // subTotal += element.price * element.quantity ;
    // });
    discountRupees = discount / 100 * subTotal;
    total = subTotal + shipping - discountRupees;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "CheckOut Page",
          style: TextStyle(
            color: kBackgroundColor
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomIconButton(
          onPress: (){
            Get.to( HomeScreen());
          }, 
          icon: Icons.arrow_back
        ),
        actions: [
          NotificationButton()
        ],
      ),

      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartModelList.length, // getCheckOutModelList.length
                itemBuilder: (context, index) {
                  return SingleCardProduct(
                    name: cartController.getCartModelList[index].name, // getCheckOutModelList[index].name
                    image: cartController.getCartModelList[index].image, 
                    price: cartController.getCartModelList[index].price, 
                    quantity: cartController.getCartModelList[index].quantity.toInt()
                  );
                }
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  _buildBottomDetail(
                    startName: "Subtotal",
                    endName: "\$ ${subTotal.toStringAsFixed(2)}"
                  ),
                  _buildBottomDetail(
                    startName: "Discount",
                    endName: "${total.toStringAsFixed(2)} %"
                  ),
                  _buildBottomDetail(
                    startName: "Shipping",
                    endName: "\$ ${shipping.toStringAsFixed(2)}"
                  ),
                  _buildBottomDetail(
                    startName: "Total",
                    endName: "\$ ${total.toStringAsFixed(2)}"
                  )
                ],
              ),
            )
          ],
        ),
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
              Get.to(HomeScreen());
            }, 
            child: const Text("Buy",
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