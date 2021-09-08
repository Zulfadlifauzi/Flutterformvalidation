// import 'package:formvalid/models/user_model.dart';
// import 'package:http/http.dart' as http;

// Future<UserModel> createUser(String name,String email, String password) async {
//   final String apiUrl = 'https://reqres.in/api/user';

//   final response = await http.post(Uri.parse(apiUrl),
//       body: {"name": name, "password": password, 'email': email});

//   if (response.statusCode == 201 || response.statusCode == 400) {
//     final String responseString = response.body;
//     print(response.statusCode);
//     print(response.body);
//     return userModelFromJson(responseString);
//   } else {
//     return null!;
//   }
// }
