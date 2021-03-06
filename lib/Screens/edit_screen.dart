import 'package:egycare/Screens/Login/login_screen.dart';
import 'package:egycare/components/custom_textField.dart';
import 'package:egycare/components/date_picker.dart';
import 'package:egycare/components/rounded_button.dart';
import 'package:egycare/constants.dart';
import 'package:egycare/models/user_model.dart';
import 'package:egycare/services/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:egycare/Screens/user_profile_screen.dart';


class EditScreen extends StatefulWidget {

  final UserModel user;
  EditScreen({@required this.user} );
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  @override
  void initState() {
    super.initState();
    _phoneNumber = widget.user.phoneNumber;
    _city = widget.user.city;
    _firstRelativeName=widget.user.firstRelativeName;
    _firstRelativePhoneNumber = widget.user.firstRelativePhoneNumber;
    _secondRelativeName = widget.user.secondRelativeName;
    _secondRelativePhoneNumber = widget.user.secondRelativePhoneNumber;

  }

  String _phoneNumber = '';
  String _city = '';
  String _firstRelativeName = '';
  String _firstRelativePhoneNumber = '';
  String _secondRelativeName = '';
  String _secondRelativePhoneNumber = '';

  bool
  _showPhoneNumberError = false,
      _showR1NameError = false,
      _showR1PhoneError = false,
      _showR2NameError = false,
      _showCityError = false,
      _showR2PhoneError = false;

  bool _accountValidator() {
    if (
    _showPhoneNumberError == false &&
        _showCityError == false &&
        _showR1NameError == false &&
        _showR1PhoneError == false &&
        _showR2NameError == false &&
        _showR2PhoneError == false)
      return true;
    else
      return false;
  }

  bool _isEmpty() {
    return
      _phoneNumber.length == 0 ||
          _city.length == 0 ||
          _firstRelativeName.length == 0 ||
          _firstRelativePhoneNumber.length == 0 ||
          _secondRelativeName.length == 0 ||
          _secondRelativePhoneNumber.length == 0;
  }

  void _onPress() async {

    FocusScope.of(context).unfocus();

    if (_accountValidator() == true ) {
      print("DATA is Valid----");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
          elevation: 10,
          content: Text(
            '...???????? ??????????????',
            textAlign: TextAlign.right,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.black),
          ),
        ),
      );

      widget.user.phoneNumber=_phoneNumber;
      widget.user.city=_city;
      widget.user.firstRelativeName=_firstRelativeName;
      widget.user.firstRelativePhoneNumber=_firstRelativePhoneNumber;
      widget.user.secondRelativeName=_secondRelativeName;
      widget.user.secondRelativePhoneNumber=_secondRelativePhoneNumber;

      var result = await NetworkHelper.editPersonalInfo(user: widget.user);
      setState(() {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });
      if (result == 200) {
        print('PUSH NOWWWW');
        Navigator.pop(context);
      } else if (result == 0 || result == 400) {
        print("BAAAD Request++++++");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: kPrimaryColor,
            elevation: 10,
            content: Text(
              '???????? ?????? ????????',
              textAlign: TextAlign.right,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.black),
            ),
            action: SnackBarAction(
              label: '??????????',
              textColor: kPrimaryColor,
              onPressed: () {},
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
          elevation: 10,
          content: Text(
            '???????? ?????? ????????.. ?????? ?????? ???????????? ???????????? ??????????',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.black),
          ),
          action: SnackBarAction(
            textColor: kPrimaryColor,
            onPressed: () {},
            label: '??????????',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.009),
                    Text(
                      "?????????? ????????????????",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "?????????? ?????????????? ???????? ???????? ???????????????? ????????????",
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    SizedBox(height: size.height * 0.001),

                    CustomTextFiled(
                      inputType: TextInputType.phone,
                      inputDecoration: InputDecoration(
                        errorText: _showPhoneNumberError ? '?????? ????????' : null,
                        border: InputBorder.none,
                        hintText: "?????? ?????????????? ????????????",
                        suffixIcon: Icon(
                          Icons.phone,
                          color: kPrimaryColor,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _showPhoneNumberError = Validator.phoneNumber(value);
                          _phoneNumber = value;
                        });
                      },
                    ),
                    CustomTextFiled(
                      inputDecoration: InputDecoration(
                        errorText: _showCityError ? '?????? ????????' : null,
                        border: InputBorder.none,
                        hintText: "????????????????",
                        suffixIcon: Icon(
                          Icons.location_on,
                          color: kPrimaryColor,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _city = value;
                          _showCityError = Validator.fullName(value);
                        });
                      },
                    ),

                    CustomTextFiled(
                      inputType: TextInputType.name,
                      inputDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "?????? ?????????? ??????????",
                        errorText: _showR1NameError ? '?????? ????????' : null,
                        suffixIcon: Icon(
                          FontAwesomeIcons.solidIdBadge,
                          color: kPrimaryColor,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _showR1NameError = Validator.fullName(value);
                          _firstRelativeName = value;
                        });
                      },
                    ),
                    CustomTextFiled(
                      inputType: TextInputType.phone,
                      inputDecoration: InputDecoration(
                        errorText: _showR1PhoneError ? '?????? ????????' : null,
                        border: InputBorder.none,
                        hintText: "?????? ?????????? ?????????? ??????????",
                        suffixIcon: Icon(
                          Icons.phone,
                          color: kPrimaryColor,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _showR1PhoneError = Validator.phoneNumber(value);
                          _firstRelativePhoneNumber = value;
                        });
                      },
                    ),
                    CustomTextFiled(
                      inputType: TextInputType.name,
                      inputDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "?????? ?????????? ????????????",
                        errorText: _showR2NameError ? '?????? ????????' : null,
                        suffixIcon: Icon(
                          FontAwesomeIcons.solidIdBadge,
                          color: kPrimaryColor,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _showR2NameError = Validator.fullName(value);
                          _secondRelativeName = value;
                        });
                      },
                    ),
                    CustomTextFiled(
                      inputType: TextInputType.phone,
                      inputDecoration: InputDecoration(
                        errorText: _showR2PhoneError ? '?????? ????????' : null,
                        border: InputBorder.none,
                        hintText: "?????? ?????????? ?????????? ????????????",
                        suffixIcon: Icon(
                          Icons.phone,
                          color: kPrimaryColor,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _showR2PhoneError = Validator.phoneNumber(value);
                          _secondRelativePhoneNumber = value;
                        });
                      },
                    ),

                    RoundedButton(
                      text: "??????????",
                      press: _onPress,
                    ),
                    SizedBox(height: size.height * 0.01),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
