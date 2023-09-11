import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../models/services_model.dart';
import '../models/user_login_model.dart';

class ApiCall {
  static Box<String> idBox = Hive.box<String>("idBox");

  Future<bool> apiUserSignUp(
      String userName, String mailId, String password) async {
    try {
      http.Response response = await http.post(
          Uri.parse("http://10.0.2.2:5039/api/User/UserSignUp"),
          headers: {"Content-Type": "application/json"},
          body: json.encode(<String, String>{
            "userName": userName,
            "mailId": mailId,
            "password": password
          }));

      if (response.statusCode == 200) {
        return true;
      } else {
        String message = response.body;
        Get.snackbar("ERROR", message, backgroundColor: Colors.redAccent);

        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> apiUserLogin(String mailId, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse("http://10.0.2.2:5039/api/User/UserLogin"),
        headers: {"Content-Type": "application/json"},
        body: json
            .encode(<String, String>{"mailId": mailId, "password": password}),
      );

      if (response.statusCode == 200) {
        var jsonResponse = userLoginFromJson(response.body);

        // var userId = response.body['userId'].toString();
        idBox.put("userId", jsonResponse.userId.toString());
        idBox.put("userName", jsonResponse.userName.toString());
        print(jsonResponse);
        return true;
      } else {
        String message = response.body;
        Get.snackbar("ERROR", message, backgroundColor: Colors.redAccent);
        // print(message);
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future apiGetServices() async {
    try {
      http.Response response = await http.get(
        Uri.parse("http://10.0.2.2:5039/api/User/GetServices"),
      );
      if (response.statusCode == 200) {
        return serviceDataFromJson(response.body);
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }
}
