import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/my_ymwd_report_controller/my_ymwd_report_vehicle_controller.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/my_y_m_w_d_reports_view_all/my_ymwd_vehicle_report/my_ymwd_vehicle_details/fr_vich_components3/credentials.dart';
class Ymwdreportvehicle extends StatelessWidget {
  YmwdVehicleController _ymwdVehicleController = Get.put(YmwdVehicleController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: size.height * 0.01,
                right: -size.width * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.18,
                    width: size.width * 0.58,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyYmwdreportVehicleeCredential(),
                  Obx(()=> _ymwdVehicleController.isLoading.value
                          ? Center(child: CircularProgressIndicator(),)
                      : _ymwdVehicleController.data.value.isEmpty
                      ? Center(child: Text('No List'))
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _ymwdVehicleController.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var item = _ymwdVehicleController.data;
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.0005),
                                child: Container(
                                  height: size.height * 0.25,
                                  margin: const EdgeInsets.symmetric(vertical: 30 / 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(-0, -0),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.pink.shade900,
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
                                          'https://images.unsplash.com/photo-1516641051054-9df6a1aad654?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXxqV19HS251RzZOOHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Container(
                                    height: size.height * 0.24,
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(
                                        vertical: size.width * 0.0 / 05),
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
                                              'https://images.unsplash.com/photo-1516641051054-9df6a1aad654?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXxqV19HS251RzZOOHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(-0, -0),
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                            color: Colors.green.shade200,
                                          ),
                                          BoxShadow(
                                            offset: Offset(3, 3),
                                            spreadRadius: 2,
                                            blurRadius: 0,
                                            color: Colors.yellow.shade500,
                                          ),
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.01),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: size.height * 0.23,
                                            width: size.width * 0.91,
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                      'https://images.unsplash.com/photo-1516641051054-9df6a1aad654?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXxqV19HS251RzZOOHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'
                                                    ),
                                                    fit: BoxFit.cover),
                                                boxShadow: const[
                                                  BoxShadow(
                                                    color: Colors.black38,
                                                    // Color(0xFFBEBEBE),
                                                    offset: Offset(3, 3),
                                                    blurRadius: 0,
                                                    spreadRadius: 1,
                                                  ),
                                                   BoxShadow(
                                                    //color: Colors.white,
                                                    offset: Offset(-0, -0),
                                                    blurRadius: 0,
                                                    spreadRadius: 1,
                                                  ),
                                                ]),

                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Vehicle No:',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Colors.red.shade900,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Ownership Name:',
                                                      style: GoogleFonts.lato(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .red.shade900),
                                                    ),
                                                    Text(
                                                      'Franchise:',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Colors.red.shade900,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Vehicle Type:',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Colors.red.shade900,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Vehicle Category',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Colors.red.shade900,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Driver Charges',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Colors.red.shade900,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('${item?[index].vehicleNumber}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.036,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text('${item?[index].vehicleOwnerName}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.036,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text('${item?[index].franchise}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.036,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text('${item?[index].type}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.036,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text('${item?[index].categoryName}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.036,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text('${item?[index].driverCharges}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.036,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
