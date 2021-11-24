import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.success,
    this.message,
  });

  bool? success;
  Message? message;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        success: json["success"],
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message!.toJson(),
      };
}

class Message {
  Message({
    this.name,
    this.email,
    this.password,
  });

  List<String>? name;
  List<String>? email;
  List<String>? password;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        name:
            List<String>.from(json["name"].map((userRegister) => userRegister))
                .toList(),
        email:
            List<String>.from(json["email"].map((userRegister) => userRegister))
                .toList(),
        password: List<String>.from(
            json["password"].map((userRegister) => userRegister)).toList(),
      );

  Map<String, dynamic> toJson() => {
        "name": List<dynamic>.from(name!.map((userRegister) => userRegister))
            .toList(),
        "email": List<dynamic>.from(email!.map((userRegister) => userRegister))
            .toList(),
        "password":
            List<dynamic>.from(password!.map((userRegister) => userRegister))
                .toList(),
      };
}
