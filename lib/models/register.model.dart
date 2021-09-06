class RegisterResponseModel {
  final String? token;
  final String? error;

  RegisterResponseModel({this.token, this.error});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      token: json['token'] != null ? json['token'] : '',
      error: json['error'] != null ? json['error'] : '',
    );
  }
}

class RegisterRequestModel {
  String? name;
  String? email;
  String? password;

  RegisterRequestModel({this.name,this.email,this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name,
      'email': email,
      'password': password,
    };

    return map;
  }
}
