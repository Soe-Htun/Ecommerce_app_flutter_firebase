import 'package:ecommerce_app_flutter_firebase/controller/productControlller.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homepage.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homescreen.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class Shoes extends StatelessWidget {
  Shoes({ Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CustomIconButton(
          onPress: () {
            Get.to(HomeScreen());
          },
          icon: Icons.arrow_back
        ),
        actions: [
          CustomIconButton(onPress: (){}, icon: Icons.notifications_none),
          CustomIconButton(onPress: (){}, icon: Icons.send)
        ],
      ),

      body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                const Text("Shoes",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20,),
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2/2.8,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7
                  ),
                  itemCount: productController.shoeList.length,
                  itemBuilder: (context, index) {
                    return SingleProduct(
                      name: productController.shoeList[index].name, 
                      image: productController.shoeList[index].image, 
                      price: double.parse(productController.shoeList[index].price.toString())
                    );
                   // return Text(Get.arguments['postData'].data.docs.length);
                  },
                  
                ),
                const SizedBox(height: 30,),
              ],
            ),
          )
      ),
    );
  }
}