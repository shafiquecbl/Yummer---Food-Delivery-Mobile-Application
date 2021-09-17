class ShowAdrsModel {
  String? username;
  String? userpass;

  ShowAdrsModel({this.username, this.userpass});

  factory ShowAdrsModel.fromJson(Map<String, dynamic> json) => ShowAdrsModel(
        username: json['userName'],
        userpass: json['userPass'],
      );

  Map<String, dynamic> toJson() => {
        'userName': username,
        'userPass': userpass,
      };
}
