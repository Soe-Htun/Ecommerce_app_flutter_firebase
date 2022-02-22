import 'package:ecommerce_app_flutter_firebase/controller/productControlller.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homescreen.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ListProduct extends StatelessWidget {

  // final String name;
  // final String? snapShot;
  ListProduct({ Key? key,
    // required this.name,
    // this.snapShot
  }) : super(key: key);

  final ProductController productController = Get.put(ProductController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text('Feature All', style: TextStyle(color: kBackgroundColor),),
        leading: CustomIconButton(
          onPress: () {
            Get.to(const HomeScreen());
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
                // Container(
                //   width: double.infinity,
                //   height: 40,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(name,
                //         style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                //       ),
                //       // Text("See all",
                //       //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                //       // )
                //     ],
                //   ),
                // ),
                const SizedBox(height: 20,),
                const Text("Featured",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20,),
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2/2.8,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7
                  ),
                  itemCount: productController.productList.length,
                  itemBuilder: (context, index) {
                    return SingleProduct(
                      name: productController.productList[index].name, 
                      image: productController.productList[index].image, 
                      price: double.parse(productController.productList[index].price.toString())
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