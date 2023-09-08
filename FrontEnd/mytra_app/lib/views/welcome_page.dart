import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'sign_up.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
            child: SingleChildScrollView(
      child: Stack(children: [
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color.fromARGB(255, 1, 18, 34),
              width: MediaQuery.of(context).size.width,
              height: 750,
            ),
            Container(
              color: const Color(0xff07213B),
              width: MediaQuery.of(context).size.width,
              height: 93.4,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                child: Image(
                    image: AssetImage("assets/images/home.png"),
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                  width: 320,
                  height: 86,
                  child: Text('Lets Make Connection With Pros',
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w300,
                          color: Colors.white))),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                  width: 330,
                  height: 86,
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do  eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white))),
              const SizedBox(
                height: 130,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 60,
                    width: 127,
                    child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SignUpInPage(),
                              ));
                        },
                        child:
                            SvgPicture.asset('assets/images/arrowButton.svg')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
