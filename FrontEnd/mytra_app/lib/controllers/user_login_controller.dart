// import 'package:get/get.dart';

// import '../models/user_login_model.dart';
// import '../services/api.dart';

// class UserLoginController extends GetxController{
//   Rx loginStatus = UserLogin().obs;
//   RxBool isLoading = true.obs;

//   Future<void> controllerUserLogin(String mailId,String password) async {
//     isLoading(true);
//     var x = await ApiCall().apiUserLogin(mailId, password);
//     loginStatus(x);
//     isLoading(false);
//   }
// }