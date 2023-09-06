import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isClickedLogin = false;
  bool isClickedSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Stack(children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                        colors: [Color(0x4f464646), Color(0xf4141414)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    .createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Image(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 757,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 85,
                decoration: const BoxDecoration(color: Color(0xff2a2a2a)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              isClickedLogin = !isClickedLogin;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 2,
                                width: 31,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  style: isClickedLogin
                                      ? BorderStyle.solid
                                      : BorderStyle.none,
                                  color: Colors.white,
                                ))),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isClickedSignUp = !isClickedSignUp;
                            });
                          },
                          onDoubleTap: () {
                            Get.to(const SignUpPage());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 2,
                                width: 31,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          style: isClickedSignUp
                                              ? BorderStyle.solid
                                              : BorderStyle.none,
                                          color: Colors.white)),
                                ),
                              ),
                            ],
                          )),
                      const Spacer(),
                      ClipRRect(
                        child: Image.asset(
                          'assets/images/pf.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const SizedBox(
                    child: Text('Welcome Back,',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w300)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    child: TextField(
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 290,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                      const Spacer(),
                      SizedBox(
                        height: 60,
                        width: 127,
                        child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: const Color(0xffF2C94C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset('assets/images/arrowL.svg')
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
