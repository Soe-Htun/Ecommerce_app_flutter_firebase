import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);

  Widget _buildFeaturedProduct({String? name, double? price, String? image}) {
    return Card(
      elevation: 2,
      child: Container(
        height: 230,
        width: 170,
        // color: kPrimaryColor,
        child: Column(
          children: [
            Container(
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/$image"),
                  fit: BoxFit.fill,
                )
              ),
            ),
            const SizedBox(height: 3,),
            Text(
              "\$ $price",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.grey
              ),
            ),
            Text(
              "$name",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: kBackgroundColor
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryProduct({String? image, int? color}) {
    return CircleAvatar(
      maxRadius: 36,
      backgroundColor: Color(color!),
      child: Container(
        height: 38,
        child: Image(
          image: AssetImage("assets/images/$image")
        ),
      ),
    );
  }

  Widget _buildBothFeaOrNewProduct() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Featured",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text("See all",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFeaturedProduct(
              name: "Man Shirt",
              price: 20,
              image: "man_shirt.png"
            ),
            _buildFeaturedProduct(
              name: "Watch",
              price: 30.0,
              image: "watch.png"
            )
          ],
        ),

      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      drawer: const Drawer(),
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
          CustomIconButton(onPress: (){}, icon: Icons.notifications_none),
          CustomIconButton(onPress: (){}, icon: Icons.send)
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 70,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search Something",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                _buildBothFeaOrNewProduct(),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Categories",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text("See all",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ]
                      ),
                    ),
        
                    Container(
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
                    ),
        
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("New Achives",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text("See all",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ]
                      ),
                    ),
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildFeaturedProduct(
                          name: "Man Watch",
                          price: 20,
                          image: "man_watch.png"
                        ),
                        _buildFeaturedProduct(
                          name: "Apple Watch",
                          price: 30.0,
                          image: "apple_watch.png"
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}