import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';

import '../../../controllers/2_franchises_controller/franchise_payment_report/franchise_payment_report.dart';

class FranchisePaymentReport extends StatelessWidget {
  FranchisePaymentReport({Key? key}) : super(key: key);

  FranchisePaymentReportController _appointmentfranchiseController =
      Get.put(FranchisePaymentReportController());

  var items = [
    'Doctor',
    'Vehicle',
    'Nurse',
    'Lab',
    'Health Checkup',
    'Chemist',
  ];

  get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 0,
      //   title: Text('Appintment History'),
      //   backgroundColor: MyTheme.ThemeColors,
      // ),
      body: Column(
        //clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: size.height * 0.05,
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
                      decoration: BoxDecoration(
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
                  'Franchise Payment History',
                  style: TextStyle(
                    color: MyTheme.blueww,
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Obx(
                  () => DropdownButtonFormField(
                      //icon: Icon(Icons.location_city),
                      value: _appointmentfranchiseController.selectedCity.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.list_alt,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Any'),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        _appointmentfranchiseController.selectedCity.value =
                            newValue!;
                        // _hospital_2_controller.states.value =
                        //     newValue! as List<String>;
                        // _hospital_2_controller.selectedCity.value = null;
                        // _hospital_2_controller.cities.clear();
                        // _hospital_2_controller.cities
                        //     .addAll(stateCityMap[newvalue]!);
                      }),
                ),
              ),
            ),
          ),

          Row(
            children: [
              Container(
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: Obx(
                    () => (_appointmentfranchiseController.isLoading.value)
                        ? Center(child: CircularProgressIndicator())
                        : TextField(
                            controller: _appointmentfranchiseController
                                .appointmentController,
                            onTap: () {
                              _appointmentfranchiseController.chooseDate();
                            },
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 15.0, color: MyTheme.blueww),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'dd-mm-yyyy',
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
                width: size.width * 0.72,
                height: size.height * 0.06,
                margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
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

          SizedBox(
              height: size.height * 0.67,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.0005),
                      child: Container(
                        height: size.height * 0.25,
                        margin: EdgeInsets.symmetric(vertical: 30 / 9),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
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
                                offset: Offset(1, 3),
                                spreadRadius: 0,
                                blurRadius: 0,
                                color: Colors.grey,
                              ),
                            ],
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1628527304948-06157ee3c8a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGF5bWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'
                                    //'lib/assets/background_stack_png/appointment6.png'
                                    ),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Franchise Name:',
                                    style: GoogleFonts.poppins(
                                      color: MyTheme.blueww,
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.035,
                                    ),
                                  ),
                                  Text(
                                    'Paid Fees :',
                                    style: GoogleFonts.poppins(
                                      color: MyTheme.blueww,
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.035,
                                    ),
                                  ),
                                  Text(
                                    'Payment Id:',
                                    style: GoogleFonts.poppins(
                                      color: MyTheme.blueww,
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.035,
                                    ),
                                  ),
                                  Text(
                                    'Franchise Location:',
                                    style: GoogleFonts.poppins(
                                      color: MyTheme.blueww,
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.035,
                                    ),
                                  ),
                                  Text(
                                    'Payment date:',
                                    style: GoogleFonts.poppins(
                                      color: MyTheme.blueww,
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.035,
                                    ),
                                  ),
                                  Text(
                                    'Payment Timing :',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Prince Franchise',
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: size.width * 0.035),
                                  ),
                                  Text(
                                    '₹ 50000',
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: size.width * 0.035),
                                  ),
                                  Text(
                                    'jkj879',
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: size.width * 0.035),
                                  ),
                                  Text(
                                    'Sector 9,C53 Noida',
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: size.width * 0.035),
                                  ),
                                  Text(
                                    'Nov 12,22',
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: size.width * 0.035),
                                  ),
                                  Text(
                                    '08:00 pm',
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
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
          // Positioned(
          //   top: 50,
          //   child: Container(
          //     height: size.height * 0.10,
          //     width: size.width * 0.19,
          //     decoration: BoxDecoration(
          //       color: Colors.green,
          //       shape: BoxShape.circle,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
