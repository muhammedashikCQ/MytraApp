import 'package:http/http.dart' as http;

import '../models/user_signup_model.dart';

class ApiCall{
  Future apiUserSignUp(String userName,String mailId,String password) async {
    http.Response response =
        await http.post(Uri.parse("https://localhost:7057/api/User/UserSignUp"),
        );

    if (response.statusCode == 200) {
      var jsonResponse = userSignUpFromJson(response.body);
          // print(jsonResponse);
      return jsonResponse;
    }
  }

  Future apiUserLogin(String mailId,String password) async {
    http.Response response =
        await http.post(Uri.parse("https://localhost:7057/api/User/UserLogin?MailId=$mailId&Password=$password"),
        );

    if (response.statusCode == 200) {
      var jsonResponse = userSignUpFromJson(response.body);
          // print(jsonResponse);
      return jsonResponse;
    }
  }
}