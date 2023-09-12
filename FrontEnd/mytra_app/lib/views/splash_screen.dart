import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytra_app/views/welcome_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }
  // Future<bool> _checkIfLoggedIn() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var token = localStorage.getString('token');
  //   if (token != null) {
  //     return true;
  //   }
  //   return false;
  // }

  _navigatetohome() async {
    await Future.delayed(
      const Duration(milliseconds: 1500),
    );
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const WelcomePage()));
    Get.to(const WelcomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.red,
    ));
  }
}
