import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/my_ymwd_report_controller/my_ymwd_report_controller.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

import 'fr_doc_components3/credentials.dart';

class Ymwdreportdoctor extends StatelessWidget {
  YmwdController _ymwdController = Get.put(YmwdController());

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
                    height: size.height * 0.254,
                    width: size.width * 0.58,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/fr_doctor003.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyYmwdreportDoctorCredential(),
                  Obx(()=> _ymwdController.isLoading.value
                      ?  Center(child: CircularProgressIndicator(),)
                  : _ymwdController.data.value.isEmpty
                      ? Center(child: Text('No List'))
                      :
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _ymwdController.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = _ymwdController.data;
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.0000),
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
                                      'https://images.unsplash.com/photo-1557683311-eac922347aa1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
                                  ),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              height: size.height * 0.27,
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
                                      ]),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1557683311-eac922347aa1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
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
                                      color: Colors.indigo.shade500,
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
                                      height: size.height * 0.27,
                                      width: size.width * 0.92,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://images.unsplash.com/photo-1557683311-eac922347aa1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
                                              ),
                                              fit: BoxFit.cover),
                                          boxShadow: const[
                                            BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(3, 3),
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                            ),
                                            BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(-1, -1),
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                            ),
                                          ]),

                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Doctor Id:',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Doctor Name:',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Fee:',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Address:',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Department:',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Specialist In:',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Mobile & Phone:',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Email:',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Licence No:',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.white,
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
                                              Text(
                                                '${item?[index].doctorId}',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text( '${item?[index].doctorName}',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text( '${item?[index].fee}',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text( '${item?[index].location}',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text('${item?[index].departmentName}',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text( '${item?[index].specialistName}',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text( '${item?[index].phoneNumber}',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text( '${item?[index].emailId}',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text( '${item?[index].licenceNumber}',
                                                style: GoogleFonts.lato(
                                                  fontSize:
                                                  size.width * 0.033,
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
