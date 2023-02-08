import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/wallet_user_controller/wallet_controllers_user.dart';
import '../../../home_page_user_view/user_home_page.dart';

class WalletCredentials extends StatelessWidget {
  WalletCredentials({Key? key}) : super(key: key);

  Wallet_2_Controller _wallet_2_controller = Get.put(Wallet_2_Controller());

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  get newvalue => null!;

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _wallet_2_controller.walletformkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    //height: size.height * 0.02,
                    ),

                ///todo: add ammount..........

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.00,
                      vertical: size.height * 0.003),
                  child: InkWell(
                    onTap: () {
                      //Get.to(() => DoctorListUser());
                    },
                    child: Container(
                      //height: size.height * 0.5,
                      width: size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.004),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Available Balance',
                                  // doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.sunflower(
                                    fontWeight: FontWeight.bold,
                                    color: MyTheme.blueww,
                                    fontSize: size.height * 0.025,
                                  ),
                                ),
                                Text(
                                  '₹ 4500.00',
                                  // doctorcatagary[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.sunflower(
                                    fontWeight: FontWeight.bold,
                                    color: MyTheme.blueww,
                                    fontSize: size.height * 0.025,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                //height: size.height * 0.06,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 30 / 2),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          lightPrimary2,
                                          darkPrimary2,
                                        ]),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(-0, -0),
                                        spreadRadius: 1,
                                        blurRadius: 0,
                                        color: Colors.grey.shade300,
                                      ),
                                      BoxShadow(
                                        offset: Offset(3, 3),
                                        spreadRadius: 1,
                                        blurRadius: 0,
                                        color: Colors.grey.shade300,
                                      ),
                                    ]),
                                child: TextFormField(
                                  autofillHints: [
                                    AutofillHints.transactionAmount
                                  ],
                                  controller:
                                      _wallet_2_controller.ammountController,
                                  onSaved: (value) {
                                    _wallet_2_controller.amount = value!;
                                  },
                                  validator: (value) {
                                    return _wallet_2_controller
                                        .validAmount(value!);
                                  },
                                  cursorColor: Colors.black,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03),
                                    hintText: 'Ammout',
                                    helperStyle: TextStyle(
                                      color: black.withOpacity(0.7),
                                      fontSize: 18,
                                    ),
                                    // prefixIcon: Icon(
                                    //   Icons.phone_android_outlined,
                                    //   color: black.withOpacity(0.7),
                                    //   size: 20,
                                    // ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.01,
                                      vertical: size.height * 0.001),
                                  child: InkWell(
                                    onTap: () {
                                      // Get.to(() => DoctorListUser());
                                    },
                                    child: Container(
                                      height: size.height * 0.04,
                                      width: size.width * 0.15,
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.height * 0.004),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(size.height * 0.001),
                                        child: Center(
                                          child: Text(
                                            '100',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.sunflower(
                                              fontWeight: FontWeight.bold,
                                              color: MyTheme.blueww,
                                              fontSize: size.width * 0.038,
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.orange.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              offset: Offset(2, 2),
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                            ),
                                            const BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0, -0),
                                              blurRadius: 1,
                                              spreadRadius: 0,
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.01,
                                      vertical: size.height * 0.001),
                                  child: InkWell(
                                    onTap: () {
                                      // Get.to(() => DoctorListUser());
                                    },
                                    child: Container(
                                      height: size.height * 0.04,
                                      width: size.width * 0.15,
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.height * 0.004),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(size.height * 0.001),
                                        child: Center(
                                          child: Text(
                                            '200',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.sunflower(
                                              fontWeight: FontWeight.bold,
                                              color: MyTheme.blueww,
                                              fontSize: size.width * 0.038,
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.orange.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              offset: Offset(2, 2),
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                            ),
                                            const BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0, -0),
                                              blurRadius: 1,
                                              spreadRadius: 0,
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.01,
                                      vertical: size.height * 0.001),
                                  child: InkWell(
                                    onTap: () {
                                      // Get.to(() => DoctorListUser());
                                    },
                                    child: Container(
                                      height: size.height * 0.04,
                                      width: size.width * 0.15,
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.height * 0.004),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(size.height * 0.001),
                                        child: Center(
                                          child: Text(
                                            '500',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.sunflower(
                                              fontWeight: FontWeight.bold,
                                              color: MyTheme.blueww,
                                              fontSize: size.width * 0.038,
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.orange.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              offset: Offset(2, 2),
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                            ),
                                            const BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0, -0),
                                              blurRadius: 1,
                                              spreadRadius: 0,
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.01,
                                      vertical: size.height * 0.001),
                                  child: InkWell(
                                    onTap: () {
                                      // Get.to(() => DoctorListUser());
                                    },
                                    child: Container(
                                      height: size.height * 0.04,
                                      width: size.width * 0.15,
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.height * 0.004),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(size.height * 0.001),
                                        child: Center(
                                          child: Text(
                                            '1000',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.sunflower(
                                              fontWeight: FontWeight.bold,
                                              color: MyTheme.blueww,
                                              fontSize: size.width * 0.038,
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.orange.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              offset: Offset(2, 2),
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                            ),
                                            const BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0, -0),
                                              blurRadius: 1,
                                              spreadRadius: 0,
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.051),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => UserHomePage());
                              },
                              child: Container(
                                width: double.infinity,
                                height: size.height * 0.065,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          darkPrimary2,
                                          lightPrimary,
                                        ]),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        color: darkShadow,
                                      ),
                                      BoxShadow(
                                        offset: Offset(-1, -1),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        color: lightShadow,
                                      ),
                                    ]),
                                child: Center(
                                  child: Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                      fontSize: size.width * 0.049,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // RectangularButton(
                            //     text: 'SUBMIT',
                            //     press: () {
                            //       Get.to(HomePage());
                            //       //_loginpasswordController.checkLoginpassword();
                            //     }),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black38,
                              offset: Offset(5, 5),
                              blurRadius: 0,
                              spreadRadius: 0,
                            ),
                            const BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, -0),
                              blurRadius: 0,
                              spreadRadius: 0,
                            ),
                          ]),
                    ),
                  ),
                ),

                ///

                // child: DropdownButton(
                //     value: _hospital_2_controller.selectedState.value,
                //     menuMaxHeight: size.height * 0.3,
                //     items: items.map((String items) {
                //       return DropdownMenuItem(
                //         value: items,
                //         child: Text(items),
                //       );
                //     }).toList(),
                //     // _hospital_2_controller.states.map((String value) {
                //     //   return DropdownMenuItem(
                //     //     value: value,
                //     //
                //     //   )
                //     onChanged: (String? newValue) {
                //       _hospital_2_controller.states.value =
                //           newValue! as List<String>;
                //       _hospital_2_controller.selectedCity.value = null;
                //       _hospital_2_controller.cities.clear();
                //       _hospital_2_controller.cities
                //           .addAll(stateCityMap[newvalue]!);
                //     })),

                SizedBox(
                  height: size.height * 0.018,
                  //appPadding / 2,
                ),

                // GetBuilder<Hospital_2_Controller>(
                //   // specify type as Controller
                //   init: Hospital_2_Controller(), // intialize with the Controller
                //   builder: (value) => InkWell(
                //     onTap: () {
                //       _doctor_2_controller.getImage(ImageSource.gallery);
                //     },
                //     child: NeumorphicTextFieldContainer(
                //       child: Container(
                //         height: size.height * 0.07,
                //         //width: size.width * 0.5,
                //         child: Padding(
                //           padding:
                //               EdgeInsets.symmetric(horizontal: size.width * 0.1),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 'Authorise Letter Image',
                //                 style: TextStyle(
                //                   fontSize: size.width * 0.03,
                //                   fontWeight: FontWeight.w700,
                //                 ),
                //               ),
                //               Icon(Icons.camera),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
