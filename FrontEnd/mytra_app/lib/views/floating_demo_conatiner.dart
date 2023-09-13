import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytra_app/views/request_page.dart';

class FloatingDemoContainer extends StatelessWidget {
  const FloatingDemoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66,
      height: 66,
      child: FloatingActionButton(
        onPressed: () {
          Get.to(const RequestPage(
            serviceId: null,
          ));
        },
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff545454),
        child: const Icon(Icons.add),
      ),
    );
  }
}
