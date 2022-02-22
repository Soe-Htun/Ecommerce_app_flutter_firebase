import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/controller/cartcontroller.dart';
import 'package:ecommerce_app_flutter_firebase/screens/cartscreen.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homescreen.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  const DetailScreen({ Key? key,
    required this.image,
    required this.name,
    required this.price
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  Widget _buildSizeProduct({String? name}) {
    return Container(
      height: 60,
      width: 60,
      color: const Color(0xfff2f2f2),
      child: Center(
        child: Text(
          name!,
          style: const TextStyle(
            fontSize: 17
          ),
        ),
      ),
    );
  }

  Widget _buildColorProduct({Color? color}) {
    return Container(
      height: 60,
      width: 60,
      color: color,
      
    );
  }

  final TextStyle myStyle = const TextStyle(fontSize: 18);

  final CartController cartController = Get.put(CartController());

  Widget _buildImage() {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      width: double.infinity,
      height: 230,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.image)
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: myStyle
              ),
              Text(
                "\$ ${widget.price.toString()}",
                style: myStyle
              ),
              Text("Description",
                style: myStyle
              )
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildDescription() {
    return SizedBox(
      height: 160,
      child: Wrap(
        children: const [
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget _buildSizePart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Size",
          style: myStyle,
        ),
        const SizedBox(height: 15,),
        SizedBox(
          width: 265,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSizeProduct(name: "S"),
              _buildSizeProduct(name: "M"),
              _buildSizeProduct(name: "L"),
              _buildSizeProduct(name: "XXL"),
            ],
          ),
        ),
        const SizedBox(height: 20,),
      ],
    );
  }

  Widget _buildColorPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",
          style: myStyle,
        ),
        const SizedBox(height: 15,),
        SizedBox(
          width: 265,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColorProduct(color: Colors.blue[200]),
              _buildColorProduct(color: Colors.green[200]),
              _buildColorProduct(color: Colors.yellow[200]),
              _buildColorProduct(color: Colors.cyan[200]),
            ],
          ),
        ),
      ],
    );
  }
 
  Widget _buildQuantityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        Text("Quantity",
          style: myStyle,
        ),

        const SizedBox(height: 10,),

        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: const Icon(Icons.remove),
                onTap: (){
                  setState(() {
                    if(count > 1) {
                      count--;
                    }
                  });
                },
              ),
              Text(
                count.toString(),
                style:  myStyle,
              ),

              GestureDetector(
                child: const Icon(Icons.add),
                onTap: (){
                  setState(() {
                    count++;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
      ],
    );
  }

  Widget _buildButtonPart() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextButton(
        onPressed: (){
          cartController.getCartData(
            name: widget.name, 
            image: widget.image, 
            quantity: count.toDouble(), 
            price: widget.price
          );
          Get.to(const CartScreen());
        }, 
        child: const Text(
          "Check Out",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        )
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Details', style: TextStyle(color: kBackgroundColor),),
        leading: CustomIconButton(
          onPress: (){
            Get.to( const HomeScreen());
          }, 
          icon: Icons.arrow_back
        ),
        actions: [
          NotificationButton()
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Container(
              //   width: MediaQuery.of(context).size.width / 1.2,
              //   height: 230,
              //   child: Card(
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 45),
              //       child: Container(
              //         height: 230,
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //             fit: BoxFit.fill,
              //             image: AssetImage("assets/images/${widget.image}")
              //           )
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              _buildImage(),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNameToDescriptionPart(),
                    _buildDescription(),
                    _buildSizePart(),
                    _buildColorPart(),
                    _buildQuantityPart(),
                    _buildButtonPart()
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}