import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/constants/constants.dart';
import '../../../../constants/my_theme.dart';
import '../../../../controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';

class MedicineCart extends StatelessWidget {
  MedicineCart({Key? key}) : super(key: key);
  MedicineCartListController _medicineCartListController =
      Get.put(MedicineCartListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: Obx(
        () => (_medicineCartListController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
              child: SafeArea(

                  child: Container(
                    height: size.height,
                    width: size.width,
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
                                width: size.width * 0.03,
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
                              ? Center(child: CircularProgressIndicator())
                              : _medicineCartListController.medicinecartlistmodel!
                                          .medicineCartDetail.medicineCart ==
                                      null
                                  ? Center(
                                      child: Text('No List'),
                                    )
                                  : SizedBox(
                                      height: size.height * 0.73,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: _medicineCartListController
                                              .medicinecartlistmodel!
                                              .medicineCartDetail
                                              .medicineCart
                                              .length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: size.width * 0.03,
                                                  vertical: size.height * 0.0005),
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
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'
                                                            //'https://images.unsplash.com/photo-1558379466-bed9e35ee7cb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60'
                                                            //'https://images.unsplash.com/photo-1618556658017-fd9c732d1360?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60'
                                                            // 'https://images.unsplash.com/photo-1558433916-90a36b44753f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGJhY2dyb3VuZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'
                                                            //'https://images.unsplash.com/photo-1625014053925-88bef4805a76?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60'
                                                            //'https://images.unsplash.com/photo-1617791160588-241658c0f566?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                                            // 'https://images.unsplash.com/photo-1618005198919-d3d4b5a92ead?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80'
                                                            //'https://images.unsplash.com/photo-1633596683562-4a47eb4983c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80'
                                                            //'https://images.unsplash.com/photo-1600414428654-bdee5b7af614?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1673&q=80'
                                                            //'https://images.unsplash.com/photo-1524072704778-007808d701d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=820&q=80'
                                                            // 'https://images.unsplash.com/photo-1628771065518-0d82f1938462?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
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
                                                                padding: EdgeInsets
                                                                    .only(
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
                                                                            FontWeight
                                                                                .w600,
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
                                                                            FontWeight
                                                                                .w600,
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
                                                                            FontWeight
                                                                                .w600,
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
                                                                            FontWeight
                                                                                .w600,
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
                                                                    _medicineCartListController
                                                                        .medicinecartlistmodel!
                                                                        .medicineCartDetail
                                                                        .medicineCart[
                                                                            index]
                                                                        .medicineName
                                                                        .toString(),
                                                                    //'DOLO 650',
                                                                    style:
                                                                        GoogleFonts
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
                                                                    _medicineCartListController
                                                                        .medicinecartlistmodel!
                                                                        .medicineCartDetail
                                                                        .medicineCart[
                                                                            index]
                                                                        .brandName
                                                                        .toString(),
                                                                    // 'Cipla',
                                                                    style:
                                                                        GoogleFonts
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
                                                                    _medicineCartListController
                                                                        .medicinecartlistmodel!
                                                                        .medicineCartDetail
                                                                        .medicineCart[
                                                                            index]
                                                                        .unitPrice
                                                                        .toString(),
                                                                    //'Rs 15',
                                                                    style:
                                                                        GoogleFonts
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
                                                                    _medicineCartListController
                                                                        .medicinecartlistmodel!
                                                                        .medicineCartDetail
                                                                        .medicineCart[
                                                                            index]
                                                                        .totalPrice
                                                                        .toString(),
                                                                    //'Rs 15',
                                                                    style:
                                                                        GoogleFonts
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
                                                                    bottomRight: Radius
                                                                        .circular(
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
                                                                    Container(
                                                                      height: size
                                                                              .height *
                                                                          0.04,
                                                                      width: size
                                                                              .width *
                                                                          0.085,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                      ),
                                                                      child: Icon(
                                                                        Icons
                                                                            .add_circle,
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: size
                                                                              .height *
                                                                          0.01,
                                                                    ),
                                                                    Container(
                                                                        height: size
                                                                                .height *
                                                                            0.045,
                                                                        width: size
                                                                                .width *
                                                                            0.09,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        child: Center(
                                                                            child: Text(
                                                                          _medicineCartListController
                                                                              .medicinecartlistmodel!
                                                                              .medicineCartDetail
                                                                              .medicineCart[index]
                                                                              .quantity
                                                                              .toString(),

                                                                          //'2',
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ))),
                                                                    SizedBox(
                                                                      height: size
                                                                              .height *
                                                                          0.01,
                                                                    ),
                                                                    Container(
                                                                      height: size
                                                                              .height *
                                                                          0.04,
                                                                      width: size
                                                                              .width *
                                                                          0.085,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                      ),
                                                                      child: Icon(
                                                                        Icons
                                                                            .remove_circle,
                                                                        color: Colors
                                                                            .red,
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
                        Container(
                          height: size.height * 0.14,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Total No Of Items:',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * 0.04),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Text(
                                        'Total Price:',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * 0.04),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.23,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                              _medicineCartListController
                                                  .medicinecartlistmodel!
                                                  .medicineCartDetail
                                                  .totalProductsInCart
                                                  .toString(),
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
                                        height: size.height * 0.02,
                                      ),
                                      Text(
                                        '₹ ${_medicineCartListController.medicinecartlistmodel!.medicineCartDetail.grandTotal.toString()}',
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
                              Container(
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
