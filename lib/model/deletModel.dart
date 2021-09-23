class DeleteModel {
  String? userName;
  String? userPass;
  String? addressCode;

  DeleteModel({this.userName, this.userPass, this.addressCode});

  factory DeleteModel.fromJson(Map<String, dynamic> json) => DeleteModel(
      userName: json['userName'],
      userPass: json['userPass'],
      addressCode: json['addressCode']);

  Map<String, dynamic> toJson() =>
      {'userName': userName, 'userPass': userPass, 'addressCode': addressCode};
}
