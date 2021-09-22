class GetProfileModel {
  String? email;
  String? pass;

  GetProfileModel({this.email, this.pass});

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        email: json['email'],
        pass: json['pass'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'pass': pass,
      };
}
