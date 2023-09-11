import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../controllers/user_signup_controller.dart';
import '../widgets/login_widget.dart';
import '../widgets/signup_widget.dart';
import 'home_page.dart';

class SignUpInPage extends StatefulWidget {
  const SignUpInPage({super.key});

  @override
  State<SignUpInPage> createState() => _SignUpInPageState();
}

class _SignUpInPageState extends State<SignUpInPage> {
  static Box<int> idBox = Hive.box<int>("idBox");

  final UserSignUpController userSignUpController =
      Get.put(UserSignUpController());
  int contentClick = 0;

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
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              // isClickedLogin = !isClickedLogin;
                              contentClick = 1; //login page
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
                              contentClick == 1
                                  ? Container(
                                      height: 2,
                                      width: 31,
                                      color: Colors.white,
                                    )
                                  : const SizedBox(),
                            ],
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              // isClickedSignUp = !isClickedSignUp;
                              contentClick = 0; //signUp Page
                            });
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
                              contentClick == 0
                                  ? Container(
                                      height: 2,
                                      width: 31,
                                      color: Colors.white,
                                    )
                                  : const SizedBox(),
                            ],
                          )),
                      const Spacer(),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: SvgPicture.asset(
                      //     "assets/images/ppf.svg",
                      //     width: 50,
                      //     height: 50,
                      //   ),
                      // )
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  //contentClick is 0 then signUp page else if contentClick is 1 then login page
                  contentClick == 0
                      ? const SignUpWidget()
                      : const LoginPageWidget(),

                  contentClick == 0
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onDoubleTap: () {},
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )),
                            const SizedBox(
                              width: 60,
                            ),
                            SizedBox(
                              height: 70,
                              width: 150,
                              child: IconButton(
                                  //signup submit button
                                  onPressed: () {
                                    // print(passwordController.text);
                                    // userSignUpController.isLoadingS=false as RxBool;
                                    // print(userSignUpController.isLoadingS);
                                    if ((passwordController.text ==
                                        confirmPasswordController.text)) {
                                      userSignUpController.controllerUserSignUp(
                                          userNameController.text,
                                          emailController.text,
                                          passwordController.text);
                                      // print(userSignUpController.isLoadingS);
                                      if (userSignUpController
                                          .isLoadingS.isFalse) {
                                        setState(() {
                                          contentClick = 1;
                                        });
                                      }
                                    } else {
                                      Get.snackbar(
                                          "ERROR", "Password doesnot match",
                                          backgroundColor: Colors.redAccent);
                                    }
                                  },
                                  icon: SvgPicture.asset(
                                      "assets/images/arrowButton.svg")),
                            ),
                          ],
                        )
                      : Row(
                          //contentClick is 1 then login page
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
                            // const Spacer(),
                            const SizedBox(
                              width: 60,
                            ),
                            SizedBox(
                              height: 70,
                              width: 150,
                              child: IconButton(
                                  //login submit button
                                  onPressed: () async {
                                    userSignUpController.controllerUserLogin(
                                      loginEmailController.text,
                                      loginPasswordController.text,
                                    );
                                    if (userSignUpController
                                        .isLoadingL.isFalse) {
                                      // print(idBox.get('userId'));
                                      Get.to(HomePage(
                                        id: idBox.get('userId')!,
                                      ));
                                    }
                                  },
                                  icon: SvgPicture.asset(
                                      'assets/images/arrowL.svg')),
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
