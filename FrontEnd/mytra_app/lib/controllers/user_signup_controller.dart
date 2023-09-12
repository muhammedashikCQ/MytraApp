import 'package:get/get.dart';

import '../services/api.dart';

class UserSignUpController extends GetxController {
  // Rx userSignUp = UserSignUp().obs;
  RxBool isLoadingS = false.obs;

  Future<bool> controllerUserSignUp(
      String userName, String mailId, String password) async {
    isLoadingS(true);
    var x = await ApiCall().apiUserSignUp(userName, mailId, password);
    isLoadingS(false);
    return x;
  }

  // RxBool userLogin = UserLogin().obs;
  RxBool isLoadingL = false.obs; //true

  Future<bool> controllerUserLogin(String mailId, String password) async {
    isLoadingL(true);

    var x = await ApiCall().apiUserLogin(mailId, password);
    // userLogin(x);
    isLoadingL(false);

    return x;
  }
}
