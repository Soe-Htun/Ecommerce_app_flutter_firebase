import 'package:ecommerce_app_flutter_firebase/controller/productControlller.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homepage.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homescreen.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class NewAchiveList extends StatelessWidget {

  // final String name;
  // final String? snapShot;
  NewAchiveList({ Key? key,
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
        title: const Text('Archive List', style: TextStyle(color: kBackgroundColor)),
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
                const Text("New Archieve",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20,),
                Container(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2/2.8,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7
                    ),
                    itemCount: productController.achiveList.length,
                    itemBuilder: (context, index) {
                      return SingleProduct(
                        name: productController.achiveList[index].name, 
                        image: productController.achiveList[index].image, 
                        price: double.parse(productController.achiveList[index].price.toString())
                      );
                     // return Text(Get.arguments['postData'].data.docs.length);
                    },
                    
                  ),
                ),
                const SizedBox(height: 30,),

                // Text(Get.arguments['Data'])
              ],
            ),
          )
      ),
    );
  }
}