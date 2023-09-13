import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/previous_orderpage_controller.dart';
import 'bottom_demo_container.dart';
import 'floating_demo_conatiner.dart';

class PreviousOrdersPage extends StatefulWidget {
  const PreviousOrdersPage({super.key});

  @override
  State<PreviousOrdersPage> createState() => _PreviousOrdersPageState();
}

class _PreviousOrdersPageState extends State<PreviousOrdersPage> {
  final PreviousOrderController previousOrderController =
      Get.put(PreviousOrderController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => previousOrderController.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
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
                      Text("Previous Requests",
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
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.fromLTRB(0, 110, 15, 0),
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Services",
                                style: GoogleFonts.heebo(
                                    textStyle: const TextStyle(
                                  color: Color(0xff777777),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 55,
                                width: 380,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xff777777))),
                                child: Text("",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.heebo(
                                        textStyle: const TextStyle(
                                      color: Color(0xff777777),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Location",
                                style: GoogleFonts.heebo(
                                    textStyle: const TextStyle(
                                  color: Color(0xff777777),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 55,
                                width: 380,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xff777777))),
                                child: Text("Location",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.heebo(
                                        textStyle: const TextStyle(
                                      color: Color(0xff777777),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Building",
                                style: GoogleFonts.heebo(
                                    textStyle: const TextStyle(
                                  color: Color(0xff777777),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 55,
                                width: 380,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xff777777))),
                                child: Text("Building",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.heebo(
                                        textStyle: const TextStyle(
                                      color: Color(0xff777777),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Description",
                                style: GoogleFonts.heebo(
                                    textStyle: const TextStyle(
                                  color: Color(0xff777777),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 55,
                                width: 380,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xff777777))),
                                child: Text("Description",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.heebo(
                                        textStyle: const TextStyle(
                                      color: Color(0xff777777),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ))),
                              ),
                              const SizedBox(height: 30)
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ]),
            bottomNavigationBar: const BottomDemoContainer(),
            floatingActionButton: const FloatingDemoContainer(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ));
  }
}
