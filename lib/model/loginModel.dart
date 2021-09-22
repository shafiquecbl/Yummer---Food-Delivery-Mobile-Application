class LoginModel {
  String? username;
  String? userpass;

  LoginModel({this.username, this.userpass});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        username: json['userName'],
        userpass: json['pass'],
      );

  Map<String, dynamic> toJson() => {
        'userName': username,
        'pass': userpass,
      };
}
