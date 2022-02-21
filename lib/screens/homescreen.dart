import 'package:ecommerce_app_flutter_firebase/CategoryList/dress.dart';
import 'package:ecommerce_app_flutter_firebase/CategoryList/pant.dart';
import 'package:ecommerce_app_flutter_firebase/CategoryList/shirt.dart';
import 'package:ecommerce_app_flutter_firebase/CategoryList/shoes.dart';
import 'package:ecommerce_app_flutter_firebase/CategoryList/tie.dart';
import 'package:ecommerce_app_flutter_firebase/controller/productControlller.dart';
import 'package:ecommerce_app_flutter_firebase/screens/welcomescreen.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/featureList.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/newAchives.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductController productController = Get.put(ProductController());

  List<String> images= [
    "assets/images/shoes.png",
    "assets/images/shirt.png",
    "assets/images/video_camera.png",
  ];

  // Widget _buildBothFeaOrNewProduct() {
  bool homeColor = true;

  bool cartColor = false;

  bool abloutColor = false;

  bool contactsColor = false;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget _buildCategoryProduct({String? image, int? color}) {
    return CircleAvatar(
      maxRadius: 33,
      backgroundColor: Color(color!),
      child: Container(
        height: 35,
        child: Image(
          image: AssetImage("assets/images/$image")
        ),
      ),
    );
  }

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Soe"), 
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/user.png"),
              backgroundColor: Colors.white,
            ),
            accountEmail: Text("soe@gmail.com")
          ),

          ListTile(
            selected: homeColor,
            onTap: (){
              setState(() {
                homeColor = true;
                contactsColor = false;
                cartColor = false;
                abloutColor = false;
              });
            },
            leading: const Icon(Icons.home),
            title: const Text("Home"),
          ),
          ListTile(
            selected: cartColor,
            onTap: (){
              setState(() {
                cartColor = true;
                homeColor = false;
                contactsColor = false;
                abloutColor = false;
              });
            },
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Cart"),
          ),
          ListTile(
            selected: abloutColor,
            onTap: (){
              setState(() {
                abloutColor = true;
                homeColor = false;
                contactsColor = false;
                cartColor = false;
              });
            },
            leading: const Icon(Icons.info),
            title: const Text("About"),
          ),
          ListTile(
            selected: contactsColor,
            onTap: (){
              setState(() {
                contactsColor = true;
                homeColor = false;
                abloutColor = false;
                cartColor = false;
              });
            },
            leading: const Icon(Icons.phone),
            title: const Text("Contact Us"),
          ),
          ListTile(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: 220,
      child: CarouselSlider(
        items: [
          for(var i= 0; i< images.length; i++)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[i])
                )
              ),
            )
        ],
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2,
          initialPage: 2,
          
        )
      ),
    );
  }

  Widget _buildCategory() {
    return Column(
      children: [
        Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                 Text("Categories",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                // GestureDetector(
                //   onTap: (){
                //     // Get.to(const ListProduct(name: 'Categories', snapShot: ,));
                //   },
                //   child: const Text("View more",
                //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                //   ),
                // )
              ]
            ),
          ),
          Container(
            height: 60,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(Dress());
                  },
                  child: _buildCategoryProduct(
                    image: "dress.png", 
                    color: 0xff33dcfd
                  )
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Shirt());
                  },
                  child: _buildCategoryProduct(
                    image: "shirt.png", 
                    color: 0xfff38cdd
                    )
                  ),
                GestureDetector(
                  onTap: () {
                    Get.to(Shoes());
                  },
                  child: _buildCategoryProduct(
                    image: "shoes.png", 
                    color: 0xff4ff2af
                    )
                  ),
                GestureDetector(
                  onTap: () {
                    Get.to(Pant());
                  },
                  child: _buildCategoryProduct(
                    image: "pant.png", 
                    color: 0xff74acf7
                  )
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Tie());
                  },
                  child: _buildCategoryProduct(
                    image: "man_tie.png", 
                    color: 0xfffc6c8d
                  )
                ),
              ],
            )
          )
      ],
    );                    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: const Text("Home Pgae", style: TextStyle(color: kBackgroundColor),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CustomIconButton(
          onPress: (){
            _key.currentState?.openDrawer();
          },
          icon: Icons.menu
        ),
        actions: [
          CustomIconButton(onPress: (){}, icon: Icons.search),
          // CustomIconButton(onPress: (){}, icon: Icons.notifications_none),
          NotificationButton()
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: StreamBuilder(
              stream: productController.getAllProducts(),
              builder: (context, index) {
                if(productController.productList.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                      child: CircularProgressIndicator()
                    )
                  );
                }
                
                return StreamBuilder(
                  stream: productController.getAchives(),
                  builder: (context, index) {
                    return Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          _buildImageSlider(),
                          _buildCategory(),
                          const SizedBox(height: 10,),
                          FeatureBuilder(
                            name: productController.productList[0].name.toString(), 
                            image: productController.productList[0].image.toString(), 
                            price: double.parse(productController.productList[0].price.toString()), 
                            name2: productController.productList[1].name.toString(), 
                            image2: productController.productList[1].image.toString(), 
                            price2: double.parse(productController.productList[1].price.toString())
                          ),
      
                          NewAchives(
                            name: productController.achiveList[0].name.toString(), 
                            image: productController.achiveList[0].image.toString(), 
                            price: double.parse(productController.achiveList[0].price.toString()),  
                            name2: productController.achiveList[1].name.toString(), 
                            image2: productController.achiveList[1].image.toString(),  
                            price2: double.parse(productController.achiveList[1].price.toString()), 
                          )
                        ],
                      ),
                    );
                  }
                );
              
          }),
        ),
      ),
    );
  }
}