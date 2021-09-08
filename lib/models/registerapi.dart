import 'dart:convert';
import 'package:formvalid/models/register_model.dart';
import 'package:http/http.dart' as http;

class RegisterAPI {
  Future<RegisterModel> register(
      RegisterRequestModel requestModelRegister) async {
    String url = 'http://api.staging.tarsoft.co/api/register';

    final response =
        await http.post(Uri.parse('$url'), body: requestModelRegister.toJson());
    if (response.statusCode == 200 || response.statusCode == 401) {
      print(response.body);
      return RegisterModel.fromJson(json.decode(response.body));
    } else {
      print(response);
      print(response.statusCode);
      throw Exception('Failed to load data');
    }
  }
}
