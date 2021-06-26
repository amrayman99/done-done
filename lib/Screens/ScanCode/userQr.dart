/*import 'package:egycare/models/user_model.dart';
import 'package:egycare/services/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:egycare/components/custom_text_tile.dart';

class PatData extends StatelessWidget {
  final String userId;

  PatData(this.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(

    future: NetworkHelper.getPersonalInfoUsingId(userId)
    ,builder: (context, snapshot) {
      print(userId);
      if(snapshot.hasData){
        UserModel userModel= snapshot.data;
print(snapshot.data);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(userModel.fullName,style: TextStyle(fontSize: 30),),
              Text(userModel.firstRelativeName,style: TextStyle(fontSize: 30),),
              Text(userModel.firstRelativePhoneNumber,style: TextStyle(fontSize: 30),),
              Text(userModel.secondRelativeName,style: TextStyle(fontSize: 30),),
              Text(userModel.secondRelativePhoneNumber,style: TextStyle(fontSize: 30),),

            ],
          ),
        );
      }else{
        return Center(child: CircularProgressIndicator(),);
      }
    },),);
  }
}
*/

import 'package:egycare/models/user_model.dart';
import 'package:egycare/services/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:egycare/components/custom_text_tile.dart';
import 'package:egycare/components/custom_text_tile.dart';
import 'package:egycare/constants.dart';


class PatData extends StatelessWidget {
  final String userId;

  PatData(this.userId);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder(

      future: NetworkHelper.getPersonalInfoUsingId(userId)
      ,builder: (context, snapshot) {
      print(userId);
      if(snapshot.hasData){
        UserModel userModel= snapshot.data;
        print(snapshot.data);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      'نتيجة الفحص',
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
                    CustomTextTile(title: 'القريب الأول', value: userModel.firstRelativeName,thickness: 1.5,),
                    CustomTextTile(title: 'رقم الموبايل', value: userModel.firstRelativePhoneNumber,thickness: 1.5,),
                    CustomTextTile(title: 'القريب الثاني', value: userModel.secondRelativeName,thickness: 1.5,),
                    CustomTextTile(title: 'رقم الموبايل', value: userModel.secondRelativePhoneNumber,thickness: 1.5,),
                ],

                ),
              ),
                ],
          ),
        );
      }else{
        return Center(child: CircularProgressIndicator(),);
      }
    },),);
  }
}