import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiselect/multiselect.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

List<String> selected = [];

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/images/leadingicon1.svg",
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New Maintenance Request",
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
                Text("New Jersey 45326",
                    style: GoogleFonts.heebo(
                        textStyle: const TextStyle(
                      color: Color(0xff966C00),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )))
              ],
            )
          ],
        ),
        toolbarHeight: 80,
      ),
      body: Stack(children: [
        Container(
          width: 600,
          height: 700,
          margin: const EdgeInsets.fromLTRB(140, 0, 0, 0),
          child: SvgPicture.asset("assets/images/eclipserings.svg"),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 133, 0),
            child: SvgPicture.asset("assets/images/bgeclipse.svg")),
        Center(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: Colors.white,
          ),
          margin: const EdgeInsets.fromLTRB(0, 110, 15, 0),
          padding: const EdgeInsets.fromLTRB(15, 25, 0, 0),
          child: ListView(
            children: [
              DropDownMultiSelect(
                onChanged: (List<String> x) {
                  setState(() {
                    selected = x;
                  });
                },
                options: const ['a', 'b', 'c', 'd'],
                selectedValues: selected,
                whenEmpty: 'Select Something',
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
