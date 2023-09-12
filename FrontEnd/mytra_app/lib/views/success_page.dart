import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytra_app/views/home_page.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF2F5),
      body: Container(
        color: const Color(0xffEEF2F5),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 240, 0, 0),
                        child: SvgPicture.asset("assets/images/flower.svg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(81, 300, 0, 0),
                        child: SvgPicture.asset("assets/images/trophyicon.svg"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text("Your Request",
                      style: GoogleFonts.heebo(
                          textStyle: const TextStyle(
                        color: Color(0xff464646),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ))),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("Successfully Completed",
                      style: GoogleFonts.heebo(
                          textStyle: const TextStyle(
                        color: Color(0xff464646),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ))),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur Adipiscing \nElit, Sed do Eiusmod tempor incididunt ut labore Et\n Dolore magna aliqua.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.heebo(
                          textStyle: const TextStyle(
                        color: Color(0xff95A5B1),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ))),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffA07B0A),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    width: 380,
                    height: 60,
                    child: TextButton(
                        onPressed: () {
                          Get.to(const HomePage());
                        },
                        child: Text('Done',
                            style: GoogleFonts.heebo(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: .66)))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
