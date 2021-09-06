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

  RegisterRequestModel({this.email, this.password,this.name});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email!.trim(),
      'password': password!.trim(),
      'name': name!.trim()
    };

    return map;
  }
}
