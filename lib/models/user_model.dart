
class UserModel{

  String fullName;
  String dateOfBirth;
  String phoneNumber;
  String gender;
  String city;
  String firstRelativeName;
  String firstRelativePhoneNumber;
  String secondRelativeName;
  String secondRelativePhoneNumber;

  UserModel(
      this.fullName,
      this.dateOfBirth,
      this.phoneNumber,
      this.gender,
      this.city,
      this.firstRelativeName,
      this.firstRelativePhoneNumber,
      this.secondRelativeName,
      this.secondRelativePhoneNumber,
      );

  UserModel.fromJson(Map<dynamic,dynamic> json){
    print('INNNN');
    fullName = json['fullName'];
    print('AND $fullName');

    dateOfBirth = json['dateOfBirth'];
    print('DATE $dateOfBirth');

    phoneNumber = json['phoneNumber'];
    print('PHONENUMBER $phoneNumber');

    gender = json['gender'];
    print('GENDER $gender');

    city = json['city'];
    print('city $city');

    firstRelativeName = json['realtiveOneName'];
    print('RELATIVEONE $firstRelativeName');


    firstRelativePhoneNumber = json['realtiveOnePhone'];
    print('RELATIVEONEPHONENUMBER $firstRelativePhoneNumber');

    secondRelativeName = json['realtiveTwoName'];
    print('RELATIVETWO $secondRelativeName');

    secondRelativePhoneNumber = json['realtiveTwoPhone'];
    print('RELATIVETWOPHONENUMBER $secondRelativePhoneNumber');

  }
  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['city'] = this.city;
    data['relativeOneName'] = this.firstRelativeName;
    data['relativeOnePhoneNumber'] = this.firstRelativePhoneNumber;
    data['relativeTwoName'] = this.secondRelativeName;
    data['relativeTwoPhoneNumber'] = this.secondRelativePhoneNumber;
    return data;
  }
}