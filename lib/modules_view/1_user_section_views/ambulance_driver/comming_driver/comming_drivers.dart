import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/ambulance/coming_driver/coming_driver.dart';

class ComingDriver extends StatelessWidget {
  // final String id;
  ComingDriver({
    Key? key,
    //required this.id
  }) : super(key: key);

  CommingDriverController _commingDriverController =
      Get.put(CommingDriverController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var base = 'http://test.pswellness.in/Images/';

    ///todo: maths logoc....
    // final driverFee =
    //     _commingDriverController.getDrivercomingDetail?.totalPrice ?? 00;
    // //print("${element.price * element.step} c");
    // final driverFeesdiscount = (_commingDriverController
    //             .getDrivercomingDetail?.totalPrice
    //             ?.toDouble() ??
    //         00)! *
    //     (90 / 100);
    // final finaldriverAmounts = driverFee - driverFeesdiscount;
    // var finalamtdriver =
    //     double.parse("${driverFee.toDouble() - driverFeesdiscount.toDouble()}");
    // print("driverfees:${driverFee}");
    // print("driverdiscount:${driverFeesdiscount}");
    // print("drivertotal:${finaldriverAmounts}");

    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Obx(
            () => (_commingDriverController.isLoading.value)
                ? const Center(child: CircularProgressIndicator())
                : _commingDriverController.getDrivercomingDetail?.driverName ==
                        null
                    ? const Center(
                        child: Text('No Data'),
                      )
                    : Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -size.height * 0.04,
                            //bottom: size.height * 0.64,
                            //left: -30,
                            right: -size.width * 0.024,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                height: size.height * 0.20,
                                width: size.width * 0.5,
                                decoration: BoxDecoration(
                                    //color: Colors.,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'lib/assets/image/psambulance.png',
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.02),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        height: size.height * 0.03,
                                        width: size.width * 0.1,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red.shade300,
                                        ),
                                        child: Icon(
                                          Icons.arrow_back_ios_outlined,
                                          size: size.height * 0.022,
                                          color: MyTheme.blueww,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Text(
                                      'Your Ambulance is \n coming......',
                                      style: GoogleFonts.alatsi(
                                          fontSize: size.height * 0.022,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff023382)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              //Spacer(),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.0005),
                                child: Container(
                                  height: size.height * 0.58,
                                  margin:
                                      EdgeInsets.symmetric(vertical: 30 / 5),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                        fit: BoxFit.fill),
                                    //color: MyTheme.containercolor8,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(-0, -0),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.grey.shade100,

                                        // color: darkShadow1,
                                      ),
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.grey.shade200,
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    height: size.height * 0.093,
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(
                                        vertical: size.width * 0.0 / 05),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xffF0F3F8),
                                              Color(0xffF0F3F8)
                                              //darkPrimary,
                                            ]),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(2, 2),
                                            spreadRadius: 1,
                                            blurRadius: 0,
                                            color: Colors.grey.shade200,
                                          ),
                                          BoxShadow(
                                            offset: Offset(2, 2),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            color: Colors.grey.shade500,
                                          ),
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.verified,
                                                color: Color(0xff12BFC4),
                                              ),
                                              Text(
                                                "${_commingDriverController.getDrivercomingDetail?.driverName.toString()}",

                                                /// "Kumar Prince",
                                                // 'Kumar Prince',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: size.width * 0.06,
                                                  fontWeight: FontWeight.w700,
                                                  color: MyTheme.blueww,
                                                ),
                                              ),
                                              Spacer(),

                                              ///images...
                                              Container(
                                                height: size.height * 0.12,
                                                width: size.width * 0.2,
                                                decoration: BoxDecoration(
                                                  color: Colors.yellow.shade800,
                                                  shape: BoxShape.circle,
                                                  // image: DecorationImage(
                                                  //   fit: BoxFit.fill,
                                                  //   image: NetworkImage(
                                                  //     "$base${_driverAcceptlistController.getDriveracceptDetail?.driverImage.toString()}",
                                                  //     // 'https://wallpaperaccess.com/full/2440003.jpg'
                                                  //   ),
                                                  // )

                                                  ///

                                                  //Image.network(
                                                  //                      base +
                                                  //                                         '${_labreportviewController.labreportimage?.labViewReportFile?[index].file.toString()}',
                                                ),

                                                ///
                                                child: Container(
                                                  height: size.height * 0.12,
                                                  width: size.width * 0.18,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black38),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ClipRect(
                                                    child: CachedNetworkImage(
                                                      imageUrl: base +
                                                          '${_commingDriverController.getDrivercomingDetail?.driverImage}',
                                                      //'https://pbs.twimg.com/profile_images/945853318273761280/0U40alJG_400x400.jpg',
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                      placeholder: (context,
                                                              url) =>
                                                          CircularProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                    // CachedNetworkImage(
                                                    //   imageUrl: base +
                                                    //       "${_driverAcceptlistController.getDriveracceptDetail?.driverImage.toString()}",
                                                    //   fit: BoxFit.fill,
                                                    //   placeholder: (context, url) =>
                                                    //       Container(
                                                    //           height: size.height *
                                                    //               0.17,
                                                    //           width:
                                                    //               size.width * 0.36,
                                                    //
                                                    //           //width: 4.w,
                                                    //           child: Center(
                                                    //             child: Image.asset(
                                                    //               "lib/assets/icons/drdriver.png",
                                                    //               fit: BoxFit.fill,
                                                    //               height:
                                                    //                   size.height *
                                                    //                       0.17,
                                                    //             ),
                                                    //             //CircularProgressIndicator()
                                                    //           )),
                                                    //   errorWidget:
                                                    //       (context, url, error) =>
                                                    //           Icon(
                                                    //     Icons.error,
                                                    //     color: Colors.red,
                                                    //   ),
                                                    // ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.0,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Mobile:',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              // Icon(
                                              //   Icons
                                              //       .car_crash_sharp,
                                              //   size: size.height *
                                              //       0.02,
                                              //   color: Colors
                                              //       .grey.shade600,
                                              // ),
                                              SizedBox(
                                                width: size.width * 0.005,
                                              ),
                                              Text(
                                                "${_commingDriverController.getDrivercomingDetail?.mobileNumber}",

                                                //"934422221",
                                                //'2020 Honda Clive',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Total Distance:',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              // Icon(
                                              //   Icons
                                              //       .car_crash_sharp,
                                              //   size: size.height *
                                              //       0.02,
                                              //   color: Colors
                                              //       .grey.shade600,
                                              // ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "${_commingDriverController.getDrivercomingDetail?.toatlDistance ?? 0} Km",

                                                // "10 km.",
                                                //'2020 Honda Clive',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Total Amounts :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "\u{20B9}${_commingDriverController.getDrivercomingDetail?.totalPrice}",

                                                //"100",
                                                // '121234333377',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Paid Amounts :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "\u{20B9}${_commingDriverController.getDrivercomingDetail?.paidAmount}",

                                                //"100",
                                                // '121234333377',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          //finaldriverAmounts

                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Remaining Amounts :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "\u{20B9}${_commingDriverController.getDrivercomingDetail?.remainingAmount}",

                                                //"100",
                                                // '121234333377',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          //finaldriverAmounts
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Driver Distance :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "${_commingDriverController.getDrivercomingDetail?.driverUserDistance!.toInt()} Km",

                                                //"100",
                                                // '121234333377',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.width * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Expected Time:',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "${_commingDriverController.getDrivercomingDetail?.expectedTime!.toInt()} Min",

                                                //"100",
                                                // '121234333377',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          //finaldriverAmounts

                                          //finaldriverAmounts
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'DL Number :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "${_commingDriverController.getDrivercomingDetail?.dlNumber}",

                                                // '23344eerdd',
                                                // """Noida near nd infotech C53 Noida YY YY YY trhtrhtdsVsdvds cdsVDS""",
                                                //maxLines: 2,
                                                //'ENP 2345',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Vehicle  Number :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "${_commingDriverController.getDrivercomingDetail?.vehicleNumber}",

                                                //'BR04jjk909',
                                                // """Noida near nd infotech C53 Noida YY YY YY trhtrhtdsVsdvds cdsVDS""",
                                                // maxLines: 2,
                                                //'ENP 2345',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Vehicle Info :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              SizedBox(
                                                height: size.height * 0.05,
                                                width: size.width * 0.6,
                                                child: Text(
                                                  "${_commingDriverController.getDrivercomingDetail?.vehicleTypeName}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,

                                                  //'Maruti suzuki swift',
                                                  // """Noida near nd infotech C53 Noida YY YY YY trhtrhtdsVsdvds cdsVDS""",
                                                  //maxLines: 2,
                                                  //'ENP 2345',
                                                  //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey.shade900,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //wallet
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //Spacer(),

                              //)
                            ],
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
