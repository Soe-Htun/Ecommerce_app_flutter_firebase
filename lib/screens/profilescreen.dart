import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/controller/usercontroller.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homescreen.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _buildSingleContainer({ required String startText, required String endText}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(startText,
              style: const TextStyle(fontSize: 17, color: Colors.black45),
            ),
            Text(endText,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSingleTextFormField({required String name}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: name,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
    );
  }

  bool edit = false;
  final UserController userController = Get.put(UserController());

  Widget _buildContainerPart() {
    return Column(
      children: userController.getUserModelList.map((e) {
        return SizedBox(
          height: 260,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSingleContainer(
                  startText: 'Name',
                  endText: e.userName
                ),
                _buildSingleContainer(
                  startText: 'Email',
                  endText: e.userEmail
                ),
                _buildSingleContainer(
                  startText: 'Gender',
                  endText: e.userGender
                ),
                _buildSingleContainer(
                  startText: 'Phone No',
                  endText: e.userPhoneNumber
                ),
            ],
          ),
        );
      }).toList()
    );
  }

  Widget _buildTextFormFieldPart() {
    return Column(
      children: userController.getUserModelList.map((e) {
        return SizedBox(
          height: 260,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSingleTextFormField(
                name: e.userName
              ),
              _buildSingleTextFormField(
                name: e.userEmail
              ),
              _buildSingleTextFormField(
                name: e.userGender
              ),
              _buildSingleTextFormField(
                name: e.userPhoneNumber
              ),
            ],
          ),
        );
      }).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff8f8ff),
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: kTextColor,
        leading: edit== true ?
        IconButton(
          onPressed: (){
            setState(() {
              edit = false;
            });
          }, 
          color: Colors.redAccent,
          icon: const Icon(Icons.close)
        ) 
        : IconButton(
          onPressed: (){
            setState(() {
              Get.to(const HomeScreen());
            });
          }, 
          color: Colors.black,
          icon: const Icon(Icons.arrow_back)
        ),
        actions: [
          edit == false? NotificationButton()
          :
          IconButton(
            onPressed: (){
              setState(() {
                edit = false;
              });
            }, 
            icon: const Icon(Icons.check),
            color: kPrimaryColor,
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: CircleAvatar(
                          maxRadius: 65,
                          backgroundImage: AssetImage("assets/images/user.png"),
                        ),
                      )
                    ],
                  ),
                ),
                edit == true? Positioned(
                  left: MediaQuery.of(context).size.width * 0.52,
                  top: MediaQuery.of(context).size.height * 0.17,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      child: CustomIconButton(
                        color: kPrimaryColor,
                        onPress: (){}, 
                        icon: Icons.edit,
                      ),
                    ),
                  ),
                ) 
                :
                Container()
              ],
            ),
            SizedBox(
              height: 260,
              child: edit== true? 
                _buildTextFormFieldPart()
                :  
                _buildContainerPart()
            ),
            Expanded(child: Container()),
            edit == false ? CustomButton(
              color: kPrimaryColor,
              textColor: kTextColor,
              text: 'Edit Profile', 
              onPress: (){
                setState(() {
                  edit = true;
                });
              }
            ) 
            : 
            Container(),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}