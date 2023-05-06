import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwa_payment_report_controller/rwa_payment_controllerss.dart';
//import 'package:ps_welness_new_ui/controllers/5_rwa_controller/rwa_payment_report_controller/rwa_payment_controllerss.dart';

class RwaPaymentHistory extends StatelessWidget {
  RwaPaymentHistory({Key? key}) : super(key: key);

  RwapaymentController _rwapaymentController = Get.put(RwapaymentController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child:
      Scaffold(
        backgroundColor: Colors.transparent,
        body:
        SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -size.height * 0.081,
                right: -size.width * 0.124,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.26,
                    width: size.width * 0.75,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/paymhis1.png',
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
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: size.height * 0.026,
                            color: MyTheme.blueww,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          'Payment LIST',
                          style: GoogleFonts.alatsi(
                              fontSize: size.height * 0.032,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff023382)),
                        ),
                      ],
                    ),
                  ),
                //  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.01),
                    child: Row(
                      children: [
                        Container(
                          //height: size.height * 0.02,
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(30.0)),
                              color: Colors.white30),
                          width: size.width * 0.72,
                          height: size.height * 0.06,
                          margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                          padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(splashColor: Colors.transparent),
                            child:
                            Obx(
                              () => (_rwapaymentController.isLoading.value)
                                  ? Center(child: CircularProgressIndicator())
                                  :
                              TextField(
                                      controller: _rwapaymentController
                                          .appointmentController,
                                      onTap: () {
                                        _rwapaymentController.chooseDate();
                                      },
                                      autofocus: false,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: MyTheme.blueww),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.search),
                                        filled: true,
                                        fillColor: Colors.white30,
                                        hintText: 'dd-mm-yyyy',
                                        contentPadding: const EdgeInsets.only(
                                            left: 10.0, bottom: 12.0, top: 0.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white30),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white30),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.06,
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            //gradient: MyTheme.sweepGradient1,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                              child: Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Obx(()=> _rwapaymentController.isLoading.value
                      ? Center(child: CircularProgressIndicator(),)
                    : SizedBox(
                        height: size.height * 0.71,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _rwapaymentController.getRwaPaymentReport?.rwaPaymentReport?.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = _rwapaymentController.getRwaPaymentReport?.rwaPaymentReport;
                              print("UIIIIIIIIIIIII: ${item?[index].paymentDate}");
                              return
                                Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.0005),
                                child: Container(
                                  height: size.height * 0.25,
                                  margin: const EdgeInsets.symmetric(vertical: 30 / 5),
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1628527304948-06157ee3c8a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGF5bWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(-0, -0),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.green.shade300,
                                      ),
                                      BoxShadow(
                                        offset: Offset(4, 4),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.cyan.shade700,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    //clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        top: -70,
                                        right: 260,
                                        child: Container(
                                          height: size.height * 0.2,
                                          width: size.width * 0.4,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: MyTheme.gradient5,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -100,
                                        left: 260,
                                        child: Container(
                                          height: size.height * 0.22,
                                          width: size.width * 0.42,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            //color: Colors.blueGrey,
                                            gradient: MyTheme.gradient3,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceAround,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Name:',
                                                  style: GoogleFonts.poppins(
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontSize:
                                                    size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Bank :',
                                                  style: GoogleFonts.poppins(
                                                    // color: MyTheme.text1,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontSize:
                                                    size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Paid Amount:',
                                                  style: GoogleFonts.poppins(
                                                    //color: MyTheme.text1,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontSize:
                                                    size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Payment Id:',
                                                  style: GoogleFonts.poppins(
                                                    //color: MyTheme.text1,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontSize:
                                                    size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Date:',
                                                  style: GoogleFonts.poppins(
                                                    //color: MyTheme.text1,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontSize:
                                                    size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Time:',
                                                  style: GoogleFonts.poppins(
                                                    //color: MyTheme.text1,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontSize:
                                                    size.width * 0.035,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text( '${item?[index].patientName.toString()}',
                                                  style: GoogleFonts.raleway(
                                                      color: MyTheme.white,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize:
                                                      size.width * 0.035),
                                                ),
                                                Text('${item?[index].bankName}',
                                                  style: GoogleFonts.raleway(
                                                      color: MyTheme.white,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize:
                                                      size.width * 0.035),
                                                ),
                                                Text(
                                                  '₹  ${item?[index].paidAmount}',
                                                  style: GoogleFonts.raleway(
                                                      color: MyTheme.white,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize:
                                                      size.width * 0.035),
                                                ),
                                                Text(
                                                  '9009khjkn',
                                                  style: GoogleFonts.raleway(
                                                      color: MyTheme.white,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize:
                                                      size.width * 0.035),
                                                ),
                                                Text('${item?[index].paymentDate}',
                                                  style: GoogleFonts.raleway(
                                                      color: MyTheme.white,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize:
                                                      size.width * 0.035),
                                                ),
                                                Text('${item?[index].paymentTime}',
                                                  style: GoogleFonts.raleway(
                                                      color: MyTheme.white,
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
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}
