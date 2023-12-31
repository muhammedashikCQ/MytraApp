import 'package:flutter/material.dart';

final TextEditingController userNameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

// int contentClick = 0;

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                  TextSpan(style: TextStyle(color: Colors.white), children: [
                TextSpan(
                  text: 'Hello ',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: 'Beautiful,',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ])),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                  width: 239,
                  // height: 36,
                  child: Text(
                      'Enter your informations below or login with a social account',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white))),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          child: TextField(
            controller: userNameController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'User Name',
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
          height: 40,
        ),
        SizedBox(
          child: TextField(
            controller: confirmPasswordController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Confirm Password',
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
          height: 75,
        ),
      ],
    );
  }
}
