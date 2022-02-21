import 'package:badges/badges.dart';
import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/controller/productControlller.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationButton extends StatelessWidget {
  NotificationButton({ Key? key }) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Badge(
      position: const BadgePosition(start: 5, top: 5),
      badgeContent: Text(
        productController.getNotificationIndex.toString(),
        style: const TextStyle(
          color: kTextColor,
          fontWeight: FontWeight.bold
        ),
      ),
      child: CustomIconButton(
        onPress: (){}, 
        icon: Icons.notifications_none,
        color: kBackgroundColor,
      ),
    );
  }
}