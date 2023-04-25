import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/medicine_view/medeicine_address_add/add_address_medicine.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/medicine_view/medicine_cart_section/medicine_cart_sections.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/medicine_view/medicine_checkout/medicine_checkout.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/medicine_controllers/medicine_list_controllers/medicine_list_controller.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/medicine_view/medicine_cart_section/medicine_cart_sections.dart';

import '../../../../constants/constants/constants.dart';
import '../../../../constants/my_theme.dart';
import '../../../../controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
import '../../../../controllers/1_user_view_controller/medicine_controllers/medicine_address_controller/medicine_address_controller.dart';
import '../../../../controllers/1_user_view_controller/medicine_controllers/medicine_list_controllers/medicine_list_controller.dart';
import '../../../../controllers/1_user_view_controller/nurse_history_controller/nurse_booking_history.dart';

class Medicineaddresslist extends StatelessWidget {
  Medicineaddresslist({Key? key}) : super(key: key);
  //LabListController _labListController = Get.put(LabListController());
  //final MedicineListController _medicineListController = Get.put(MedicineListController());
  //MedicineCartListController _medicineCartListController = Get.put(MedicineCartListController());

  medicine_address_Controller _medicine_address_controller = Get.put(medicine_address_Controller());

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    'Choose Address',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.02),
                  ),
                  PhysicalModel(
                    color: Colors.black,
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        Get.to(AddAdderessMedicine());
                        ///todo: add address................
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.shade600,
                          border: Border.all(color: Colors.black)
                        ),
                        //width: size.width * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              Text('Add Address',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: size.height * 0.014),
                              ),
                              Icon(Icons.add_box,color: Colors.white,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Theme(
              data: Theme.of(context)
                  .copyWith(splashColor: Colors.transparent),
              child: Obx(
                    () => (_medicine_address_controller.isLoading.isFalse)
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                  children: [
                    // Container(
                    //   height: size.height*0.06,
                    //   width: size.width*0.95,
                    //   child: TextField(
                    //
                    //     //onChanged: (value) => _medicineListController.filterProducts(value),
                    //     // controller: _nurseHistoryController
                    //     //     .appointmentController1,
                    //     onTap: () {
                    //       // _nurseHistoryController.chooseDate();
                    //     },
                    //     autofocus: false,
                    //     style: TextStyle(
                    //         fontSize: 15.0, color: MyTheme.blueww),
                    //     decoration: InputDecoration(
                    //       prefixIcon: Icon(Icons.search),
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       hintText: 'Search medicine..',
                    //       contentPadding: const EdgeInsets.only(
                    //           left: 10.0, bottom: 12.0, top: 15.0),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.white),
                    //         borderRadius: BorderRadius.circular(25.7),
                    //       ),
                    //       enabledBorder: UnderlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.white),
                    //         borderRadius: BorderRadius.circular(25.7),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // _medicineListController.foundProducts.value.isEmpty
                    //     ? Center(child: Text("No Result Found"))
                    //     :
                    SizedBox(
                        height: size.height*0.83,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            //_medicineListController.foundProducts.length,
                            // itemCount: _medicineListController.medicinelistmodel!.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                    vertical: size.height * 0.0005),
                                child: Container(
                                 // height: size.height * 0.2,
                                  margin: EdgeInsets.symmetric(vertical: 30 / 6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: size.height*0.18,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Name:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              'Email Id:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              'Mobile No:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),

                                            Text(
                                              'State:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              'City:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              'Location:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              'Pin:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height*0.18,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Kumar prince",
                                              //"${_medicineListController.foundProducts[index].medicineName}",
                                              // _medicineListController.medicinelistmodel!.data[index].medicineName.toString(),

                                              //'Flexion',
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              "ok@gmail.com",
                                              //'Bharat Biotech'
                                             // "${_medicineListController.foundProducts[index].brandName}",
                                              //_medicineListController.medicinelistmodel!.data[index].brandName.toString(),
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(

                                             // "${_medicineListController.foundProducts[index].medicineTypeId}",

                                              // _medicineListController.medicinelistmodel!.data[index].medicineTypeId.toString(),
                                              '7867554433',
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              //"${_medicineListController.foundProducts[index].medicineDescription}",

                                              //_medicineListController.medicinelistmodel!.data[index].medicineDescription.toString(),
                                              'Delhi',
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              //"${_medicineListController.foundProducts[index].mrp}",

                                              // _medicineListController.medicinelistmodel!.data[index].mrp.toString(),
                                              'Palam',
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              //"${_medicineListController.foundProducts[index].mrp}",

                                              // _medicineListController.medicinelistmodel!.data[index].mrp.toString(),
                                              'Palam',
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              //"${_medicineListController.foundProducts[index].mrp}",

                                              // _medicineListController.medicinelistmodel!.data[index].mrp.toString(),
                                              'Palam',
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            // Align(
                                            //     alignment: Alignment.centerRight,
                                            //     child:
                                            //         Icon(Icons.access_time_outlined)),
                                          ],
                                        ),
                                      ),
                                      Material(
                                        elevation: 2,
                                        color: Colors.black12,
                                        shadowColor: Colors.grey,
                                        borderRadius: BorderRadius.circular(100),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(CheckOutMedicine());

                                          },
                                          child: Container(
                                            height: size.height * 0.06,
                                            width: size.width * 0.13,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'lib/assets/image/43657-arrow-right.gif'),
                                                    fit: BoxFit.fitWidth)),
                                            // child: Image.asset('lib/assets/images/right-arrow.gif')
                                          ),
                                        ),
                                      ),
                                    ],
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
