import 'package:get/get.dart';

import '../models/user_signup_model.dart';
import '../services/api.dart';

class UserSignUpController extends GetxController{
  Rx signUpStatus = UserSignUp().obs;
  RxBool isLoading = true.obs;

  Future<void> controllerUserSignUp(String userName,String mailId,String password) async {
    isLoading(true);
    var x = await ApiCall().apiUserSignUp(userName, mailId, password);
    signUpStatus(x);
    isLoading(false);
  }
}