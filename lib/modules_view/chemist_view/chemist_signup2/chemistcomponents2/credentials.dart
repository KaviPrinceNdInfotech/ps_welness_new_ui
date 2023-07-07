// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ps_welness_new_ui/constants/constants/constants.dart';
// import 'package:ps_welness_new_ui/controllers/chemist_controllers/chemist_controller_2.dart';
// import 'package:ps_welness_new_ui/controllers/hospital2_controller/hospital2_sighup_controller.dart';
// //import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
// import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
//
// import '../../../6_chemist_section_view_RRR/chemist_home/chemist_home_page.dart';
// // import 'package:ps_welness/constants/constants/constants.dart';
// // import 'package:ps_welness/controllers/chemist_controllers/chemist_controller_2.dart';
// // import 'package:ps_welness/controllers/hospital2_controller/hospital2_sighup_controller.dart';
// // import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
// // import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// // import 'package:ps_welness/widgets/widgets/rectangular_button.dart';
//
// class Chemist2Credentials extends StatelessWidget {
//   Chemist2Credentials({Key? key}) : super(key: key);
//
//   Chemist_2_Controller _chemist_2_controller = Get.put(Chemist_2_Controller());
//
//   var items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];
//
//   get newvalue => null!;
//
//   // LoginpasswordController _loginpasswordController =
//   //     Get.put(LoginpasswordController());
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Form(
//         key: _chemist_2_controller.chemist2formkey,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         child: Padding(
//           padding: EdgeInsets.all(30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                   //height: size.height * 0.02,
//                   ),
//
//               ///todo: address .................
//               NeumorphicTextFieldContainer(
//                 child: TextFormField(
//                   autofillHints: [AutofillHints.addressCityAndState],
//                   controller: _chemist_2_controller.addressController,
//                   onSaved: (value) {
//                     _chemist_2_controller.address = value!;
//                   },
//                   validator: (value) {
//                     return _chemist_2_controller.validAddress(value!);
//                   },
//                   cursorColor: Colors.black,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     hintText: 'Address',
//                     helperStyle: TextStyle(
//                       color: black.withOpacity(0.7),
//                       fontSize: 18,
//                     ),
//                     prefixIcon: Icon(
//                       Icons.location_history_outlined,
//                       color: black.withOpacity(0.7),
//                       size: 20,
//                     ),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//
//               ///Todo: state............................
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//
//               NeumorphicTextFieldContainer(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
//                   child: Obx(
//                     () => DropdownButtonFormField(
//                         value: _chemist_2_controller.selectedState.value,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.real_estate_agent,
//                             color: Colors.black,
//                           ),
//                           enabledBorder: InputBorder.none,
//                           border: InputBorder.none,
//                         ),
//                         hint: Text('Select State'),
//                         items: items.map((String items) {
//                           return DropdownMenuItem(
//                             value: items,
//                             child: Text(
//                               items,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: size.height * 0.015,
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (String? newValue) {
//                           _chemist_2_controller.selectedState.value = newValue!;
//                           // _hospital_2_controller.states.value =
//                           //     newValue! as List<String>;
//                           // _hospital_2_controller.selectedCity.value = null;
//                           // _hospital_2_controller.cities.clear();
//                           // _hospital_2_controller.cities
//                           //     .addAll(stateCityMap[newvalue]!);
//                         }),
//                   ),
//                 ),
//               ),
//
//               ///Todo: city.....................................
//
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//
//               NeumorphicTextFieldContainer(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
//                   child: Obx(
//                     () => DropdownButtonFormField(
//                         //icon: Icon(Icons.location_city),
//                         value: _chemist_2_controller.selectedCity.value,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.location_city,
//                             color: Colors.black,
//                           ),
//                           enabledBorder: InputBorder.none,
//                           border: InputBorder.none,
//                         ),
//                         hint: Text('Selected City'),
//                         items: items.map((String items) {
//                           return DropdownMenuItem(
//                             value: items,
//                             child: Text(
//                               items,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: size.height * 0.015,
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (String? newValue) {
//                           _chemist_2_controller.selectedCity.value = newValue!;
//                           // _hospital_2_controller.states.value =
//                           //     newValue! as List<String>;
//                           // _hospital_2_controller.selectedCity.value = null;
//                           // _hospital_2_controller.cities.clear();
//                           // _hospital_2_controller.cities
//                           //     .addAll(stateCityMap[newvalue]!);
//                         }),
//                   ),
//                 ),
//               ),
//
//               SizedBox(
//                 height: size.height * 0.018,
//                 //appPadding / 2,
//               ),
//
//               GetBuilder<Hospital_2_Controller>(
//                 // specify type as Controller
//                 init: Hospital_2_Controller(), // intialize with the Controller
//                 builder: (value) => InkWell(
//                   onTap: () {
//                     _chemist_2_controller.getImage(ImageSource.gallery);
//                   },
//                   child: NeumorphicTextFieldContainer(
//                     child: Container(
//                       height: size.height * 0.07,
//                       //width: size.width * 0.5,
//                       child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: size.width * 0.1),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Certificate Image',
//                               style: TextStyle(
//                                 fontSize: size.width * 0.03,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             Icon(Icons.camera_alt),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               // child: DropdownButton(
//               //     value: _hospital_2_controller.selectedState.value,
//               //     menuMaxHeight: size.height * 0.3,
//               //     items: items.map((String items) {
//               //       return DropdownMenuItem(
//               //         value: items,
//               //         child: Text(items),
//               //       );
//               //     }).toList(),
//               //     // _hospital_2_controller.states.map((String value) {
//               //     //   return DropdownMenuItem(
//               //     //     value: value,
//               //     //
//               //     //   )
//               //     onChanged: (String? newValue) {
//               //       _hospital_2_controller.states.value =
//               //           newValue! as List<String>;
//               //       _hospital_2_controller.selectedCity.value = null;
//               //       _hospital_2_controller.cities.clear();
//               //       _hospital_2_controller.cities
//               //           .addAll(stateCityMap[newvalue]!);
//               //     })),
//
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//
//               ///TODO: licence no.......................
//               NeumorphicTextFieldContainer(
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   autofillHints: [AutofillHints.name],
//                   controller: _chemist_2_controller.licencenumberController,
//                   onSaved: (value) {
//                     _chemist_2_controller.licenceno = value!;
//                   },
//                   validator: (value) {
//                     return _chemist_2_controller.validLicenceno(value!);
//                   },
//                   cursorColor: Colors.black,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     hintText: 'Licence no',
//                     helperStyle: TextStyle(
//                       color: black.withOpacity(0.7),
//                       fontSize: 18,
//                     ),
//                     prefixIcon: Icon(
//                       Icons.offline_pin_rounded,
//                       color: black.withOpacity(0.7),
//                       size: 20,
//                     ),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//
//               ///TODO: licence validation.......................
//               NeumorphicTextFieldContainer(
//                 child: TextFormField(
//                   autofillHints: [AutofillHints.creditCardNumber],
//                   controller: _chemist_2_controller.licencevalidityController,
//                   onSaved: (value) {
//                     _chemist_2_controller.licencevalidity = value!;
//                   },
//                   validator: (value) {
//                     return _chemist_2_controller.validLicencevalidity(value!);
//                   },
//                   cursorColor: Colors.black,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     hintText: 'Licence validity',
//                     helperStyle: TextStyle(
//                       color: black.withOpacity(0.7),
//                       fontSize: 18,
//                     ),
//                     prefixIcon: Icon(
//                       Icons.videogame_asset_sharp,
//                       color: black.withOpacity(0.7),
//                       size: 20,
//                     ),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//
//               ///TODO: Pin.......................................................
//               NeumorphicTextFieldContainer(
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   autofillHints: [AutofillHints.password],
//                   controller: _chemist_2_controller.pinController,
//                   onSaved: (value) {
//                     _chemist_2_controller.pin = value!;
//                   },
//                   validator: (value) {
//                     return _chemist_2_controller.validPin(value!);
//                   },
//                   cursorColor: Colors.black,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     hintText: 'Pin',
//                     helperStyle: TextStyle(
//                       color: black.withOpacity(0.7),
//                       fontSize: 18,
//                     ),
//                     prefixIcon: Icon(
//                       Icons.pin,
//                       color: black.withOpacity(0.7),
//                       size: 20,
//                     ),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//
//               RectangularButton(
//                   text: 'SUBMIT',
//                   press: () {
//                     Get.to(ChemistHomePage());
//                     //_loginpasswordController.checkLoginpassword();
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

///
///
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/chemist_controllers/chemist_controller1.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
//import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

class Chemist2Credentials extends StatelessWidget {
  Chemist2Credentials({Key? key}) : super(key: key);

  Chemist_1_Controller _chemist_1_controller = Get.put(Chemist_1_Controller());

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  get newvalue => null!;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Form(
        key: _chemist_1_controller.chemist1formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///todo: location .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.addressCityAndState],
                  controller: _chemist_1_controller.Location,
                  // onSaved: (value) {
                  //   _chemist_2_controller.address = value!;
                  // },
                  // validator: (value) {
                  //   return _chemist_2_controller.validAddress(value!);
                  // },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.location_history_outlined,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              ///Todo: state............................
              SizedBox(
                height: size.height * 0.01,
              ),
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<StateModel>(
                        value: _chemist_1_controller.selectedState.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.real_estate_agent,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select State'),
                        items: _chemist_1_controller.states
                            .map((StateModel items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items.stateName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.015,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (StateModel? newValue) {
                          _chemist_1_controller.selectedState.value = newValue!;
                        }),
                  ),
                ),
              ),

              ///Todo: city.....................................
              SizedBox(
                height: size.height * 0.02,
              ),
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<City>(
                        //icon: Icon(Icons.location_city),
                        value: _chemist_1_controller.selectedCity.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Selected City'),
                        items: _chemist_1_controller.cities.map((City items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items.cityName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.015,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (City? newValue) {
                          _chemist_1_controller.selectedCity.value = newValue!;
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.018,
                //appPadding / 2,
              ),

              ///TODO: licence no.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.name],
                  controller: _chemist_1_controller.LicenceNumber,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Licence no',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.offline_pin_rounded,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),

              ///TODO: licence validation.......................
              // NeumorphicTextFieldContainer(
              //   child: TextFormField(
              //     autofillHints: [AutofillHints.creditCardNumber],
              //     controller: _chemist_1_controller.LicenseValidity,
              //     cursorColor: Colors.black,
              //     obscureText: false,
              //     decoration: InputDecoration(
              //       hintText: 'Licence validity',
              //       helperStyle: TextStyle(
              //         color: black.withOpacity(0.7),
              //         fontSize: 18,
              //       ),
              //       prefixIcon: Icon(
              //         Icons.videogame_asset_sharp,
              //         color: black.withOpacity(0.7),
              //         size: 20,
              //       ),
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: size.height * 0.078,
                width: size.width,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 30 / 3),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            lightPrimary,
                            darkPrimary,
                          ]),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(-1, -1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.white,
                        ),
                        BoxShadow(
                          offset: Offset(2, 2),
                          spreadRadius: 1,
                          blurRadius: 0,
                          color: Colors.cyanAccent,
                        ),
                      ]),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    // decoration: InputDecoration(
                    //   hintText: 'Enter Something',
                    //   contentPadding: EdgeInsets.all(20.0),
                    // ),

                    controller: _chemist_1_controller.appointmentController,
                    onTap: () {
                      _chemist_1_controller.chooseDate();
                    },

                    cursorColor: Colors.black,
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(17.0),
                      hintText: 'Select date',
                      helperStyle: TextStyle(
                        color: black.withOpacity(0.7),
                        fontSize: 18,
                      ),
                      prefixIcon: Icon(
                        Icons.calendar_today_outlined,
                        color: black.withOpacity(0.7),
                        size: 20,
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    autofocus: true,
                    //obscureText: true,
                    //controller: _loginpasswordController.mobileController,
                  ),
                ),
                // ListView.builder(
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 32,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Padding(
                //         padding: const EdgeInsets.all(3.0),
                //         child: PhysicalModel(
                //           color: MyTheme.white,
                //           borderRadius: BorderRadius.circular(5),
                //           elevation: 20,
                //           child: Padding(
                //             padding: EdgeInsets.symmetric(
                //                 horizontal: size.width * 0.01,
                //                 vertical: size.height * 0.004),
                //             child: Container(
                //               //height: size.height * 0.025,
                //               width: size.width * 0.17,
                //               decoration: BoxDecoration(
                //                 color: MyTheme.ThemeColors,
                //                 borderRadius: BorderRadius.circular(5),
                //               ),
                //               child: Column(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     'MAR',
                //                     style: TextStyle(
                //                       fontSize: size.height * 0.015,
                //                       fontWeight: FontWeight.w600,
                //                       color: Colors.white,
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     height: size.height * 0.01,
                //                   ),
                //                   Text(
                //                     '${index}',
                //                     style: TextStyle(
                //                       fontSize: size.height * 0.016,
                //                       fontWeight: FontWeight.w600,
                //                       color: Colors.white,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     }),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),

              ///TODO: Pin.......................................................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.password],
                  controller: _chemist_1_controller.PinCode,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Pin',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.pin,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              ///todo certificate image............
              // GetBuilder<Hospital_2_Controller>(
              //   // specify type as Controller
              //   init: Hospital_2_Controller(), // intialize with the Controller
              //   builder: (value) => InkWell(
              //     onTap: () {
              //       // _chemist_1_controller.getImage(ImageSource.gallery);
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
              //                 'Certificate Image',
              //                 style: TextStyle(
              //                   fontSize: size.width * 0.03,
              //                   fontWeight: FontWeight.w700,
              //                 ),
              //               ),
              //               Icon(Icons.camera_alt),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              ///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upload Your certificate image:",
                    style: TextStyle(
                      fontSize: size.height * 0.015,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: size.height * 0.1,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.cyanAccent, width: 2),
                    ),
                    child: Obx(
                      () => _chemist_1_controller.selectedPath.value != ''
                          ? Image.file(
                              File(_chemist_1_controller.selectedPath.value))
                          : Center(
                              child: InkWell(
                                onTap: (() {
                                  optionsImage();
                                }),
                                child: Container(
                                  height: size.height * 0.4,
                                  width: size.width * 0.95,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      border: Border.all(
                                          width: 5,
                                          color: Color.fromARGB(
                                              255, 58, 141, 208))),
                                  child: Center(
                                    child: Icon(
                                      Icons.camera_enhance_rounded,
                                      color: Color.fromARGB(255, 58, 141, 208),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      // Image.file(File(
                      //         _labUploadReportController.selectedImagePath.value)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RectangularButton(
                  text: 'SUBMIT',
                  press: () {
                    _chemist_1_controller.checkChemistSignup();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  ///

  void optionsImage() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        //width: 780,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _chemist_1_controller.getImage(ImageSource.camera);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_enhance,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 34, 126, 201),
              endIndent: 70,
              indent: 70,
            ),
            InkWell(
              onTap: () {
                _chemist_1_controller.getImage(ImageSource.gallery);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
