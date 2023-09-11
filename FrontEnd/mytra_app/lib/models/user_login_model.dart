// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  int? userId;
  String? userName;
  String? mailId;

  UserLogin({
    this.userId,
    this.userName,
    this.mailId,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        userId: json["userId"],
        userName: json["userName"],
        mailId: json["mailId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "mailId": mailId,
      };
}
