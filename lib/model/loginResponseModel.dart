class LoginResponseModel {
  String? result;
  int? userCode;
  String? userName;
  String? email;
  String? accountType;
  String? googleID;
  String? facebookID;

  LoginResponseModel(
      {this.accountType,
      this.email,
      this.facebookID,
      this.googleID,
      this.result,
      this.userCode,
      this.userName});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        result: json['result'],
        userCode: json['userCode'],
        userName: json['userName'],
        email: json['email'],
        accountType: json['accountType'],
        googleID: json['googleID'],
        facebookID: json['facebookID'],
      );

  Map<String, dynamic> toJson() => {
        'result': result,
        'userCode': userCode,
        'userName': userName,
        'email': email,
        'accountType': accountType,
        'googleID': googleID,
        'facebookID': facebookID,
      };
}
