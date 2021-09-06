import 'dart:convert';
import 'package:formvalid/models/register.model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<RegisterResponseModel> register(
      RegisterRequestModel requestModel) async {
    String url = 'https://reqres.in/api/register';

    final response =
        await http.post(Uri.parse('$url'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
