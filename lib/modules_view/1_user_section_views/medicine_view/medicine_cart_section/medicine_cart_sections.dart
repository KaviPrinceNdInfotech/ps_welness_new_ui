import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/medicine_controllers/medicine_list_controllers/medicine_list_controller.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/medicine_view/medicine_address_list/medicine_address_list_view.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/medicine_view/search_section/search_medicine.dart';

import '../../../../constants/constants/constants.dart';
import '../../../../constants/my_theme.dart';
import '../../../../controllers/1_user_view_controller/medicine_controllers/medicine_address_controller/medicine_address_controller.dart';
import '../../../../controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';
import '../../../../widgets/circular_loader.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';

class MedicineCart extends StatelessWidget {
  MedicineCart({Key? key}) : super(key: key);
  MedicineCartListController _medicineCartListController =
      Get.put(MedicineCartListController());
  MedicineListController _medicineListController =
      Get.put(MedicineListController());
  medicine_addresssList_Controller _medicine_addresslist_controller =
      Get.put(medicine_addresssList_Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;
    // Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        _medicineListController.update();
        _medicineListController.medicineListApi();
        CallLoader.loader();
        await Future.delayed(Duration(milliseconds: 900));
        CallLoader.hideLoader();
        //  Get.back();
        Get.to(SearchMedicine());
        //SignUpList
        //SignInScreen
        // Get.offAll(FrRegistrationCatagaryDetails());
        return shouldPop;
      },
      child: Scaffold(
        backgroundColor: MyTheme.ThemeColors,
        body: Obx(
          () => (_medicineCartListController.isLoading.value)
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              //     :
              : SafeArea(
                  child: Container(
                    height: size.height,
                    width: size.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05,
                              vertical: size.height * 0.03),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () async {
                                  _medicineListController.update();
                                  _medicineListController.medicineListApi();
                                  CallLoader.loader();
                                  await Future.delayed(
                                      Duration(milliseconds: 600));
                                  CallLoader.hideLoader();
                                  //  Get.back();
                                  Get.to(SearchMedicine());
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
                                'Medicine Cart',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.02),
                              )
                            ],
                          ),
                        ),
                        Obx(
                          () => (_medicineCartListController.isLoading.value)
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: Colors.red,
                                ))
                              : _medicineCartListController
                                      .medicinecartlistmodel!.data!.isEmpty
                                  //null
                                  ? SizedBox(
                                      height: size.height / 1.5,
                                      child: Center(
                                        child: Image.network(
                                          "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExYjJrd3dveWZmcmxuM2Rlbno1bnhldW91MjBidTdrdjZ6aHZiZTlyZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/9xI13kuQllph3my5Kv/giphy.gif",
                                          height: size.height * 0.4,
                                          width: size.width * 0.6,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: size.height / 1.4,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: _medicineCartListController
                                              .medicinecartlistmodel
                                              ?.data
                                              ?.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: size.width * 0.03,
                                                  vertical:
                                                      size.height * 0.0005),
                                              child: Container(
                                                height: size.height * 0.17,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 30 / 8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
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
                                                      spreadRadius: 1,
                                                      blurRadius: 0,
                                                      color: lightShadow,
                                                    ),
                                                  ],
                                                  // image: DecorationImage(
                                                  //     image: NetworkImage(
                                                  //         'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'),
                                                  //     fit: BoxFit.cover)
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.17,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      size.width *
                                                                          0.00),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: size
                                                                            .width *
                                                                        0.03),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Medicine Name:',
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        color: MyTheme
                                                                            .blueww,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            size.width *
                                                                                0.04,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Brand Name:',
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        color: MyTheme
                                                                            .blueww,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            size.width *
                                                                                0.04,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Unit Price:',
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        color: MyTheme
                                                                            .blueww,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            size.width *
                                                                                0.04,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Final Price:',
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        color: MyTheme
                                                                            .blueww,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            size.width *
                                                                                0.04,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "${_medicineCartListController.medicinecartlistmodel?.data?[index].medicineName}"

                                                                    //"${_medicineCartListController.medicinecartlistmodel?.data?[index].medicineName}",
                                                                    //'DOLO 650',
                                                                    ,
                                                                    style: GoogleFonts
                                                                        .roboto(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade900,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.04,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${_medicineCartListController.medicinecartlistmodel?.data?[index].brandName.toString()}",
                                                                    // 'Cipla',
                                                                    style: GoogleFonts
                                                                        .roboto(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade900,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.04,
                                                                    ),
                                                                  ),

                                                                  Text(
                                                                    "${_medicineCartListController.medicinecartlistmodel?.data?[index].unitPrice.toString()}",

                                                                    //'Rs 15',
                                                                    style: GoogleFonts
                                                                        .roboto(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade900,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.04,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${_medicineCartListController.medicinecartlistmodel?.data?[index].totalPrice.toString()}",
                                                                    //'Rs 15',
                                                                    style: GoogleFonts
                                                                        .roboto(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade900,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.04,
                                                                    ),
                                                                  ),
                                                                  // Align(
                                                                  //     alignment: Alignment.centerRight,
                                                                  //     child:
                                                                  //         Icon(Icons.access_time_outlined)),
                                                                ],
                                                              ),
                                                              Container(
                                                                height:
                                                                    size.height *
                                                                        0.17,
                                                                width:
                                                                    size.width *
                                                                        0.15,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: MyTheme
                                                                      .containercolor5,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        //_medicineListController
                                                                        //  .medicineListApi();
                                                                        // _medicineCartListController
                                                                        //.cartmdedicineListApi();
                                                                        //  _medicineCartListController
                                                                        //.update();
                                                                        _medicineListController
                                                                            .medicinepluscartApi("${_medicineCartListController.medicinecartlistmodel?.data?[index].id.toString()}");
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height: size.height *
                                                                            0.04,
                                                                        width: size.width *
                                                                            0.085,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .add_circle,
                                                                          color:
                                                                              Colors.red,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: size
                                                                              .height *
                                                                          0.01,
                                                                    ),
                                                                    Obx(
                                                                      () => (_medicineCartListController
                                                                              .isLoading
                                                                              .value)
                                                                          ? Center(
                                                                              child: CircularProgressIndicator())
                                                                          : Container(
                                                                              height: size.height * 0.045,
                                                                              width: size.width * 0.09,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              child: Center(
                                                                                  child: Text(
                                                                                "${_medicineCartListController.medicinecartlistmodel?.data?[index].quantity.toString()}",

                                                                                //'2',
                                                                                style: TextStyle(
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ))),
                                                                    ),
                                                                    SizedBox(
                                                                      height: size
                                                                              .height *
                                                                          0.01,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        // _medicineListController
                                                                        //     .medicineListApi();
                                                                        // _medicineCartListController
                                                                        //     .cartmdedicineListApi();
                                                                        // _medicineCartListController
                                                                        //     .update();
                                                                        //medicineminuscartApi
                                                                        _medicineListController
                                                                            .medicineminuscartApi("${_medicineCartListController.medicinecartlistmodel?.data?[index].id.toString()}");
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height: size.height *
                                                                            0.04,
                                                                        width: size.width *
                                                                            0.085,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .remove_circle,
                                                                          color:
                                                                              Colors.red,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      //Spacer(),
                                                      // Align(
                                                      //     alignment: Alignment.centerRight,
                                                      //     child: PhysicalModel(
                                                      //       elevation: 15,
                                                      //       color: Colors.grey,
                                                      //       borderRadius: BorderRadius.only(
                                                      //         bottomRight: Radius.circular(10),
                                                      //         topLeft: Radius.circular(10),
                                                      //       ),
                                                      //       child: InkWell(
                                                      //         onTap: () {
                                                      //           Get.to(() => MedicineCart());
                                                      //         },
                                                      //         child: Container(
                                                      //             height: size.height * 0.036,
                                                      //             width: size.width * 0.25,
                                                      //             decoration: BoxDecoration(
                                                      //                 color: MyTheme.white,
                                                      //                 borderRadius:
                                                      //                     BorderRadius.only(
                                                      //                   bottomRight:
                                                      //                       Radius.circular(10),
                                                      //                   topLeft:
                                                      //                       Radius.circular(10),
                                                      //                 )),
                                                      //             //backgroundColor: Colors.white30,
                                                      //             child: Center(
                                                      //                 child: Row(
                                                      //               mainAxisAlignment:
                                                      //                   MainAxisAlignment.center,
                                                      //               children: [
                                                      //                 Text(
                                                      //                   'Add to cart',
                                                      //                   style: GoogleFonts.alegreya(
                                                      //                     color: MyTheme.blueww,
                                                      //                     fontWeight:
                                                      //                         FontWeight.w600,
                                                      //                   ),
                                                      //                 ),
                                                      //                 Icon(
                                                      //                   Icons.shopping_cart,
                                                      //                   size: size.height * 0.02,
                                                      //                 ),
                                                      //               ],
                                                      //             ))),
                                                      //       ),
                                                      //     )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          })),
                        ),
                        Spacer(),
                        Container(
                          height: size.height * 0.146,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1633647517075-3bdafbc7b68c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGJhY2dyb3VuZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'
                                      //'https://images.unsplash.com/photo-1488229297570-58520851e868?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGJhY2dyb3VuZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'
                                      ),
                                  fit: BoxFit.fill)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.017,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Total No Of Items:',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * 0.043),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.012,
                                      ),
                                      Text(
                                        'Total Price:',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * 0.043),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Container(
                                          height: size.height * 0.04,
                                          width: size.width * 0.1,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white70),
                                          child: Center(
                                            child: Text(
                                              "${_medicineCartListController.medicinecartlistmodel?.quantity.toString()}",

                                              // '10',
                                              style: TextStyle(
                                                  color: Colors.orange.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: size.width * 0.045),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.23,
                                        height: size.height * 0.01,
                                      ),
                                      Text(
                                        '₹ '
                                        "${_medicineCartListController.medicinecartlistmodel?.totalPrice.toString()}",
                                        //'Rs150',
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * 0.045),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  _medicine_addresslist_controller
                                      .medicineaddressListApi();
                                  _medicine_addresslist_controller.update();
                                  Get.to(Medicineaddresslist());
                                  //Get.to(AddAdderessMedicine());
                                },
                                child: Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.25,
                                  decoration: BoxDecoration(
                                    color: MyTheme.containercolor17,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Book Now',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
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
