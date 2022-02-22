import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/featureList.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/newAchives.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      child: SizedBox(
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
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return SizedBox(
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
        SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Categories",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: (){
                    // Get.to(const ListProduct(name: 'Categories', snapShot: ,));
                  },
                  child: const Text("View more",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                )
              ]
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              children: [
                _buildCategoryProduct(image: "dress.png", color: 0xff33dcfd),
                _buildCategoryProduct(image: "shirt.png", color: 0xfff38cdd),
                _buildCategoryProduct(image: "shoes.png", color: 0xff4ff2af),
                _buildCategoryProduct(image: "pant.png", color: 0xff74acf7),
                _buildCategoryProduct(image: "man_tie.png", color: 0xfffc6c8d),
              ],
            )
          )
      ],
    );                    
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
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
          CustomIconButton(onPress: (){}, icon: Icons.notifications_none),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('products')
        .doc('jFDF6AVClLnGFyXNvhM5')
        .collection('featureproduct')
        .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          else if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator()
                ],
              ),
            );
          }

          // mySnapshot = snapshot;
          
          return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('products')
            .doc('jFDF6AVClLnGFyXNvhM5')
            .collection('newachives')
            .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshotdata) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                
                // ListView.builder(
                //   itemCount: snapshot.data!.docs.length,
                //   itemBuilder: (context, index) {
                //     final docData = snapshot.data!.docs[index].data();
                //     final name = ((docData as dynamic)['name']).toString();
                //     final image = ((docData as dynamic)['image']).toString();
                //     // final price = ((docData as dynamic)['price']).toString();
                //     return Container(
                //       width: double.infinity,
                //       child: Column(
                //         children: [
                //           _buildImageSlider(),
                //           _buildCategory(),
                //           const SizedBox(height: 10,),
                //           FeatureBuilder(
                //             name: name, 
                //             image: image, 
                //             price: 30
                //             ),
      
                //           // _buildNewAchives(),
                //           NewAchives(name: name, image: image, price: 12),
                //           const SizedBox(height: 20,),
                //         ],
                //       ),
                //     );
                //   }
                // )
                
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        _buildImageSlider(),
                        _buildCategory(),
                        const SizedBox(height: 10,),
                        FeatureBuilder(
                          name: snapshot.data!.docs[0]["name"], 
                          image: snapshot.data!.docs[0]["image"], 
                          price: double.parse(snapshot.data!.docs[0]["price"].toString()),
                          name2: snapshot.data!.docs[1]["name"],
                          image2: snapshot.data!.docs[1]["image"],
                          price2: double.parse(snapshot.data!.docs[1]["price"].toString()),
                          // featureAll: snapshot,
                          ),

                          // Text(mySnapshot.data!.docs[0]["name"]),
                      
                        // _buildNewAchives(),
                        // NewAchives(name: name, image: image, price: 12),
                        NewAchives(
                          name: snapshotdata.data!.docs[0]["name"], 
                          image: snapshotdata.data!.docs[0]["image"], 
                          price: double.parse(snapshotdata.data!.docs[0]["price"].toString()),
                          name2: snapshotdata.data!.docs[1]["name"], 
                          image2: snapshotdata.data!.docs[1]["image"], 
                          price2: double.parse(snapshotdata.data!.docs[1]["price"].toString())
                          ),
                        
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                )
                  // shrinkWrap: true,
              );
            }
          );
        }
      ),
      
    );
  }
}