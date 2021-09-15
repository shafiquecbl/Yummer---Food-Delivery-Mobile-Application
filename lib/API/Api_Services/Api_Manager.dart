// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:secure_hops/API/Api_Services/loginModel.dart';

// class APIService {
//   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
//     var client = http.Client();
//     http.Response response = await client.post(
//         Uri.parse('https://www.ohready1.com/u/usr/login'),
//         body: requestModel.toJson());
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var result = json.decode(response.body);
//       print(result);
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data!');
//     }
//   }
// }
