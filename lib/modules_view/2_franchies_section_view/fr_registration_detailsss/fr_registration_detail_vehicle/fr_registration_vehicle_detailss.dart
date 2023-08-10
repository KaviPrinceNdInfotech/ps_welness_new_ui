import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesVehicleDetail_controller.dart';

class ResitrationVechileDetails extends StatelessWidget {
  ResitrationVechileDetails({Key? key}) : super(key: key);

  FrenchiesVehicleDetailController _frenchiesVehicleDetailController =
      Get.put(FrenchiesVehicleDetailController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(
          () => _frenchiesVehicleDetailController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: SafeArea(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -size.height * 0.043,
                          right: -size.width * 0.17,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: size.height * 0.23,
                              width: size.width * 0.65,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'lib/assets/background_stack_png/vehicle.png',
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.01),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      height: size.height * 0.03,
                                      width: size.width * 0.1,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white70,
                                      ),
                                      child: Icon(
                                        Icons.arrow_back_ios_outlined,
                                        size: size.height * 0.022,
                                        color: MyTheme.blueww,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Text(
                                    'Vehicle',
                                    style: GoogleFonts.alatsi(
                                        fontSize: size.height * 0.032,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff023382)),
                                  ),
                                ],
                              ),
                            ),
                            //Spacer(),
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.01),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)),
                                        color: Colors.white70),
                                    width: size.width * 0.45,
                                    height: size.height * 0.06,
                                    margin: const EdgeInsets.fromLTRB(
                                        10, 20, 10, 20),
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 8, 8, 8),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          splashColor: Colors.transparent),
                                      child: TextField(
                                        onChanged: (value) =>
                                            _frenchiesVehicleDetailController
                                                .filterPaymentNurse(value),
                                        autofocus: false,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: MyTheme.blueww),
                                        decoration: InputDecoration(
                                          //prefixIcon: Icon(Icons.search),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          hintText: 'Enter Vehicle Name',
                                          contentPadding: const EdgeInsets.only(
                                              left: 10.0,
                                              bottom: 14.0,
                                              top: 0.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(25.7),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(25.7),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  PhysicalModel(
                                    color: Colors.green,
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(20),
                                    shadowColor: Colors.grey,
                                    child: Container(
                                      height: size.height * 0.055,
                                      width: size.width * 0.16,
                                      decoration: BoxDecoration(
                                        color: MyTheme.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Search',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _frenchiesVehicleDetailController.data.value.isEmpty
                                ? Center(child: Text('No List'))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: _frenchiesVehicleDetailController
                                        .data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var item =
                                          _frenchiesVehicleDetailController
                                              .data;
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.03,
                                            vertical: size.height * 0.0005),
                                        child: Container(
                                          height: size.height * 0.25,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 30 / 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(-0, -0),
                                                spreadRadius: 0,
                                                blurRadius: 0,
                                                color: Colors.pink.shade900,

                                                // color: darkShadow1,
                                              ),
                                              BoxShadow(
                                                offset: Offset(3, 3),
                                                spreadRadius: 0,
                                                blurRadius: 0,
                                                color: Colors.pink.shade800,
                                              ),
                                            ],
                                            image: const DecorationImage(
                                                image: NetworkImage(
                                                  'https://images.unsplash.com/photo-1543157145-f78c636d023d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                          child: Container(
                                            height: size.height * 0.24,
                                            width: double.infinity,
                                            margin: EdgeInsets.symmetric(
                                                vertical:
                                                    size.width * 0.0 / 05),
                                            decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      Color(0xffffffff),
                                                      Color(0xffF0FFF0)
                                                      //darkPrimary,
                                                    ]),
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                      'https://images.unsplash.com/photo-1543157145-f78c636d023d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
                                                    ),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(-0, -0),
                                                    spreadRadius: 0,
                                                    blurRadius: 0,
                                                    color:
                                                        Colors.green.shade200,
                                                  ),
                                                  BoxShadow(
                                                    offset: Offset(3, 3),
                                                    spreadRadius: 2,
                                                    blurRadius: 0,
                                                    color:
                                                        Colors.yellow.shade900,
                                                  ),
                                                ]),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      size.width * 0.01),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: size.height * 0.23,
                                                    width: size.width * 0.91,
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image:
                                                            const DecorationImage(
                                                                image:
                                                                    NetworkImage(
                                                                  'https://images.unsplash.com/photo-1543157145-f78c636d023d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
                                                                ),
                                                                fit: BoxFit
                                                                    .cover),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: Colors.black,
                                                            // Color(0xFFBEBEBE),
                                                            offset:
                                                                Offset(3, 3),
                                                            blurRadius: 0,
                                                            spreadRadius: 0,
                                                          ),
                                                          BoxShadow(
                                                            color: Colors.white,
                                                            offset:
                                                                Offset(-1, -1),
                                                            blurRadius: 1,
                                                            spreadRadius: 1,
                                                          ),
                                                        ]),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Vehicle No:',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .brown
                                                                    .shade800,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Ownership Name:',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .brown
                                                                    .shade800,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Franchise:',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .brown
                                                                    .shade800,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Vehicle Type:',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .brown
                                                                    .shade800,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Vehicle Category',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .brown
                                                                    .shade800,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Driver Charges',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .brown
                                                                    .shade800,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${item[index].vehicleNumber}',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.033,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${item[index].vehicleOwnerName}',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.033,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${item[index].franchise}',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.033,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              child: Text(
                                                                '${item[index].vehicleTypeName}',
                                                                style:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.033,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .blue,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              child: Text(
                                                                '${item[index].categoryName}',
                                                                style:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.033,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .blue,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              '${item[index].driverCharges}',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.033,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // child: child,
                                          ),
                                        ),
                                      );
                                    })
                            //),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
