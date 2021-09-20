class ChangePasswordModel {
  String? oldpass;
  String? newpass;
  String? usercode;

  ChangePasswordModel({this.newpass, this.oldpass, this.usercode});

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordModel(
        oldpass: json['oldPass'],
        newpass: json['newPass'],
        usercode: json['userCode'],
      );

  Map<String, dynamic> toJson() => {
        'oldPass': oldpass,
        'newPass': newpass,
        'userCode': usercode,
      };
}
