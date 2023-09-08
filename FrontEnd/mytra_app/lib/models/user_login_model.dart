// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
    String? mailId;
    String? password;

    UserLogin({
        this.mailId,
        this.password,
    });

    factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        mailId: json["mailId"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "mailId": mailId,
        "password": password,
    };
}
