class SignUpModel {
  String? useremail;
  String? username;
  String? userpass;
  String? firstname;
  String? lastname;
  String? mobileno;
  String? accounttype;
  String? from;
  String? facebookid;
  String? googleid;

  SignUpModel(
      {this.useremail,
      this.username,
      this.userpass,
      this.firstname,
      this.lastname,
      this.mobileno,
      this.accounttype,
      this.from,
      this.facebookid,
      this.googleid});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
      useremail: json['email'],
      username: json['userName'],
      userpass: json['pass'],
      firstname: json['firstName'],
      lastname: json['lastName'],
      mobileno: json['mobile'],
      accounttype: json['accountType'],
      from: json['from'],
      facebookid: json['facebookId'],
      googleid: json['googleId']);

  Map<String, dynamic> toJson() => {
        'email': useremail,
        'userName': username,
        'pass': userpass,
        'firstName': firstname,
        'lastName': lastname,
        'mobile': mobileno,
        'accountType': accounttype,
        'from': from,
        'facebookId': facebookid,
        'googleId': googleid,
      };
}
