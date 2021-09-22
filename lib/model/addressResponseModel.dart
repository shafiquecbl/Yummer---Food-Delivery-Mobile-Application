class AdressResponseModel {
  AdressResponseModel({
    this.addressCode,
    this.customerCode,
    this.fullName,
    this.mobileNo,
    this.stateCode,
    this.cityCode,
    this.areaCode,
    this.locationLat,
    this.locationLong,
    this.addressText,
    this.zipcode,
  });

  int? addressCode;
  int? customerCode;
  String? fullName;
  String? mobileNo;
  int? stateCode;
  int? cityCode;
  int? areaCode;
  int? locationLat;
  int? locationLong;
  String? addressText;
  String? zipcode;

  factory AdressResponseModel.fromJson(Map<String, dynamic> json) =>
      AdressResponseModel(
        addressCode: json["addressCode"],
        customerCode: json["customerCode"],
        fullName: json["fullName"],
        mobileNo: json["mobileNo"],
        stateCode: json["stateCode"],
        cityCode: json["cityCode"],
        areaCode: json["areaCode"],
        locationLat: json["locationLat"],
        locationLong: json["locationLong"],
        addressText: json["addressText"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "addressCode": addressCode,
        "customerCode": customerCode,
        "fullName": fullName,
        "mobileNo": mobileNo,
        "stateCode": stateCode,
        "cityCode": cityCode,
        "areaCode": areaCode,
        "locationLat": locationLat,
        "locationLong": locationLong,
        "addressText": addressText,
        "zipcode": zipcode,
      };
}
