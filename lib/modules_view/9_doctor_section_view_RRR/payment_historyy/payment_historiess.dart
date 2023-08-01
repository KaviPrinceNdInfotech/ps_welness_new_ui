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
      body: Obx(
        //_paymentViewControllers.foundPaymentdr.isEmpty
        //                         ? Center(child: Text("No Result Found"))
        //                         : Expanded(
        () => _paymentViewControllers.isLoading.isFalse
            ? const Center(
                child: CircularProgressIndicator(),
              )
            // : _paymentViewControllers.foundPaymentdr == null
            //     ? Center(child: Text("No list"))
            : SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.023,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                    Container(
                      height: size.height * 0.06,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.white),
                      width: size.width,
                      // height: size.height * 0.06,
                      margin: const EdgeInsets.fromLTRB(10, 20, 15, 10),
                      padding: const EdgeInsets.fromLTRB(12, 6, 8, 8),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          autofocus: false,
                          style:
                              TextStyle(fontSize: 15.0, color: MyTheme.blueww),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search name',
                            contentPadding: const EdgeInsets.only(
                                left: 10.0, bottom: 2.0, top: 0.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                          onChanged: (value) => _paymentViewControllers
                              .filterpaymentProducts(value),
                          // onChanged: (value) =>
                          //     doctorHomepageController
                          //         .filterProducts(value),
                        ),
                      ),
                    ),
                    // Obx(
                    //   () => (_paymentViewControllers.isLoading.value)
                    //       ? Center(child: CircularProgressIndicator())
                    _paymentViewControllers.foundPaymentdr.isEmpty
                        ? Center(child: Text("No Result"))
                        : Expanded(
                            //height: size.height * 0.75,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: _paymentViewControllers
                                    .foundPaymentdr.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var items = _paymentViewControllers
                                      .foundPaymentdr?[index];
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                        vertical: size.height * 0.0005),
                                    child: Container(
                                      height: size.height * 0.25,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 30 / 6),
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
                                                    fontSize:
                                                        size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Patient Name:',
                                                  style: GoogleFonts.poppins(
                                                    color: MyTheme.blueww,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Location :',
                                                  style: GoogleFonts.poppins(
                                                    color: MyTheme.blueww,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Amount :',
                                                  style: GoogleFonts.poppins(
                                                    color: MyTheme.blueww,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Payment Date :',
                                                  style: GoogleFonts.poppins(
                                                    color: MyTheme.blueww,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Payment Id :',
                                                  style: GoogleFonts.poppins(
                                                    color: MyTheme.blueww,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        size.width * 0.035,
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
                                                  "${_paymentViewControllers.foundPaymentdr?[index].id}",

                                                  // '${items?.id}',
                                                  style: GoogleFonts.raleway(
                                                      color:
                                                          Colors.red.shade300,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.035),
                                                ),
                                                Text(
                                                  "${_paymentViewControllers.foundPaymentdr?[index].patientName}",
                                                  style: GoogleFonts.raleway(
                                                      color:
                                                          Colors.red.shade300,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.035),
                                                ),
                                                Text(
                                                  "${_paymentViewControllers.foundPaymentdr?[index].location}",
                                                  style: GoogleFonts.raleway(
                                                      color:
                                                          Colors.red.shade300,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.035),
                                                ),
                                                Text(
                                                  "${_paymentViewControllers.foundPaymentdr?[index].amount}",
                                                  style: GoogleFonts.raleway(
                                                      color:
                                                          Colors.red.shade300,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.035),
                                                ),
                                                Text(
                                                  "${_paymentViewControllers.foundPaymentdr?[index].paymentDate}",
                                                  style: GoogleFonts.raleway(
                                                      color:
                                                          Colors.red.shade300,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.035),
                                                ),
                                                Text(
                                                  "${_paymentViewControllers.foundPaymentdr?[index].paymentId}",
                                                  style: GoogleFonts.raleway(
                                                      color:
                                                          Colors.red.shade300,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.035),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                  ],
                ),
              ),
      ),
      //  ),
    );
  }
}
