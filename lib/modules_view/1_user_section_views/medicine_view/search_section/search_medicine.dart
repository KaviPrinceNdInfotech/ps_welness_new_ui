import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/medicine_view/medicine_cart_section/medicine_cart_sections.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/medicine_controllers/medicine_list_controllers/medicine_list_controller.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/medicine_view/medicine_cart_section/medicine_cart_sections.dart';

import '../../../../constants/constants/constants.dart';
import '../../../../constants/my_theme.dart';
import '../../../../controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
import '../../../../controllers/1_user_view_controller/medicine_controllers/medicine_list_controllers/medicine_list_controller.dart';
import '../../../../controllers/1_user_view_controller/nurse_history_controller/nurse_booking_history.dart';

class SearchMedicine extends StatelessWidget {
  SearchMedicine({Key? key}) : super(key: key);
  LabListController _labListController = Get.put(LabListController());
  MedicineListController _medicineListController = Get.put(MedicineListController());
  MedicineCartListController _medicineCartListController = Get.put(MedicineCartListController());



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    'Search Medicine',
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
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(splashColor: Colors.transparent),
                    child: Obx(
                      () => (_medicineListController.isLoading.value)
                          ? Center(child: CircularProgressIndicator())
                          : TextField(
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
                                hintText: 'Search medicine..',
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, bottom: 12.0, top: 0.0),
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
                  decoration: new BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(30.0)),
                      color: Colors.white),
                  width: size.width * 0.93,
                  height: size.height * 0.06,
                  margin: new EdgeInsets.fromLTRB(15, 20, 10, 20),
                  padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                ),
                // Container(
                //   height: size.height * 0.06,
                //   width: size.width * 0.2,
                //   decoration: BoxDecoration(
                //     color: MyTheme.blueww,
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   child: Center(
                //       child: Text(
                //     'Search',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: size.width * 0.035,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   )),
                // ),
              ],
            ),
            Obx(
                  () => (_medicineListController.isLoading.value)
                  ? Center(child: CircularProgressIndicator())
                  : _medicineListController.medicinelistmodel!.data ==
                  null
                  ? Center(
                child: Text('No List'),
              )
                  :

               SizedBox(
                  height: size.height * 0.73,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _medicineListController.medicinelistmodel!.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.0005),
                          child: Container(
                            height: size.height * 0.2,
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
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.145,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Medicine Name:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              'Brand Name:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              'Medicine Type Name:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              'Medicine Description:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              'Price:',
                                              style: GoogleFonts.poppins(
                                                color: MyTheme.blueww,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                          _medicineListController.medicinelistmodel!.data[index].medicineName.toString(),

                                              //'Flexion',
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              //'Bharat Biotech'
                                              _medicineListController.medicinelistmodel!.data[index].brandName.toString(),
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              _medicineListController.medicinelistmodel!.data[index].medicineTypeId.toString(),
                                              //'Capsule',
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              _medicineListController.medicinelistmodel!.data[index].medicineDescription.toString(),
                                              //'It is good medicine',
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            Text(
                                              _medicineListController.medicinelistmodel!.data[index].mrp.toString(),
                                              //'Rs 15',
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
                                      ],
                                    ),
                                  ),
                                  //Spacer(),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: PhysicalModel(
                                        elevation: 15,
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            /// Add to cart................button
                                            _medicineCartListController.addtocartApi(

                                              _medicineListController.medicinelistmodel!.data[index].id.toString(),
                                              "1",


                                            );

                                            Get.to(() => MedicineCart());
                                          },
                                          child: Container(
                                              height: size.height * 0.036,
                                              width: size.width * 0.25,
                                              decoration: BoxDecoration(
                                                  color: MyTheme.white,
                                                  borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    topLeft: Radius.circular(10),
                                                  )),
                                              //backgroundColor: Colors.white30,
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Add to cart',
                                                    style: GoogleFonts.alegreya(
                                                      color: MyTheme.blueww,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.shopping_cart,
                                                    size: size.height * 0.02,
                                                  ),
                                                ],
                                              ))),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
