import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:mytra_app/models/user_login_model.dart';

import '../models/user_signup_model.dart';

class ApiCall {
  static Box<int> idBox = Hive.box<int>("idBox");

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
    try {
      http.Response response = await http.post(
        Uri.parse(
            "http://10.0.2.2:5039/api/User/UserLogin?MailId=$mailId&Password=$password"),
        headers: {"Content-Type": "application/json"},
        body: json
            .encode(<String, String>{"mailId": mailId, "password": password}),
      );

      if (response.statusCode == 200) {
        var jsonResponse = userLoginFromJson(response.body);
        int userId = jsonResponse.userId!;
        idBox.put("userId", userId);
        // print(jsonResponse);
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
}
