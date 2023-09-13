import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:mytra_app/controllers/home_page_controller.dart';
import 'package:mytra_app/views/bottom_demo_container.dart';
import 'package:mytra_app/views/floating_demo_conatiner.dart';
import 'package:mytra_app/views/request_page.dart';

import '../widgets/bottom_container.dart';
import '../widgets/icon_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Box<String> idBox = Hive.box<String>("idBox");
  final HomePageController homePageController = Get.put(HomePageController());
  List<String> headerList = [
    "Cleaning",
    "Plumbing",
    "Repair",
    "Painting",
    "Washing",
    "All Services",
  ];
  List<String> headerList1 = [
    "Cleaning",
    "Plumbing",
    "Repair",
    "Painting",
    "Washing",
  ];
  List<double> bottomindex = [1.1, 2.2, 3.3, 4.4, 5.5];
  List<String> imagePathList = [
    "assets/images/cleaningicon.svg",
    "assets/images/plumbingicon.svg",
    "assets/images/repairicon.svg",
    "assets/images/paintingicon.svg",
    "assets/images/washingicon.svg",
    "assets/images/allserviceicon.svg"
  ];

  @override
  void initState() {
    super.initState();
    homePageController.getservicesforhome();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => homePageController.isLoadingH.value
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: const Color.fromARGB(255, 240, 240, 240),
            appBar: AppBar(
              automaticallyImplyLeading: false,
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
                      Text(idBox.get('userName').toString(),
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

            ///
            body: Stack(
              children: [
                Container(
                  width: 400,
                  height: 500,
                  margin: const EdgeInsets.fromLTRB(180, 40, 0, 0),
                  child: SvgPicture.asset("assets/images/eclipserings.svg"),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 133, 0),
                    child: SvgPicture.asset("assets/images/bgeclipse.svg")),

                ///Service portion Starts here-----------------------------------------------

                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      //borderRadius: BorderRadius.circular(30),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.fromLTRB(5, 110, 0, 0),

                    padding: const EdgeInsets.fromLTRB(15, 25, 0, 0),

                    //height: 1000,
                    // width: 500,

                    ///Container for lowest part----------------------------------------------------------------------
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Searchbar(Textfield)

                          Container(
                            width: 350,
                            height: 50,
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
                            child: TextField(
                              autocorrect: true,
                              cursorColor:
                                  const Color.fromARGB(255, 20, 20, 20),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                icon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 15, 0, 15),
                                  child: SvgPicture.asset(
                                      "assets/images/searchicon.svg"),
                                ),
                                hintText: "Search",
                                hintStyle: GoogleFonts.heebo(
                                    textStyle: const TextStyle(
                                  color: Color(0xffD3D3D3),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                )),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SvgPicture.asset(
                            "assets/images/bookingicon.svg",
                            width: 370,
                            height: 129,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Select Service For Repair",
                              style: GoogleFonts.heebo(
                                  textStyle: const TextStyle(
                                color: Color(0xff464646),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ))),
                          const SizedBox(
                            height: 10,
                          ),
                          //select service part//
                          GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 8.0,
                                crossAxisSpacing: 8.0,
                              ),
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              itemCount: homePageController.data.length + 1,
                              itemBuilder: (BuildContext ctx, index) {
                                return InkWell(
                                  onTap: () {
                                    switch (index) {
                                      case 0:
                                        Get.to(RequestPage(
                                            serviceId: homePageController
                                                .data[index].serviceId!));
                                      case 1:
                                        Get.to(RequestPage(
                                            serviceId: homePageController
                                                .data[index].serviceId!));
                                      case 2:
                                        Get.to(RequestPage(
                                            serviceId: homePageController
                                                .data[index].serviceId!));
                                      case 3:
                                        Get.to(RequestPage(
                                            serviceId: homePageController
                                                .data[index].serviceId!));
                                      case 4:
                                        Get.to(RequestPage(
                                            serviceId: homePageController
                                                .data[index].serviceId!));
                                      case 5:
                                        Get.to(const RequestPage(serviceId: 6));
                                    }
                                  },
                                  child: DemoContainer(
                                    header: headerList[index],
                                    imagePath: imagePathList[index],
                                  ),
                                );
                              }),

                          const SizedBox(
                            height: 8,
                          ),
                          Text("Service Request",
                              style: GoogleFonts.heebo(
                                  textStyle: const TextStyle(
                                color: Color(0xff464646),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ))),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                                clipBehavior: Clip.none,
                                itemCount: headerList1.length,
                                padding: EdgeInsetsDirectional.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext ctx, index) {
                                  return BottomContainer(
                                    header: headerList1[index],
                                    indexes: bottomindex[index],
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            bottomNavigationBar: const BottomDemoContainer(),
            floatingActionButton: const FloatingDemoContainer(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ));
  }
}
