import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
//import 'package:ps_welness_new_ui/controllers/6_chemist_view_controllers/chemistManageProfile_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
//import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../controllers/6_chemist_view_controllers_RRR/chemistManageProfile_controller.dart';

class ChemistProfileCredentials extends StatelessWidget {
  ChemistProfileCredentials({Key? key}) : super(key: key);
  //ChemistProfileController _chemistprofileController = Get.put(ChemistProfileController());
  ChemistManageProfileController _chemistManageProfileController =
      Get.put(ChemistManageProfileController());

  get newvalue => null!;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      //  key: _chemistManageProfileController.chemistprofileformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///todo:  name..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.name,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _chemistManageProfileController.ChemistName,
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_box,
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

            ///TODO: Shop Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //initialValue: "I am smart",
                autofillHints: [AutofillHints.name],
                controller: _chemistManageProfileController.ShopName,
                validator: (value) {
                  return _chemistManageProfileController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Shop Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.home_repair_service_outlined,
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

            ///Todo: state............................
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<StateModel>(
                      value:
                          _chemistManageProfileController.selectedState.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select State'),
                      items: _chemistManageProfileController.states
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
                        _chemistManageProfileController.selectedState.value =
                            newValue!;
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
                      value: _chemistManageProfileController.selectedCity.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Selected City'),
                      items: _chemistManageProfileController.cities
                          .map((City items) {
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
                        _chemistManageProfileController.selectedCity.value =
                            newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: location value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _chemistManageProfileController.Location,
                validator: (value) {
                  return _chemistManageProfileController.validLocation(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Location',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.pin_drop,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
              //appPadding / 2,
            ),
            Text(
              'Shop Details:',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: size.width * 0.04),
            ),
            SizedBox(
              height: size.height * 0.01,
              //appPadding / 2,
            ),

            ///Todo: gst no..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _chemistManageProfileController.GSTNumber,
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'GST NO',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.switch_account,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),

            ///TODO: licence no.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _chemistManageProfileController.LicenceNumber,
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'LICENCE NO',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.local_police,
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

            /// todo Licence image.......
            SizedBox(
              height: 20,
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
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.cyanAccent, width: 2),
                  ),
                  child: Obx(
                    () => _chemistManageProfileController.selectedPath.value !=
                            ''
                        ? Image.file(File(
                            _chemistManageProfileController.selectedPath.value))
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
                                        color:
                                            Color.fromARGB(255, 58, 141, 208))),
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
              height: 20,
            ),

            ///
            // GetBuilder<ChemistProfileController>(
            //   init: ChemistProfileController(),
            //   builder: (value) => InkWell(
            //     onTap: () {
            //       // _chemistprofileController.getImage(ImageSource.gallery);
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
            // SizedBox(
            //   height: size.height * 0.00,
            //   //appPadding / 2,
            // ),
            RectangularButton(
                text: 'UPDATE',
                press: () {
                  _chemistManageProfileController.checkManageProfile();
                })
          ],
        ),
      ),
    );
  }

  void optionsImage() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 780,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _chemistManageProfileController.getImage(ImageSource.camera);
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
                _chemistManageProfileController.getImage(ImageSource.gallery);
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
