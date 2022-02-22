import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_flutter_firebase/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserModel? userModel;
  List<UserModel> userModelList = [];

  @override
  void onInit(){
    getUserData();
    getUserModelList;
    super.onInit();
  }

  void getUserData() async {
    List<UserModel> newList = [];
    User? currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot userSnapShot = await FirebaseFirestore.instance
    .collection("Users").get();

    for (var element in userSnapShot.docs) {
      if(currentUser?.uid == element["UserId"]) {
        userModel = UserModel(
          userName: element["UserName"], 
          userEmail: element["UserEmail"], 
          userGender: element["UserGender"], 
          userPhoneNumber: element["Phone Number"]
        );
        newList.add(userModel!);
      }
      userModelList = newList;
    }
  }

  // Data for Single 
  // UserModel? get getUserModel {
  //   return userModel;
  // }

  // List 
  List<UserModel> get getUserModelList {
    return userModelList;
  }

}