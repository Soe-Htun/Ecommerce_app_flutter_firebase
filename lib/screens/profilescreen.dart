import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_icon_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/notification_button.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  ProfileScreen({ Key? key }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ) : Container(),
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
                Container(
                  height: 250,
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
                  top: 140,
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
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 300,
                    child: edit== true? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSingleTextFormField(name: 'Enter name'),
                        _buildSingleTextFormField(name: 'Enter gmail'),
                        _buildSingleTextFormField(name: 'Enter gender'),
                        _buildSingleTextFormField(name: 'Enter Phone Number'),
                      ],
                    ) :
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSingleContainer(
                          startText: 'Name',
                          endText: 'Soe'
                        ),
                        _buildSingleContainer(
                          startText: 'Email',
                          endText: 'soe@gmail.com'
                        ),
                        _buildSingleContainer(
                          startText: 'Gender',
                          endText: 'Male'
                        ),
                        _buildSingleContainer(
                          startText: 'Phone No',
                          endText: '09265094170'
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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