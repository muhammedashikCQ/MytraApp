import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';
import 'package:mytra_app/views/previous_orders_page.dart';

import '../controllers/service_request_controller.dart';
import 'bottom_demo_container.dart';
import 'floating_demo_conatiner.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

String? selectedValue;
List<DropdownMenuItem<String>> location = [
  // const DropdownMenuItem(value: "1", child: Text("Trivandrum")),
  // const DropdownMenuItem(value: "2", child: Text("Kollam")),
  // const DropdownMenuItem(value: "3", child: Text("Kottayam")),
  // const DropdownMenuItem(value: "4", child: Text("Kochi")),
];
List<DropdownMenuItem<String>> selectedservices = [];

List services = [];

class _RequestPageState extends State<RequestPage> {
  final ServiceRequestController serviceRequestController =
      Get.put(ServiceRequestController());
  @override
  void initState() {
    super.initState();
    serviceRequestController.getservices();
    serviceRequestController.getlocation();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (serviceRequestController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      // services = serviceRequestController.data
      //     .map((e) => {
      //           "id": e.serviceId,
      //           "label": e.serviceName,
      //         })
      //     .toList();
      location = serviceRequestController.locationdata
          .map<DropdownMenuItem<String>>((element) => DropdownMenuItem(
              value: element.locationId.toString(),
              child: Text(element.locationName.toString())))
          .toList();
      print(services);
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
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              color: Colors.white,
            ),
            margin: const EdgeInsets.fromLTRB(0, 110, 15, 0),
            padding: const EdgeInsets.fromLTRB(15, 32, 0, 50),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Request field
                  ///
                  Text(
                    "Request type",
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
                  SizedBox(
                    height: 55,
                    child: MultiSelectDropdown(
                      boxDecoration: BoxDecoration(

                          //  color: const Color(0xff777777),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: const Color(0xff777777))),
                      textStyle: GoogleFonts.heebo(
                          textStyle: const TextStyle(
                        color: Color(0xff777777),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                      list: services,
                      initiallySelected: const [],
                      onChange: (newList) {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //building name field
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
                  SizedBox(
                    height: 55,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD7D7D7),
                          ),
                        ),
                        hintText: 'Building',
                        hintStyle: GoogleFonts.heebo(
                            textStyle: const TextStyle(
                          color: Color(0xffB7B7B7),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD7D7D7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //location field
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
                  SizedBox(
                      height: 55,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD7D7D7),
                              ),
                            ),
                            hintText: 'location',
                            hintStyle: GoogleFonts.heebo(
                                textStyle: const TextStyle(
                              color: Color(0xffB7B7B7),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD7D7D7),
                              ),
                            ),
                          ),
                          dropdownColor: Colors.white,
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: location)),
                  const SizedBox(
                    height: 15,
                  ),
                  //Descritpion field
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
                  SizedBox(
                    height: 100,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD7D7D7),
                          ),
                        ),
                        hintText: 'Type your description',
                        hintStyle: GoogleFonts.heebo(
                            textStyle: const TextStyle(
                          color: Color(0xffB7B7B7),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD7D7D7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffA07B0A),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    width: 380,
                    height: 60,
                    child: TextButton(
                        onPressed: () {
                          Get.to(const PreviousOrdersPage());
                        },
                        child: Text('Submit',
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
            ),
          ),
        ]),
        bottomNavigationBar: const BottomDemoContainer(),
        floatingActionButton: const FloatingDemoContainer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
