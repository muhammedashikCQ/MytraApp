import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mytra_app/views/home_page.dart';
import 'package:mytra_app/views/welcome_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static Box<String> idBox = Hive.box<String>("idBox");

  @override
  void initState() {
    super.initState();
    initHiveAndNavigate();
  }

  initHiveAndNavigate() async {
    await Hive.openBox<String>("idBox");

    String? userId = idBox.get("userId");

    if (userId != null) {
      navigateToHome();
    } else {
      navigateToWelcome();
    }
  }

  navigateToHome() async {
    await Future.delayed(
      const Duration(milliseconds: 1500),
    );
    Get.off(const HomePage());
  }

  navigateToWelcome() {
    Get.off(const WelcomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
