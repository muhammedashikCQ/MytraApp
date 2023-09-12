import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mytra_app/views/home_page.dart';

class BottomDemoContainer extends StatelessWidget {
  const BottomDemoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 67,
      color: const Color.fromARGB(255, 30, 31, 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                Get.to(const HomePage());
              },
              child: SvgPicture.asset("assets/images/bottom_app_bar_home.svg")),
          const SizedBox(width: 18),
          InkWell(child: SvgPicture.asset("assets/images/search_icon.svg")),
          const SizedBox(width: 90),
          InkWell(child: SvgPicture.asset("assets/images/chat_icon.svg")),
          const SizedBox(width: 18),
          InkWell(child: SvgPicture.asset("assets/images/settings_icon.svg")),
        ],
      ),
    );
  }
}
