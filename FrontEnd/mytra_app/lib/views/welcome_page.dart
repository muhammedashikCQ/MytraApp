import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff081726),
        body: SizedBox.expand(
            child: SingleChildScrollView(
                child: Stack(children: [
                  Positioned(
                top: 600,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 85,
                  // decoration: const BoxDecoration(color: Color(0xff07213B)),
                  decoration: const BoxDecoration(color: Color(0xff07213B)),
                ),
              ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      child: Image.asset("assets/images/home.png"),
                    ),
                    const SizedBox(
                        width: 314,
                        height: 86,
                        child: Text('Lets Make Connection With Pros',
                            style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.w300,
                                color: Colors.white))),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                        width: 314,
                        height: 86,
                        child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do  eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.white))),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
              
              
              SizedBox(
                height: 60,
                width: 127,
                child: FloatingActionButton(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/images/arrowButton.svg')),
              ),
            ],
          ),
        ]))));
  }
}
