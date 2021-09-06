import 'dart:convert';
import 'package:formvalid/models/register.model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<RegisterResponseModel> login(
      RegisterRequestModel responseModel) async {
    // String url = 'http://api/staging/tarsoft.co/api/register';
    var url = Uri.parse('http://api/staging/tarsoft.co/api/register');

    final response = await http.post(url, body: responseModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
