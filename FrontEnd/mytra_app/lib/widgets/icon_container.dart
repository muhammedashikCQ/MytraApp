import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DemoContainer extends StatelessWidget {
  final String header;
  final String imagePath;

  const DemoContainer(
      {super.key, required this.header, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 235, 235, 235),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 0))
        ],
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffFFFFFF),
      ),
      // width: 105,
      // height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image with text
          SvgPicture.asset(imagePath),
          Text(header,
              style: GoogleFonts.heebo(
                  textStyle: const TextStyle(
                color: Color(0xff464646),
                fontSize: 12,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
              )))
        ],
      ),
    );
  }
}
