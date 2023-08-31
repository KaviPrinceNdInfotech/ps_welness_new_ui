import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/invoice_views/page/pdf_page_medicine.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/drawer_contoller/medicine_history_controller/medicine_history_controller.dart';

class MedicinrHistoryUser extends StatelessWidget {
  MedicinrHistoryUser({Key? key}) : super(key: key);

  MedicineHistoryController _medicineHistoryController =
      Get.put(MedicineHistoryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: Obx(
        () => (_medicineHistoryController.isLoading.isFalse)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02),
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
                            width: size.width * 0.25,
                          ),
                          Text(
                            'Medicine History',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.02),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(30.0)),
                              color: Colors.white),
                          width: size.width * 0.89,
                          height: size.height * 0.06,
                          margin: new EdgeInsets.fromLTRB(15, 2, 10, 10),
                          padding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(splashColor: Colors.transparent),
                            child:
                                // Obx(
                                //   () => (_medicineHistoryController.isLoading.firstRebuild)
                                //       ? Center(child: CircularProgressIndicator())
                                //       :
                                TextField(
                              onChanged: (value) => _medicineHistoryController
                                  .filterMedicinehistory(value),
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 15.0, color: MyTheme.blueww),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search Medicine..',
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, bottom: 15.0, top: 12.0),
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
                        ),
                        // Material(
                        //   borderRadius: BorderRadius.circular(10),
                        //   elevation: 4,
                        //   // surfaceTintColor: Colors.yellow,
                        //   color: Colors.cyanAccent,
                        //   shadowColor: Colors.white,
                        //   child: InkWell(
                        //     onTap: () async {
                        //       CallLoader.loader();
                        //       await Future.delayed(Duration(milliseconds: 700));
                        //       CallLoader.hideLoader();
                        //       Get.to(WebViewPswebsite());
                        //     },
                        //     child: Container(
                        //       height: size.height * 0.06,
                        //       width: size.width * 0.12,
                        //       decoration: BoxDecoration(
                        //           color: Colors.cyanAccent,
                        //           borderRadius: BorderRadius.circular(10),
                        //           border: Border.all(color: Colors.cyanAccent),
                        //           image: DecorationImage(
                        //             image: NetworkImage(
                        //                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                        //             //fit: BoxFit.fitHeight,
                        //           ),
                        //           boxShadow: const [
                        //             BoxShadow(
                        //               color: Colors.cyanAccent,
                        //               offset: Offset(3, 3),
                        //               blurRadius: 0,
                        //               spreadRadius: 0,
                        //             ),
                        //             BoxShadow(
                        //               color: Colors.red,
                        //               //offset: Offset(-1, -1),
                        //               blurRadius: 0,
                        //               spreadRadius: 0,
                        //             ),
                        //           ]),
                        //       child: Lottie.network(
                        //         'https://lottie.host/722ec229-c3eb-4698-8a89-6ae23fad93ea/svf4Yjk3eL.json',
                        //         // 'https://lottie.host/8661be5e-217a-454f-ad46-ee845feaaf46/0A32qb5TKz.json',
                        //         // 'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                        //         //Lottie.asset(
                        //         //'assets/anim/developer.json',
                        //         height: 200.0,
                        //         repeat: true,
                        //         reverse: true,
                        //         animate: true,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    _medicineHistoryController
                            .foundMedicinehistory.value.isEmpty
                        //Obx(
                        //       () => (_medicineHistoryController.isLoading.value)
                        //       ? Center(child: CircularProgressIndicator())
                        //       : _medicineHistoryController.medicinelistmodel!.data ==
                        //       null
                        ? Center(
                            child: Text('No List'),
                          )
                        : Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: _medicineHistoryController
                                    .foundMedicinehistory.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                        vertical: size.height * 0.0005),
                                    child: Container(
                                      height: size.height * 0.35,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 30 / 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              lightPrimary,
                                              darkPrimary,
                                            ]),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(-2, -2),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            color: darkShadow,
                                          ),
                                          BoxShadow(
                                            offset: Offset(2, 2),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            color: lightShadow,
                                          ),
                                        ],
                                        // image: DecorationImage(
                                        //     image: NetworkImage(
                                        //         'https://images.unsplash.com/photo-1613843596852-9a6317dae0b8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1744&q=80'
                                        //         // 'https://images.unsplash.com/photo-1587854680352-936b22b91030?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fG1lZGljaW5lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                        //         // 'https://images.unsplash.com/photo-1628595351029-c2bf17511435?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fG1lZGljaW5lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                        //         ),
                                        //     fit: BoxFit.cover)
                                      ),
                                      child: Column(
                                        children: [
                                          // SizedBox(
                                          //   height: size.height * 0.1,
                                          //   child: Container(
                                          //     height: size.height * 0.09,
                                          //     width: size.width * 0.16,
                                          //     decoration: BoxDecoration(
                                          //       color: Colors.yellow.shade200,
                                          //       shape: BoxShape.circle,
                                          //       image: DecorationImage(
                                          //         image: NetworkImage(
                                          //             'https://images.unsplash.com/photo-1630094556251-2a1e50b60e7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjEyfHxtZWRpY2luZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                                          //         fit: BoxFit.cover,
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.02,
                                                vertical: size.height * 0.01),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  //height: size.height * 0.22,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Medicine Name:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Medicine Type:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Delivery date:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Paid Fees:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Brand Name:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Medicine Quantity:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Delivery Address:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Invoice Number:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.22,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        _medicineHistoryController
                                                            .foundMedicinehistory[
                                                                index]
                                                            .medicineName
                                                            .toString(),
                                                        //_medicineHistoryController.medicinelistmodel!.data[index].medicineName.toString(),
                                                        //'Dolo 650      ',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                      Text(
                                                        _medicineHistoryController
                                                            .foundMedicinehistory[
                                                                index]
                                                            .medicineTypeName
                                                            .toString(),

                                                        // _medicineHistoryController.medicinelistmodel!.data[index].medicineTypeId.toString(),

                                                        //'Nov 16,22     ',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                      Text(
                                                        _medicineHistoryController
                                                            .foundMedicinehistory[
                                                                index]
                                                            .deliveryDate
                                                            .toString(),

                                                        // _medicineHistoryController.medicinelistmodel!.data[index].medicineDescription.toString(),

                                                        //'Nov 20,22      ',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                      Text(
                                                        "₹ ${_medicineHistoryController.foundMedicinehistory[index].amount.toString()}",
                                                        //'Rs.200      ',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                      Text(
                                                        _medicineHistoryController
                                                            .foundMedicinehistory[
                                                                index]
                                                            .brandName
                                                            .toString(),

                                                        //  _medicineHistoryController.medicinelistmodel!.data[index].brandName.toString(),
                                                        //'Cipla     ',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                      Text(
                                                        _medicineHistoryController
                                                            .foundMedicinehistory[
                                                                index]
                                                            .quantity
                                                            .toString(),

                                                        //  _medicineHistoryController.medicinelistmodel!.data[index].brandName.toString(),
                                                        //'Cipla     ',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                      SizedBox(
                                                        height: size.height *
                                                            0.0266,
                                                        width:
                                                            size.width * 0.518,
                                                        child: Center(
                                                          child: Text(
                                                            _medicineHistoryController
                                                                .foundMedicinehistory[
                                                                    index]
                                                                .deliveryAddress
                                                                .toString(),

                                                            //  _medicineHistoryController.medicinelistmodel!.data[index].brandName.toString(),
                                                            //'Cipla     ',
                                                            style: GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.027),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        _medicineHistoryController
                                                            .foundMedicinehistory[
                                                                index]
                                                            .invoiceNumber
                                                            .toString(),

                                                        //  _medicineHistoryController.medicinelistmodel!.data[index].brandName.toString(),
                                                        //'Cipla     ',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              height: size.height * 0.09,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      height:
                                                          size.height * 0.03,
                                                      width: size.width * 0.15,
                                                      child: Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        elevation: 0,
                                                        // surfaceTintColor: Colors.yellow,
                                                        color:
                                                            Colors.transparent,
                                                        shadowColor:
                                                            Colors.transparent,
                                                        child: InkWell(
                                                          onTap: () async {
                                                            //CallLoader.loader();
                                                            // await Future.delayed(Duration(milliseconds: 700));
                                                            //CallLoader.hideLoader();
                                                            //Get.to(PdfPageLab(),
                                                            //Get.to(() => PdfPageLab(), //next page class

                                                            /// Get.to(() => PdfPage(), //next page class
                                                            // duration: Duration(
                                                            //     milliseconds:
                                                            //     300), //duration of transitions, default 1 sec
                                                            // transition:
                                                            // // Transition.leftToRight //transition effect
                                                            // // Transition.fadeIn
                                                            // //Transition.size
                                                            // Transition.zoom);
                                                            // Get.to(WebViewPswebsite());
                                                          },
                                                          child: Center(
                                                            child: Container(
                                                              height:
                                                                  size.height *
                                                                      0.04,
                                                              width:
                                                                  size.width *
                                                                      0.15,
                                                              // decoration: BoxDecoration(
                                                              //     color: Colors
                                                              //         .white38,
                                                              //     borderRadius:
                                                              //         BorderRadius
                                                              //             .circular(
                                                              //                 10),
                                                              //     border: Border.all(
                                                              //         color: Colors
                                                              //             .red),
                                                              //     // image: DecorationImage(
                                                              //     //   image: NetworkImage(
                                                              //     //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                                                              //     //   //fit: BoxFit.fitHeight,
                                                              //     // ),
                                                              //     boxShadow: const [
                                                              //       BoxShadow(
                                                              //         color: Colors
                                                              //             .red,
                                                              //         offset:
                                                              //             Offset(
                                                              //                 3,
                                                              //                 3),
                                                              //         blurRadius:
                                                              //             0,
                                                              //         spreadRadius:
                                                              //             0,
                                                              //       ),
                                                              //       BoxShadow(
                                                              //         color: Colors
                                                              //             .red,
                                                              //         //offset: Offset(-1, -1),
                                                              //         blurRadius:
                                                              //             0,
                                                              //         spreadRadius:
                                                              //             0,
                                                              //       ),
                                                              //     ]),
                                                              // child: const Center(
                                                              //     child: Text(
                                                              //         'Cancel')),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Material(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      elevation: 4,
                                                      // surfaceTintColor: Colors.yellow,
                                                      color: Colors.cyanAccent,
                                                      shadowColor: Colors.white,
                                                      child: InkWell(
                                                        onTap: () async {
                                                          CallLoader.loader();
                                                          await Future.delayed(
                                                              Duration(
                                                                  milliseconds:
                                                                      700));
                                                          CallLoader
                                                              .hideLoader();
                                                          //Get.to(PdfPageLab(),
                                                          Get.to(
                                                              () =>
                                                                  PdfPageMedicine(), //next page class

                                                              /// Get.to(() => PdfPage(), //next page class
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300), //duration of transitions, default 1 sec
                                                              transition:
                                                                  // Transition.leftToRight //transition effect
                                                                  // Transition.fadeIn
                                                                  //Transition.size
                                                                  Transition
                                                                      .zoom);
                                                          // Get.to(WebViewPswebsite());
                                                        },
                                                        child: Container(
                                                          height: size.height *
                                                              0.06,
                                                          width:
                                                              size.width * 0.12,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .cyanAccent,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .red),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: NetworkImage(
                                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                                                                    //fit: BoxFit.fitHeight,
                                                                  ),
                                                                  boxShadow: const [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .red,
                                                                  offset:
                                                                      Offset(
                                                                          3, 3),
                                                                  blurRadius: 0,
                                                                  spreadRadius:
                                                                      0,
                                                                ),
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .red,
                                                                  //offset: Offset(-1, -1),
                                                                  blurRadius: 0,
                                                                  spreadRadius:
                                                                      0,
                                                                ),
                                                              ]),
                                                          child: Lottie.network(
                                                            'https://lottie.host/722ec229-c3eb-4698-8a89-6ae23fad93ea/svf4Yjk3eL.json',
                                                            // 'https://lottie.host/8661be5e-217a-454f-ad46-ee845feaaf46/0A32qb5TKz.json',
                                                            // 'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                                                            //Lottie.asset(
                                                            //'assets/anim/developer.json',
                                                            height: 200.0,
                                                            repeat: true,
                                                            reverse: true,
                                                            animate: true,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                              // Container(
                                              //   height: size.height * 0.3,
                                              //   width: size.width * 0.3,
                                              //   decoration: BoxDecoration(
                                              //     color: Colors.yellow.shade200,
                                              //     shape: BoxShape.circle,
                                              //     image: DecorationImage(
                                              //       image: NetworkImage(
                                              //           'https://images.unsplash.com/photo-1579154204601-01588f351e67?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
                                              //           //'https://images.unsplash.com/photo-1630094556251-2a1e50b60e7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjEyfHxtZWRpY2luZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'
                                              //           ),
                                              //       fit: BoxFit.cover,
                                              //     ),
                                              //   ),
                                              // ),
                                              ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                    //),
                  ],
                ),
              ),
      ),
    );
  }
}
