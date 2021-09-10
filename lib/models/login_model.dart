// class LoginResponseModel {
//   final String? token;
//   final String? error;

//   LoginResponseModel({this.token, this.error});

//   // factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
//   //     LoginResponseModel(token: json['json'], error: json['error']);
//   // Map<String, dynamic> toJson() => {'token': token, 'error': error};
//     factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
//     return LoginResponseModel(
//         token: json['token'] != null ? json['token'] : '',
//         error: json['error'] != null ? json['error'] : '');
//   }

// }


class LoginRequestModel {
  String? email;
  String? password;
  String? token;
  String? error;

  LoginRequestModel({this.email, this.password,this.token,this.error});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        email: json['email'], 
        password: json['password'],
        token: json['token'] != null ? json['token'] : '',
        error: json['error'] != null ? json['error'] : ''
        );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'email': email, 'password': password};

    return map;
  }
  
}
