import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:formvalid/models/register_model.dart';

class APIregisterservice {
  Future<List<Register>> register(
      String name, String email, String password) async {
    final userRegisterurl =
        Uri.parse('http://api.staging.tarsoft.co/api/register');

    final response = await http.post(userRegisterurl,
        body: {'name': name, 'email': email, 'password': password});
    print(response.body);
    print(response.statusCode);
    return json.decode(response.body);
  }
}
