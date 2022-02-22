import 'package:ecommerce_app_flutter_firebase/controller/cartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class SingleCardProduct extends StatefulWidget {
  final String name;
  final String image;
  final bool? isCount;
  int quantity;
  final double price;
  SingleCardProduct({ Key? key,
    required this.name,
    required this.image,
    required this.price,
    this.isCount,
    required this.quantity
  }) : super(key: key);

  @override
  State<SingleCardProduct> createState() => _SingleCardProductState();
}
  // late int widget.quantity;

class _SingleCardProductState extends State<SingleCardProduct> {

  static final CartController cartController = Get.put(CartController());
  // cartController.getCheckOutData(
  //   quantity: widget.quantity,
  //   image: widget.image,
  //   name: widget.name,
  //   price: widget.price
  // );
  
  
  @override
  Widget build(BuildContext context) {
    // widget.quantity = widget.quantity.toInt();
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                SizedBox(
                  height: 130,
                  width: 150,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(widget.name),
                            // CustomIconButton(
                            //   onPress: (){}, 
                            //   icon: Icons.ac_unit
                            // )
                          ],
                        ),
                        const Text("Clothes"),
                        Text("\$${widget.price.toString()}",
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Container(
                          height: 35,
                          width: widget.isCount == false ? 110 : 100,
                          color: const Color(0xfff2f2f2),
                          child: widget.isCount == false?  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: const Icon(Icons.remove),
                                onTap: (){
                                  setState(() {
                                    if(widget.quantity > 1) {
                                      widget.quantity--;
                                      cartController.getCheckOutData(
                                        quantity: widget.quantity,
                                        image: widget.image,
                                        name: widget.name,
                                        price: widget.price
                                      );
                                    }
                                  });
                                },
                              ),
                              Text(
                                widget.quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                              ),

                              GestureDetector(
                                child: const Icon(Icons.add),
                                onTap: (){
                                  setState(() {
                                    widget.quantity++;
                                      cartController.getCheckOutData(
                                        quantity: widget.quantity,
                                        image: widget.image,
                                        name: widget.name,
                                        price: widget.price
                                      );
                                  });
                                },
                              ),
                            ],
                          )
                          :
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Quantity",
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
                              Text(
                                widget.quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                              ),
                            ],
                          )
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}