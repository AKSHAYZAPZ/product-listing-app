import 'dart:convert';

VerifyUserModel verifyUserModelFromJson(String str) =>
    VerifyUserModel.fromJson(json.decode(str));

String verifyUserModelToJson(VerifyUserModel data) => json.encode(data.toJson());

class VerifyUserModel {
  String otp;
  Token? token; // Made nullable
  bool user;

  VerifyUserModel({
    required this.otp,
    this.token, // Nullable now
    required this.user,
  });

  factory VerifyUserModel.fromJson(Map<String, dynamic> json) => VerifyUserModel(
    otp: json["otp"],
    token: json["token"] != null ? Token.fromJson(json["token"]) : null, // Handle null case
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "token": token?.toJson(), // Use null-aware operator
    "user": user,
  };
}

class Token {
  String access;

  Token({
    required this.access,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "access": access,
  };
}