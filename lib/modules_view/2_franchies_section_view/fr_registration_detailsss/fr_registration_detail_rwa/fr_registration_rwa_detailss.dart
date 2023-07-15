import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesRWADetail_controller.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/fr_registration_detailsss/fr_registration_detail_rwa/fr_all_rwa_details.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/fr_registration_detailsss/fr_registration_detail_rwa/fr_reg_rwaEdit.dart';

import '../../../../constants/my_theme.dart';

class ResitrationRwaDetails extends StatelessWidget {
  ResitrationRwaDetails({Key? key}) : super(key: key);
  FrenchiesRWADetailController _frenchiesRWADetailController = Get.put(FrenchiesRWADetailController());
  callTestListView(){
    _frenchiesRWADetailController.frenchiesRWADetailApi();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(()=> _frenchiesRWADetailController.isLoading.value
          ? Center(child: CircularProgressIndicator(),)
          : SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -size.height * 0.02,
                    right: size.width * 0.00,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.22,
                        width: size.width * 0.5,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/rwa_patient_list1.png',
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
                              'RWA List',
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
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(30.0)),
                                  color: Colors.white70),
                              width: size.width * 0.45,
                              height: size.height * 0.06,
                              margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                              padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(splashColor: Colors.transparent),
                                child: TextField(
                                  onChanged: (value)=>  _frenchiesRWADetailController.filterPaymentNurse(value),
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: MyTheme.blueww),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white70,
                                    hintText: 'Enter RWA Id ',
                                    contentPadding: const EdgeInsets.only(
                                        left: 10.0, bottom: 14.0, top: 0.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
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
                                    color: Colors.grey,
                                    fontSize: size.width * 0.03,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _frenchiesRWADetailController.data.value.isEmpty
                          ? Center(child: Text('No List'))
                          : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:  _frenchiesRWADetailController.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item =  _frenchiesRWADetailController.data;
                            var id = item[index].id;
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.0005),
                              child: Container(
                                height: size.height * 0.3,
                                margin: EdgeInsets.symmetric(vertical: 30 / 5),
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
                                        'https://images.unsplash.com/photo-1632381887598-accb2a2bdd7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                      ),
                                      fit: BoxFit.cover),
                                ),
                                child: Container(
                                  height: size.height * 0.3,
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
                                            'https://images.unsplash.com/photo-1632381887598-accb2a2bdd7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius:
                                          BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(-0, -0),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          color: Colors.red.shade200,
                                        ),
                                        BoxShadow(
                                          offset: Offset(3, 3),
                                          spreadRadius: 2,
                                          blurRadius: 0,
                                          color: Colors.yellow.shade100,
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
                                          height: size.height * 0.3,
                                          width: size.width * 0.92,
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[900],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    'https://images.unsplash.com/photo-1632749161487-5f38ec89ebdf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
                                                  ),
                                                  fit: BoxFit.cover),
                                              boxShadow: [
                                                const BoxShadow(
                                                  color: Colors.black,
                                                  // Color(0xFFBEBEBE),
                                                  offset: Offset(3, 3),
                                                  blurRadius: 0,
                                                  spreadRadius: 0,
                                                ),
                                                const BoxShadow(
                                                  color: Colors.white,
                                                  offset: Offset(-1, -1),
                                                  blurRadius: 1,
                                                  spreadRadius: 1,
                                                ),
                                              ]),

                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceAround,
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
                                                    'RWA Id:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .indigo.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'RWA Name:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .indigo.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Mobile No:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .indigo.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Landline No:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .indigo.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Email:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .indigo.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Address:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .indigo.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Certificate No:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .indigo.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Approval:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .indigo.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Action:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .indigo.shade900,
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
                                                  Text('${item?[index].rwaId}',
                                                    style: GoogleFonts.lato(
                                                      fontSize: size.width *
                                                          0.035,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .cyan.shade900,
                                                    ),
                                                  ),
                                                  Text('${item?[index].authorityName}',
                                                    style: GoogleFonts.lato(
                                                      fontSize: size.width *
                                                          0.035,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .cyan.shade900,
                                                    ),
                                                  ),
                                                  Text('${item?[index].mobileNumber}',
                                                    style: GoogleFonts.lato(
                                                      fontSize: size.width *
                                                          0.035,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .cyan.shade900,
                                                    ),
                                                  ),
                                                  Text('${item?[index].phoneNumber}',
                                                    style: GoogleFonts.lato(
                                                      fontSize: size.width *
                                                          0.035,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .cyan.shade900,
                                                    ),
                                                  ),
                                                  Text('${item?[index].emailId}',
                                                    style: GoogleFonts.lato(
                                                      fontSize: size.width *
                                                          0.035,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .cyan.shade900,
                                                    ),
                                                  ),
                                                  Text('${item?[index].location}',
                                                    style: GoogleFonts.lato(
                                                      fontSize: size.width *
                                                          0.035,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .cyan.shade900,
                                                    ),
                                                  ),
                                                  Text('${item?[index].certificateNo}',
                                                    style: GoogleFonts.lato(
                                                      fontSize: size.width *
                                                          0.035,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .cyan.shade900,
                                                    ),
                                                  ),
                                                  Text('${item?[index].isApproved}',
                                                    style: GoogleFonts.lato(
                                                      fontSize: size.width *
                                                          0.035,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors
                                                          .green.shade900,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: (){
                                                          var name = item?[index].authorityName;
                                                          var phone = item?[index].phoneNumber;
                                                          var mobile = item?[index].mobileNumber;
                                                          var email = item?[index].emailId;
                                                          var location = item?[index].location;
                                                          var c_number = item?[index].certificateNo;
                                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                                              EditRWA(id: id.toString(), name: name.toString(),phone: phone.toString(),
                                                                mobile: mobile.toString(),email: email.toString(),
                                                                location: location.toString(),c_number: c_number.toString(),)));
                                                        },
                                                        child: Container(
                                                          height:
                                                              size.height *
                                                                  0.02,
                                                          width: size.width *
                                                              0.075,
                                                          color: Colors
                                                              .lightBlueAccent,
                                                          child: Center(
                                                            child: Text(
                                                              'Edit',
                                                              style:
                                                                  GoogleFonts
                                                                      .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.025,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: size.width *
                                                            0.04,
                                                      ),
                                                      InkWell(
                                                        onTap: (){
                                                          _frenchiesRWADetailController.frenchiesDeleteRWADetailApi(id!);
                                                          Timer(const Duration(seconds: 1), () => callTestListView());
                                                        },
                                                        child: Container(
                                                          height:
                                                              size.height *
                                                                  0.02,
                                                          width: size.width *
                                                              0.1,
                                                          color: Colors.red,
                                                          child: Center(
                                                            child: Text(
                                                              'Delete',
                                                              style:
                                                                  GoogleFonts
                                                                      .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.025,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
                          }),
                      SizedBox(
                        height: size.height * 0.00,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: PhysicalModel(
                            color: Colors.green,
                            elevation: 10,
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.grey,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => AllRwaDetails());
                              },
                              child: Container(
                                height: size.height * 0.035,
                                width: size.width * 0.16,
                                decoration: BoxDecoration(
                                  color: MyTheme.blueww,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: Text(
                                  'See all',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.03,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
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
