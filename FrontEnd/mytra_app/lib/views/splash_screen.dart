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

  // @override
  // void initState() {
  //   super.initState();
  //   // Check if the Hive box is empty
  //   if (idBox.isEmpty) {
  //     navigateToWelcome();
  //   } else {
  //     navigateToHome();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    initHiveAndNavigate();
  }

  initHiveAndNavigate() async {
    await Hive.openBox<String>("idBox");

    // Check if the user ID is stored in Hive
    String? userId = idBox.get("userId");

    print("User ID from Hive: $userId"); // Add this line for debugging

    if (userId != null) {
      // User ID exists, navigate to home page
      navigateToHome();
    } else {
      // User ID doesn't exist, navigate to welcome page
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
