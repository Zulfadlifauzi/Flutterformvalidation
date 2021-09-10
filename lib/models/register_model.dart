class RegisterRequestModel {
  String? email;
  String? password;
  String? name;
  String? token;
  String? error;
  String? message;
  String? success;


  RegisterRequestModel({this.email, this.password, this.name,this.token,this.error,this.message,this.success});

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterRequestModel(
        name: json['name'], 
        email: json['email'], 
        password: json['password'],
        token: json['token'] == null ? json['token'] : '',
        error: json['error'],
        message: json['Message'] != null ? json['message']:'',
        success: json['Success']
          );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name,
      'email': email,
      'password': password,
    };

    return map;
  }
}
