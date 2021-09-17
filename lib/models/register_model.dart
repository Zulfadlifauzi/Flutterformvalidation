class MessageResponse {
  String? token;
  String? error;
  String? message;

  MessageResponse({this.token, this.error, this.message});

  // factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
  //     LoginResponseModel(token: json['json'], error: json['error']);
  // Map<String, dynamic> toJson() => {'token': token, 'error': error};
  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
      token: json['token'] != null ? json['token'] : '',
      error: json['error'] != null ? json['error'] : '',
      message: json['message'] != null ? json['message'] : '',
    );
  }
}

class RegisterResponse {
  String? email;
  String? password;
  String? name;
  String? token;
  String? message;
  bool? success;

  RegisterResponse(
      {this.email,
      this.password,
      this.name,
      this.token,
      this.message,
      this.success});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
          name: json['name'],
          email: json['email'],
          password: json['password'],
          token: json['token'] == null ? json['token'] : '',
          message: json['email'],
          success: json['success']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name,
      'email': email,
      'password': password,
    };

    return map;
  }
}
