import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/rozar_pay_controller/rozar_pay_controller.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/controllers/rozar_pay_controller/rozar_pay_controller.dart';

class NurseAppointmentCheckout extends StatelessWidget {
  NurseAppointmentCheckout({Key? key}) : super(key: key);
  final RozarPayController _rozarPayController = Get.put(RozarPayController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: MyTheme.ThemeColors,
        //   title: Text(
        //     'APPOINTMENT',
        //     style: GoogleFonts.nunitoSans(
        //       fontSize: size.width * 0.06,
        //       color: MyTheme.blueww,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   leading: InkWell(
        //     onTap: () {
        //       Get.back();
        //     },
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: MyTheme.blueww,
        //       size: size.height * 0.027,
        //     ),
        //   ),
        // ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: size.height * 0.12,
                color: Color(0xff11f2ec),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.04,
                    ),

                    // SizedBox(
                    //   height: size.height * 0.05,
                    // ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                color: MyTheme.blueww,
                                size: size.height * 0.027,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.06,
                            ),
                            Text(
                              'Book  Doctor\'s  Appoinmtment',
                              style: GoogleFonts.lato(
                                fontSize: size.width * 0.05,
                                color: MyTheme.blueww,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  //Get.to(() => DoctorListUser());
                },
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.007),
                  child: Container(
                    height: size.height * 0.19,
                    width: size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.006),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              lightPrimary2,
                              darkPrimary2,
                            ]),
                        // color: Color(0xff11f2ec),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 0,
                            spreadRadius: 0,
                          ),
                          const BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 0,
                            spreadRadius: 0,
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: size.width * 0.24,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                //catimage[index], height: size.height * 0.08,
                                //productimage[index],
                                "lib/assets/icons/doctor1.png",
                                height: size.height * 0.12,
                              ),
                              Spacer(),
                              Text(
                                'Fees: ₹ 500',
                                //doctorcatagary[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.blueww,
                                  fontSize: size.width * 0.04,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.06,
                        ),
                        SizedBox(
                          width: size.width * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: size.height * 0.022,
                              ),
                              Text(
                                'Dr. Kumar Prince',
                                //doctorcatagary[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: MyTheme.blueww,
                                  fontSize: size.height * 0.022,
                                ),
                              ),
                              Text(
                                'Cardiologist',
                                //doctorcatagary[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade700,
                                  fontSize: size.height * 0.017,
                                ),
                              ),
                              Text(
                                'Experenced: 2 yr',
                                //doctorcatagary[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: MyTheme.containercolor14,
                                  fontSize: size.height * 0.017,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.000,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.002,
              ),
              InkWell(
                onTap: () {
                  //Get.to(() => DoctorListUser());
                },
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.007),
                  child: Container(
                    height: size.height * 0.10,
                    width: size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.006),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              lightPrimary2,
                              darkPrimary2,
                            ]),
                        // color: Color(0xff11f2ec),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 0,
                            spreadRadius: 0,
                          ),
                          const BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 0,
                            spreadRadius: 0,
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: size.width * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Selected Date:',
                                  //doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: MyTheme.blueww,
                                    fontSize: size.height * 0.022,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Selected Time:',
                                  //doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: MyTheme.containercolor14,
                                    fontSize: size.height * 0.021,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.000,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: size.width * 0.30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nov 26, 2022',
                                  //doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: MyTheme.blueww,
                                    fontSize: size.height * 0.022,
                                  ),
                                ),

                                Text(
                                  '15:30',
                                  //doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: MyTheme.containercolor14,
                                    fontSize: size.height * 0.021,
                                  ),
                                ),
                                // SizedBox(
                                //   height: size.height * 0.000,
                                // ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: size.width * 0.06,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.002,
              ),
              InkWell(
                onTap: () {
                  //Get.to(() => DoctorListUser());
                },
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.007),
                  child: Container(
                    height: size.height * 0.14,
                    width: size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.006),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              lightPrimary2,
                              darkPrimary2,
                            ]),
                        // color: Color(0xff11f2ec),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 0,
                            spreadRadius: 0,
                          ),
                          const BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 0,
                            spreadRadius: 0,
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: size.width * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Cost',
                                  //doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: MyTheme.blueww,
                                    fontSize: size.height * 0.022,
                                  ),
                                ),
                                Text(
                                  'Session Fees for 30 minutes.',
                                  //doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                    fontSize: size.height * 0.017,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'To pay:',
                                  //doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: MyTheme.containercolor14,
                                    fontSize: size.height * 0.021,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.000,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: size.width * 0.30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '₹ 500',
                                  //doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: MyTheme.blueww,
                                    fontSize: size.height * 0.022,
                                  ),
                                ),
                                Text(
                                  '',
                                  //doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                    fontSize: size.height * 0.017,
                                  ),
                                ),
                                Text(
                                  '₹ 500',
                                  //doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: MyTheme.containercolor14,
                                    fontSize: size.height * 0.021,
                                  ),
                                ),
                                // SizedBox(
                                //   height: size.height * 0.000,
                                // ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: size.width * 0.06,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              PhysicalModel(
                color: Colors.transparent,
                elevation: 3,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () {
                    _rozarPayController.openCheckout();
                    print('okokokopayment');
                    //Get.to(() => AppointmentCheckout());
                  },
                  child: Container(
                    height: size.height * 0.055,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: MyTheme.containercolor4,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'PAY  NOW',
                        //doctorcatagary[index],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: MyTheme.blueww,
                          fontSize: size.height * 0.022,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
