import 'package:egycare/components/custom_text_tile.dart';
import 'package:egycare/constants.dart';
import 'package:egycare/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:egycare/components/rounded_button.dart';
import 'package:egycare/Screens/edit_screen.dart';
import 'package:egycare/services/network_helper.dart';
import 'package:egycare/services/local_helper.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserProfileScreen extends StatefulWidget {


  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();

}

class _UserProfileScreenState extends State<UserProfileScreen> {

  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<UserModel>(future: NetworkHelper.getPersonalInfoUsingId()
              ,builder:(BuildContext context,AsyncSnapshot snapshot)
              {
                if( snapshot.connectionState == ConnectionState.waiting){

                  return Center(child: CircularProgressIndicator());
                }
                else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }else if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }


                UserModel userModel=snapshot.data;
                return  SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.2,
                        padding: EdgeInsets.only(top: size.height * 0.04),
                        decoration: BoxDecoration(
                          color: Color(0xFF0080F6),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(23),
                              bottomRight: Radius.circular(23)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(

                                  child: Image.asset(
                                    'assets/icons/logo2bg.png',
                                    color: Colors.white,
                                    height: size.height * 0.08,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'Egycare',
                                  style: TextStyle(
                                      fontFamily: "Diavlo",
                                      color: Colors.white,
                                      fontSize: 30),
                                )
                              ],
                            ),
                            Text(
                              'الملف الشخصي',
                              style: kCardTextStyle.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Column(
                          children: [
                            CustomTextTile(title: 'الاسم', value: userModel.fullName,thickness: 1.5,),
                            CustomTextTile(title: 'العنوان', value: userModel.city,thickness: 1.5,),
                            CustomTextTile(title: 'العمر', value:( DateTime.now().difference(DateTime.parse(userModel.dateOfBirth)).inDays/365).floor().toString(),thickness: 1.5,),
                            CustomTextTile(title: 'الجنس', value: userModel.gender,thickness: 1.5,),
                            CustomTextTile(title: 'رقم الموبايل', value: userModel.phoneNumber,thickness: 1.5,),

                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Color(0xFF0080F6),
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Text(
                                'بيانات الاقارب',
                                textAlign: TextAlign.center,
                                style: kCardTextStyle.copyWith(fontSize: 30,color: Colors.white),
                              ),),

                            Divider(
                              indent: 24,
                              endIndent: 24,
                              thickness: 1.5,

                            ),
                            CustomTextTile(title: 'الاسم',value: userModel.firstRelativeName,thickness: 1.5,),
                            CustomTextTile(title: 'رقم الموبايل', value:userModel.firstRelativePhoneNumber,thickness:1.5 ,),
                            CustomTextTile(title: 'الاسم', value: userModel.secondRelativeName,thickness: 1.5,),
                            CustomTextTile(title: 'رقم الموبايل', value: userModel.secondRelativePhoneNumber,thickness: 0.0,),
                            RoundedButton(
                              text: "تعديل البيانات",
                              press: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditScreen(user:userModel)),
                                );
                                ;
                              },
                            ),
                            RoundedButton(
                              text: "تسجيل الخروج",
                              press: () {

                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );

              }
          )
      ),
    );

  }


}