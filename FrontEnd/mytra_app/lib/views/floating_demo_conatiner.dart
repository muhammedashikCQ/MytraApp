import 'package:flutter/material.dart';

class FloatingDemoContainer extends StatelessWidget {
  const FloatingDemoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66,
      height: 66,
      child: FloatingActionButton(
        onPressed: () {},
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff545454),
        child: const Icon(Icons.add),
      ),
    );
  }
}
