class RegisterModel {
  String? token;
  String? error;

  RegisterModel({this.token, this.error});

  // factory RegisterModel.fromJson(Map<String, dynamic> json) =>
  //     RegisterModel(token: json['json'], error: json['error']);
  // Map<String, dynamic> toJson() => {'token': token, 'error': error};

    factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        token: json['token'] == null ? json['token'] : '',
error: json['error'],
        );
  }
}

class RegisterRequestModel {
  String? email;
  String? password;
  String? name;

  RegisterRequestModel({
    this.email, 
    this.password, 
    this.name
    });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterRequestModel(
          name: json['name'], email: json['email'], password: json['password']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name,
      'email': email,
      'password': password
    };

    return map;
  }
}
