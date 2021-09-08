// import 'dart:convert';

// RegisterModel registerModelFromJson(String str) =>
//     RegisterModel.fromJson(json.decode(str));

// String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

// class RegisterModel {
//   RegisterModel({this.id, this.token, this.email, this.password, this.name});

//   String? id;
//   String? name;
//   String? token;
//   String? email;
//   String? password;

//   factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
//       id: json["id"],
//       token: json["token"],
//       email: json['email'],
//       name:json['name'],
//       password: json['password']);

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         'name':name,
//         "token": token,
//         'email': email,
//         'password': password,
//       };
// }


// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.id,
        this.token,
    });

    String? id;
    String? token;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
    };
}
