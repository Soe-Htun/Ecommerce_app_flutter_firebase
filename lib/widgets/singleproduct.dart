import 'package:flutter/material.dart';

import '../constants.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final double price;
  final String name;

  const SingleProduct({ Key? key,
    required this.name,
    required this.image,
    required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: SizedBox(
        height: 220,
        width: MediaQuery.of(context).size.width / 2.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                )
              ),
            ),
            
            // Expanded(child: Container()),
            const SizedBox(height: 5,),
            Text(
              "\$ ${price.toString()}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: kPrimaryColor
              ),
            ),

            const SizedBox(height: 3,),
            
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: kBackgroundColor
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}