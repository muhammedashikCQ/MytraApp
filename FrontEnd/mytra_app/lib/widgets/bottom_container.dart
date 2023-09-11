import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomContainer extends StatelessWidget {
  final String header;
  final double indexes;
  const BottomContainer(
      {super.key, required this.header, required this.indexes});

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
      width: 288,
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          //left items
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //First  row header(three items)
              Row(
                children: [
                  Text(header,
                      style: GoogleFonts.heebo(
                          textStyle: const TextStyle(
                        color: Color(0xff464646),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ))),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                      width: 43,
                      height: 22,
                      decoration: BoxDecoration(
                          color: const Color(0xffFEEEE1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(indexes.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.heebo(
                                textStyle: const TextStyle(
                              color: Color(0xffD39867),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ))),
                      )),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Text(r"$24/h",
                      style: GoogleFonts.heebo(
                          textStyle: const TextStyle(
                        color: Color(0xffA07B0A),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ))),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(r"Off 30%",
                      style: GoogleFonts.heebo(
                          textStyle: const TextStyle(
                        color: Color.fromARGB(255, 68, 68, 68),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ))),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text("by ASAS $header",
                  style: GoogleFonts.heebo(
                      textStyle: const TextStyle(
                    color: Color.fromARGB(255, 68, 68, 68),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 120,
            width: 120,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
                  child: SvgPicture.asset(
                    "assets/images/eclipsebehindgirl.svg",
                    width: 82,
                    height: 82,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Image.asset(
                    "assets/images/girlicon1.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
