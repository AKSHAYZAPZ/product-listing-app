import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  final Token? token;
  final String? userId;
  final String? message;

  RegisterModel({
    this.token,
    this.userId,
    this.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
        userId: json["user_id"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "token": token?.toJson(),
        "user_id": userId,
        "message": message,
      };
}

class Token {
  final String? access;

  Token({
    this.access,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "access": access,
      };
}
