import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_lab_controller/fr_lab_controller1/lab_controller_1.dart';
import 'package:ps_welness_new_ui/controllers/hospital2_controller/hospital2_sighup_controller.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

class FrLab2Credentials extends StatelessWidget {
  FrLab2Credentials({Key? key}) : super(key: key);

  Fr_Lab_1_Controller _frlab_1_controller = Get.put(Fr_Lab_1_Controller());
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
        key: _frlab_1_controller.frlab2formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<Hospital_2_Controller>(
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _frlab_1_controller.getLicenceImage(ImageSource.gallery);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Licence Image File',
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(5)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Obx(
                            () => _frlab_1_controller
                                        .selectedLicenceImagepath.value ==
                                    ''
                                ? const Center(child: Text("No Image"))
                                : Image.file(
                                    File(_frlab_1_controller
                                        .selectedLicenceImagepath.value),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),

              ///TODO: certificate.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _frlab_1_controller.certificateController,
                  onSaved: (value) {
                    _frlab_1_controller.certificateno = value!;
                  },
                  validator: (value) {
                    return _frlab_1_controller.validcertificate(value!);
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

              ///todo: Gst Number.................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  // keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.addressCityAndState],
                  controller: _frlab_1_controller.gstNoController,
                  onSaved: (value) {
                    _frlab_1_controller.address = value!;
                  },
                  validator: (value) {
                    return _frlab_1_controller.validAddress(value!);
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
                  keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.password],
                  controller: _frlab_1_controller.aadhaarController,
                  onSaved: (value) {
                    _frlab_1_controller.aadhar = value!;
                  },
                  validator: (value) {
                    return _frlab_1_controller.validaadhar(value!);
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

              GetBuilder<Hospital_2_Controller>(
                // specify type as Controller
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _frlab_1_controller.getPanImage(ImageSource.gallery);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Pan Image',
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(5)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Obx(
                            () => _frlab_1_controller
                                        .selectedPanImagepath.value ==
                                    ''
                                ? const Center(child: Text("No Image"))
                                : Image.file(
                                    File(_frlab_1_controller
                                        .selectedPanImagepath.value),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///todo:selected date starting...
              SizedBox(
                height: size.height * 0.018,
              ),

              ///time commented 4 aug 2023...
              // NeumorphicTextFieldContainer(
              //   child: Obx(
              //     () => InkWell(
              //       onTap: () {
              //         _frlab_1_controller.chooseTime();
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
              //                   "${_frlab_1_controller.selectedTime.value.hour}:${_frlab_1_controller.selectedTime.value.minute}",
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
              // NeumorphicTextFieldContainer(
              //   child: Obx(
              //     () => InkWell(
              //       onTap: () {
              //         _frlab_1_controller.chooseTime2();
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
              //                   "Choose end time",
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
              //                   "${_frlab_1_controller.selectedTime2.value.hour}:${_frlab_1_controller.selectedTime2.value.minute}",
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
              ///time end

              RectangularButton(
                  text: 'SUBMIT',
                  press: () {
                    _frlab_1_controller.checkLab2();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
