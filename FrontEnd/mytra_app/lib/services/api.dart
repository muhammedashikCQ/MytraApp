import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/user_signup_model.dart';

class ApiCall {
  Future apiUserSignUp(String userName, String mailId, String password) async {
    try {
      http.Response response = await http.post(
          Uri.parse("http://10.0.2.2:5039/api/User/UserSignUp"),
          headers: {"Content-Type": "application/json"},
          body: json.encode(<String, String>{
            "userName": userName,
            "mailId": mailId,
            "password": password
          }));
      // print(response.statusCode);
      // print(response.body);
      if (response.statusCode == 200) {
        var jsonResponse = userSignUpFromJson(response.body);
        return jsonResponse;
      } else {
        String message = response.body;
        Get.snackbar("ERROR", message, backgroundColor: Colors.redAccent);
        // print(message);
        return false;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future apiUserLogin(String mailId, String password) async {
    http.Response response = await http.post(
      Uri.parse(
          "https://localhost:7057/api/User/UserLogin?MailId=$mailId&Password=$password"),
      // body: {

      // }
    );

    if (response.statusCode == 200) {
      var jsonResponse = userSignUpFromJson(response.body);
      // print(jsonResponse);
      return jsonResponse;
    }
  }
}
