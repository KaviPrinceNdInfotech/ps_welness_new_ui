import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../../controllers/lab_controller/lab_controller1/lab_controller_1.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/controllers/hospital2_controller/hospital2_sighup_controller.dart';
// import 'package:ps_welness/controllers/lab_controller/lab_zcontroller2/lab_controller_2.dart';
// import 'package:ps_welness/modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

class Lab2Credentials extends StatelessWidget {
  Lab2Credentials({Key? key}) : super(key: key);
  Lab_1_Controller _lab_1_controller = Get.put(Lab_1_Controller());

  //Lab_2_Controller _lab_2_controller = Get.put(Lab_2_Controller());

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
      child: Form(
        key: _lab_1_controller.lab1formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  //height: size.height * 0.02,
                  ),

              // GetBuilder<Hospital_2_Controller>(
              //   // specify type as Controller
              //   init: Hospital_2_Controller(), // intialize with the Controller
              //   builder: (value) => InkWell(
              //     onTap: () {
              //       _lab_1_controller.getImage(ImageSource.gallery);
              //     },
              //     child: NeumorphicTextFieldContainer(
              //       child: Container(
              //         height: size.height * 0.06,
              //         //width: size.width * 0.5,
              //         child: Padding(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: size.width * 0.1),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'Licence Image File',
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
                height: size.height * 0.02,
              ),

              ///todo: Gst Number.................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  //keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.addressCityAndState],
                  controller: _lab_1_controller.GSTNumberController,
                  onSaved: (value) {
                    _lab_1_controller.gSTNumber = value!;
                  },
                  validator: (value) {
                    return _lab_1_controller.validAddress(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'GST NO',
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

              SizedBox(
                height: size.height * 0.018,
                //appPadding / 2,
              ),

              ///TODO: Aadhar no.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.password],
                  controller: _lab_1_controller.AadharNumberController,
                  onSaved: (value) {
                    _lab_1_controller.aadharNumber = value!;
                  },
                  validator: (value) {
                    return _lab_1_controller.validaadhar(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Aadhaar No ',
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

              SizedBox(
                height: size.height * 0.018,
              ),

              // SizedBox(
              //   height: size.height * 0.2,
              //   child: GetBuilder<Driver_1111_Controller>(
              //     // specify type as Controller
              //     init:
              //         Driver_1111_Controller(), // intialize with the Controller
              //     builder: (value) => InkWell(
              //       onTap: () {
              //         //_rwa_11_controller.getImage(ImageSource.gallery);
              //       },
              //       child: Obx(
              ///         () => _driver_1111_controller.selectedPath.value != ''
              //             ? Image.file(
              //                 File(_driver_1111_controller.selectedPath.value))
              //             : InkWell(
              //                 onTap: (() {
              //                   optionsImage();
              //                 }),
              //                 child: NeumorphicTextFieldContainer(
              //                   child: Container(
              //                     height: size.height * 0.07,
              //                     //width: size.width * 0.5,
              //                     child: Padding(
              //                       padding: EdgeInsets.symmetric(
              //                           horizontal: size.width * 0.1),
              //                       child: Row(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           Text(
              //                             'User Image',
              //                             style: TextStyle(
              //                               fontSize: size.width * 0.03,
              //                               fontWeight: FontWeight.w700,
              //                             ),
              //                           ),
              //                           Icon(Icons.camera_alt),
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //       ),
              //     ),
              //   ),
              // ),

              ///TODO: certificate.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _lab_1_controller.LicenceNumberController,
                  onSaved: (value) {
                    _lab_1_controller.licenceNumber = value!;
                  },
                  validator: (value) {
                    return _lab_1_controller.validcertificate(value!);
                  },
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        "Upload Licence Image:",
                        style: TextStyle(
                          fontSize: size.height * 0.017,
                          fontWeight: FontWeight.w800,
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      _lab_1_controller.clearImage1();
                    },
                    child: Container(
                      height: size.height * 0.1,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.cyanAccent, width: 2),
                      ),
                      child: Obx(
                        () => _lab_1_controller.selectedPath1.value != ''
                            ? Image.file(
                                File(_lab_1_controller.selectedPath1.value))
                            : InkWell(
                                onTap: (() {
                                  optionsImage1();
                                }),
                                child: Center(
                                  child: Icon(Icons.camera_enhance_rounded),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              ///todo: pan number..........
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _lab_1_controller.panController,
                  onSaved: (value) {
                    _lab_1_controller.pan = value!;
                  },
                  validator: (value) {
                    return _lab_1_controller.validPan(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Pan number',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.add_card_outlined,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              ///image picker....2......

              SizedBox(
                height: size.height * 0.018,
                //appPadding / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        "Upload Pan Image:",
                        style: TextStyle(
                          fontSize: size.height * 0.017,
                          fontWeight: FontWeight.w800,
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      _lab_1_controller.clearImage2();
                    },
                    child: Container(
                      height: size.height * 0.1,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.cyanAccent, width: 2),
                      ),
                      child: Obx(
                        () => _lab_1_controller.selectedPath2.value != ''
                            ? Image.file(
                                File(_lab_1_controller.selectedPath2.value))
                            : InkWell(
                                onTap: (() {
                                  optionsImage2();
                                }),
                                child: Center(
                                  child: Icon(Icons.camera_enhance_rounded),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              //
              // NeumorphicTextFieldContainer(
              //   child: Obx(
              //     () => InkWell(
              //       onTap: () {
              //         _lab_1_controller.chooseTime();
              //       },
              //       child: Container(
              //         height: size.height * 0.06,
              //         child: Center(
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: size.width * 0.1),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   'Choose Starting Time:',
              //                   style: TextStyle(
              //                     fontSize: size.height * 0.017,
              //                     fontWeight: FontWeight.bold,
              //                     color: MyTheme.blueww,
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: size.width * 0.03,
              //                 ),
              //                 //Spacer(),
              //                 Text(
              //                   "${_lab_1_controller.selectedTime.value.hour}:${_lab_1_controller.selectedTime.value.minute}",
              //                   style: TextStyle(
              //                     fontSize: size.height * 0.026,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              //
              // SizedBox(
              //   height: size.height * 0.018,
              // ),
              //
              // ///todo:selected time ending...
              //
              // // Text(
              // //   'Choose Ending Time:',
              // //   style: TextStyle(
              // //     fontSize: size.height * 0.016,
              // //     fontWeight: FontWeight.bold,
              // //     color: MyTheme.blueww,
              // //   ),
              // // ),
              //
              // NeumorphicTextFieldContainer(
              //   child: Obx(
              //     () => InkWell(
              //       onTap: () {
              //         _lab_1_controller.chooseTime2();
              //       },
              //       child: Container(
              //         height: size.height * 0.06,
              //         child: Center(
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: size.width * 0.1),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   'Choose Ending Time:',
              //                   style: TextStyle(
              //                     fontSize: size.height * 0.017,
              //                     fontWeight: FontWeight.bold,
              //                     color: MyTheme.blueww,
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: size.width * 0.03,
              //                 ),
              //                 //Spacer(),
              //                 Text(
              //                   "${_lab_1_controller.selectedTime2.value.hour}:${_lab_1_controller.selectedTime2.value.minute}",
              //                   style: TextStyle(
              //                     fontSize: size.height * 0.026,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              RectangularButton(
                  text: 'SUBMIT',
                  press: () {
                    _lab_1_controller.checklab1();

                    //Get.to(SignInScreen());
                    //_loginpasswordController.checkLoginpassword();
                  })
            ],
          ),
        ),
      ),
    );
  }

  void optionsImage1() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 780,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                //var ImageSource1;
                _lab_1_controller.getImage1(ImageSource.camera);
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
                _lab_1_controller.getImage1(ImageSource.gallery);
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

  void optionsImage2() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 780,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                //var ImageSource1;
                _lab_1_controller.getImage2(ImageSource.camera);
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
                _lab_1_controller.getImage2(ImageSource.gallery);
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
