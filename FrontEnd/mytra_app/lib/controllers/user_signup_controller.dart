import 'package:get/get.dart';

import '../models/user_login_model.dart';
import '../models/user_signup_model.dart';
import '../services/api.dart';

class UserSignUpController extends GetxController {
  Rx userSignUp = UserSignUp().obs;
  RxBool isLoadingS = true.obs;

  void controllerUserSignUp(
      String userName, String mailId, String password) async {
    var x = await ApiCall().apiUserSignUp(userName, mailId, password);
    userSignUp(x);
    isLoadingS(false);

    // if (x == false) {
    //   isLoadingS(false);
    // }
  }

  Rx userLogin = UserLogin().obs;
  RxBool isLoadingL = true.obs;

  Future<void> controllerUserLogin(String mailId, String password) async {
    isLoadingL(true);
    var x = await ApiCall().apiUserLogin(mailId, password);
    userLogin(x);
    isLoadingL(false);
  }
}
