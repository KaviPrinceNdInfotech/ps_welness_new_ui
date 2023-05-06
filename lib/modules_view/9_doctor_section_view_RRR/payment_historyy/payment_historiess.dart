import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_payment_controller/doctor_payment_detail_controller.dart';

//import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/doctor_payment_controller/doctor_payment_detail_controller.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/controllers/9_doctor_controllers/doctor_payment_controller/doctor_payment_detail_controller.dart';
//import '../../../controllers/9_doctor_controllers_RRR/doctor_payment_controller/doctor_payment_detail_controller.dart';

class PaymentHistory extends StatelessWidget {
  PaymentHistory({Key? key}) : super(key: key);

  final DoctorPaymentViewControllers _paymentViewControllers =
      Get.put(DoctorPaymentViewControllers());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.07,
          ),
          SizedBox(
            height: size.height * 0.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      height: size.height * 0.032,
                      width: size.width * 0.071,
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: size.height * 0.022,
                      )),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  ' Payment History Doctor',
                  style: TextStyle(
                    color: MyTheme.blueww,
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Colors.white),
                width: size.width * 0.72,
                height: size.height * 0.06,
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                padding: const EdgeInsets.fromLTRB(5, 8, 8, 8),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    //controller: _appointmentController.appointmentController,
                    onTap: () {
                      //_appointmentController.chooseDate();
                    },
                    autofocus: false,
                    style: TextStyle(fontSize: 15.0, color: MyTheme.blueww),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'dd-mm-yyyy',
                      contentPadding: const EdgeInsets.only(
                          left: 10.0, bottom: 12.0, top: 0.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.2,
                decoration: BoxDecoration(
                  color: MyTheme.blueww,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                    child: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ],
          ),
          Obx(
            () => (_paymentViewControllers.isLoading.value)
                ? Center(child: CircularProgressIndicator())
                : _paymentViewControllers.getdoctorpaymenthistory == null
                    ? Center(
                        child: Text('No List'),
                      )
                    : SizedBox(
                        height: size.height * 0.75,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              var items = _paymentViewControllers
                                  .getdoctorpaymenthistory?[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.0005),
                                child: Container(
                                  height: size.height * 0.25,
                                  margin:
                                      EdgeInsets.symmetric(vertical: 30 / 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          lightPrimary2,
                                          darkPrimary2,
                                        ]),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(-0, -0),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: darkShadow,
                                      ),
                                      BoxShadow(
                                        offset: Offset(1, 3),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Id:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.035,
                                              ),
                                            ),
                                            Text(
                                              'Patient Name:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.035,
                                              ),
                                            ),
                                            Text(
                                              'Location :',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.035,
                                              ),
                                            ),
                                            Text(
                                              'Amount :',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.035,
                                              ),
                                            ),
                                            Text(
                                              'Payment Date :',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.035,
                                              ),
                                            ),
                                            Text(
                                              'Payment Id :',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.035,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${items?.id}',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.red.shade300,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: size.width * 0.035),
                                            ),
                                            Text(
                                              '${items?.patientName}',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.red.shade300,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: size.width * 0.035),
                                            ),
                                            Text(
                                              '${items?.location}',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.red.shade300,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: size.width * 0.035),
                                            ),
                                            Text(
                                              '${items?.amount}',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.red.shade300,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: size.width * 0.035),
                                            ),
                                            Text(
                                              '${items?.paymentDate}',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.red.shade300,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: size.width * 0.035),
                                            ),
                                            Text(
                                              '${items?.paymentId}',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.red.shade300,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: size.width * 0.035),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
          ),
        ],
      ),
      //  ),
    );
  }
}
