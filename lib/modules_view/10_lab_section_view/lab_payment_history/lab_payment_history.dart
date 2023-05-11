import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

//import 'package:ps_welness/constants/my_theme.dart';

import '../../../constants/constants/constants.dart';
import '../../../controllers/10_lab_controller/lab_appointment_history_controller/lab_pay_hist_controller.dart';

class LabPaymentHistory extends StatelessWidget {
  LabPaymentHistory({Key? key}) : super(key: key);

  LabpaymenttController _labpaymentController =
      Get.put(LabpaymenttController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // resizeToAvoidBottomInset: false,

      backgroundColor: MyTheme.ThemeColors,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.02),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: size.width * 0.05,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    'Lab Appointment History',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.02),
                  )
                ],
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: Obx(
                () => (_labpaymentController.isLoading.value)
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          Container(
                            height: size.height * 0.06,
                            width: size.width * 0.95,
                            child: TextField(
                              onChanged: (value) =>
                                  _labpaymentController.foundlabProducts,
                              // controller: _nurseHistoryController
                              //     .appointmentController1,
                              onTap: () {
                                // _nurseHistoryController.chooseDate();
                              },
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 15.0, color: MyTheme.blueww),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search Lab..',
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, bottom: 12.0, top: 15.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                          ),
                          _labpaymentController.foundlabProducts.value.isEmpty
                              ? Center(child: Text("No Result Found"))
                              : SizedBox(
                                  height: size.height * 0.77,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _labpaymentController
                                          .foundlabProducts.length,
                                      // itemCount: _medicineListController.medicinelistmodel!.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.03,
                                              vertical: size.height * 0.0005),
                                          child: Container(
                                            height: size.height * 0.2,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 30 / 6),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      lightPrimary2,
                                                      darkPrimary2,
                                                    ]),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(-0, -0),
                                                    spreadRadius: 0,
                                                    blurRadius: 0,
                                                    color: darkShadow,
                                                  ),
                                                  BoxShadow(
                                                    offset: Offset(3, 3),
                                                    spreadRadius: 0,
                                                    blurRadius: 0,
                                                    color: lightShadow,
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://images.unsplash.com/photo-1628771065518-0d82f1938462?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
                                                        //'https://images.unsplash.com/photo-1587854680352-936b22b91030?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fG1lZGljaW5lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                                        // 'https://images.unsplash.com/photo-1515350540008-a3f566782a3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
                                                        //  'https://images.unsplash.com/photo-1563213126-a4273aed2016?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                                        //'https://images.unsplash.com/photo-1471864190281-a93a3070b6de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
                                                        //'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVkaWNpbmV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'
                                                        //'https://images.unsplash.com/photo-1576073719676-aa95576db207?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1673&q=80'
                                                        // 'lib/assets/background_stack_png/patient3_history.png'
                                                        ),
                                                    fit: BoxFit.cover)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: SizedBox(
                                                height: size.height * 0.145,
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
                                                          'Patient Name:',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.blueww,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.033,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Phone:',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.blueww,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.033,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Durations:',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.blueww,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.033,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Paid fees:',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.blueww,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.033,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Payment Time:',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.blueww,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.033,
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
                                                          "${_labpaymentController.foundlabProducts[index].patientName}",
                                                          // _medicineListController.medicinelistmodel!.data[index].medicineName.toString(),

                                                          //'Flexion',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize:
                                                                size.width *
                                                                    0.033,
                                                          ),
                                                        ),

                                                        Text(
                                                          //'Bharat Biotech'
                                                          "${_labpaymentController.foundlabProducts[index].mobileNumber}",
                                                          //_medicineListController.medicinelistmodel!.data[index].brandName.toString(),
                                                          style: GoogleFonts
                                                              .roboto(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize:
                                                                size.width *
                                                                    0.033,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${_labpaymentController.foundlabProducts[index].paymentDate}",

                                                          // _medicineListController.medicinelistmodel!.data[index].medicineTypeId.toString(),
                                                          //'Capsule',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize:
                                                                size.width *
                                                                    0.033,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${_labpaymentController.foundlabProducts[index].amount}",

                                                          //_medicineListController.medicinelistmodel!.data[index].medicineDescription.toString(),
                                                          //'It is good medicine',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize:
                                                                size.width *
                                                                    0.033,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${_labpaymentController.foundlabProducts[index].startSlotTime}",

                                                          // _medicineListController.medicinelistmodel!.data[index].mrp.toString(),
                                                          //'Rs 15',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize:
                                                                size.width *
                                                                    0.033,
                                                          ),
                                                        ),
                                                        // Align(
                                                        //     alignment: Alignment.centerRight,
                                                        //     child:
                                                        //         Icon(Icons.access_time_outlined)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                        ],
                      ),
              ),
            ),
            // Obx(
            //       () => (_medicineListController.isLoading.value)
            //       ? Center(child: CircularProgressIndicator())
            //       : _medicineListController.medicinelistmodel!.data ==
            //       null
            //       ? Center(
            //     child: Text('No List'),
            //   )
            //       :

            // ),
          ],
        ),
      ),
    );
  }
}
