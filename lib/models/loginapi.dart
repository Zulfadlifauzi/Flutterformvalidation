import 'dart:convert';
import 'package:formvalid/models/login_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<LoginResponseModel> login(
      LoginRequestModel requestModel) async {
    String url = 'http://api.staging.tarsoft.co/api/login';

    final response =
        await http.post(Uri.parse('$url'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
