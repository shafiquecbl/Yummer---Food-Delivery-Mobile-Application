class GetCustomerProfileModel {
  List<dynamic>? whishLists;
  int? customerCode;
  String? customerName;
  String? email;
  String? pass;
  String? mobileNo;
  String? address;
  String? countryCode;
  String? stateCode;
  String? cityCode;
  String? areaCode;
  String? accountType;
  String? signUpFromPlatform;
  String? firstName;
  String? lastName;
  String? gender;
  String? dateOfBirth;
  String? surName;
  String? registrationDateTime;
  String? lastLoginDateTime;
  String? profilePicturePath;
  String? facebookId;
  String? googleId;
  String? from;
  GetCustomerProfileModel({
    this.whishLists,
    this.customerCode,
    this.customerName,
    this.email,
    this.pass,
    this.mobileNo,
    this.address,
    this.countryCode,
    this.stateCode,
    this.cityCode,
    this.areaCode,
    this.accountType,
    this.signUpFromPlatform,
    this.firstName,
    this.lastName,
    this.gender,
    this.dateOfBirth,
    this.surName,
    this.registrationDateTime,
    this.lastLoginDateTime,
    this.profilePicturePath,
    this.facebookId,
    this.googleId,
    this.from,
  });

  factory GetCustomerProfileModel.fromJson(Map<String, dynamic> json) =>
      GetCustomerProfileModel(
        whishLists: List<dynamic>.from(json["whishLists"].map((x) => x)),
        customerCode: json["customerCode"],
        customerName: json["customerName"],
        email: json["email"],
        pass: json["pass"],
        mobileNo: json["mobileNo"],
        address: json["address"],
        countryCode: json["countryCode"],
        stateCode: json["stateCode"],
        cityCode: json["cityCode"],
        areaCode: json["areaCode"],
        accountType: json["accountType"],
        signUpFromPlatform: json["signUpFromPlatform"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"],
        surName: json["surName"],
        registrationDateTime: json["registrationDateTime"],
        lastLoginDateTime: json["lastLoginDateTime"],
        profilePicturePath: json["profilePicturePath"],
        facebookId: json["facebookId"],
        googleId: json["googleId"],
        from: json["from_"],
      );

  Map<String, dynamic> toJson() => {
        "whishLists": List<dynamic>.from(whishLists!.map((x) => x)),
        "customerCode": customerCode,
        "customerName": customerName,
        "email": email,
        "pass": pass,
        "mobileNo": mobileNo,
        "address": address,
        "countryCode": countryCode,
        "stateCode": stateCode,
        "cityCode": cityCode,
        "areaCode": areaCode,
        "accountType": accountType,
        "signUpFromPlatform": signUpFromPlatform,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "dateOfBirth": dateOfBirth,
        "surName": surName,
        "registrationDateTime": registrationDateTime,
        "lastLoginDateTime": lastLoginDateTime,
        "profilePicturePath": profilePicturePath,
        "facebookId": facebookId,
        "googleId": googleId,
        "from_": from,
      };
}
