// To parse this JSON data, do
//
//     final userSignUp = userSignUpFromJson(jsonString);

import 'dart:convert';

UserSignUp userSignUpFromJson(String str) => UserSignUp.fromJson(json.decode(str));

String userSignUpToJson(UserSignUp data) => json.encode(data.toJson());

class UserSignUp {
    String? userName;
    String? mailId;
    String? password;

    UserSignUp({
        this.userName,
        this.mailId,
        this.password,
    });

    factory UserSignUp.fromJson(Map<String, dynamic> json) => UserSignUp(
        userName: json["userName"],
        mailId: json["mailId"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "mailId": mailId,
        "password": password,
    };
}
