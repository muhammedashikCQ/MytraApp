import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../controllers/previous_orderpage_controller.dart';
import 'bottom_demo_container.dart';
import 'floating_demo_conatiner.dart';

class PreviousOrdersPage extends StatefulWidget {
  const PreviousOrdersPage({super.key});

  @override
  State<PreviousOrdersPage> createState() => _PreviousOrdersPageState();
}

class _PreviousOrdersPageState extends State<PreviousOrdersPage> {
  static Box<String> idBox = Hive.box<String>("idBox");
  final PreviousOrderController previousOrderController =
      Get.put(PreviousOrderController());
  @override
  void initState() {
    super.initState();
    previousOrderController
        .controllerGetPreviousOrders(int.parse(idBox.get('userId').toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => previousOrderController.isLoadingP.value
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            backgroundColor: const Color.fromARGB(255, 240, 240, 240),
            appBar: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              title: Column(
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
                margin: const EdgeInsets.fromLTRB(0, 110, 15, 10),
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ListView.builder(
                    itemCount: previousOrderController.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Card(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Services",
                                  style: GoogleFonts.heebo(
                                      textStyle: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 65,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ListView.builder(
                                      itemCount: previousOrderController
                                          .data[index].service!.length,
                                      itemBuilder:
                                          (BuildContext context, int index1) {
                                        return Text(
                                            previousOrderController.data[index]
                                                .service![index1].serviceName!,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.heebo(
                                                textStyle: const TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            )));
                                      }),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Location",
                                  style: GoogleFonts.heebo(
                                      textStyle: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 65,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                      previousOrderController
                                          .data[index].location!.locationName!,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.heebo(
                                          textStyle: const TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 15,
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
                                    color: Color(0xff000000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 65,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                      previousOrderController
                                          .data[index].buildingName!,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.heebo(
                                          textStyle: const TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 15,
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
                                    color: Color(0xff000000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 65,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                      previousOrderController
                                          .data[index].description!,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.heebo(
                                          textStyle: const TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ))),
                                ),
                                const SizedBox(height: 50)
                              ],
                            ),
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
