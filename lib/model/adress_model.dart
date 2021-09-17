class AdressModel {
  String? username;
  String? userpass;
  String? fullname;
  String? mobilenum;
  String? country;
  String? state;
  String? city;
  String? area;
  String? zip;
  String? address;
  String? lat;
  String? long;
  String? update;
  String? adrscode;

  AdressModel(
      {this.username,
      this.userpass,
      this.address,
      this.adrscode,
      this.area,
      this.city,
      this.country,
      this.fullname,
      this.lat,
      this.long,
      this.mobilenum,
      this.state,
      this.update,
      this.zip});

  factory AdressModel.fromJson(Map<String, dynamic> json) => AdressModel(
        username: json['userName'],
        userpass: json['userPass'],
        fullname: json['fullName'],
        mobilenum: json['mobileNo'],
        country: json['countryCode'],
        state: json['stateCode'],
        city: json['cityCode'],
        area: json['areaCode'],
        zip: json['zipCode'],
        address: json['addressText'],
        lat: json['locationLat'],
        long: json['locationLong'],
        update: json['doUpdate'],
        adrscode: json['addressCode'],
      );

  Map<String, dynamic> toJson() => {
        'userName': username,
        'userPass': userpass,
        'fullName': fullname,
        'mobileNo': mobilenum,
        'countryCode': country,
        'stateCode': state,
        'cityCode': city,
        'areaCode': area,
        'zipCode': zip,
        'addressText': address,
        'locationLat': lat,
        'locationLong': long,
        'doUpdate': update,
        'addressCode': adrscode
      };
}
