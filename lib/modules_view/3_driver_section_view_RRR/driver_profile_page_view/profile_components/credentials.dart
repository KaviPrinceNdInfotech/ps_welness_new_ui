import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_profile_detail_controller.dart';
import 'package:ps_welness_new_ui/controllers/user_controller/user_controller_1.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

//import '../../../../controllers/3_driver_view_controllers/driver_profile_controller/driver_profile_controller.dart';
import '../../../../controllers/3_driver_view_controllers_RRR/driver_profile_controller/driver_profile_controller.dart';

class DriverProfileCredentials extends StatelessWidget {
  DriverProfileCredentials({Key? key}) : super(key: key);
  DriverProfileController _driverProfileController =
      Get.put(DriverProfileController());
  User_1_Controller _user_1_controller = Get.put(User_1_Controller());
  DriverProfileDetailController _driverprofile =
      Get.put(DriverProfileDetailController());
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
    return Form(
      key: _driverProfileController.driverrprofileformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: Driver name..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.DriverNameEditText,
                // keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Driver name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.people,
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

            ///todo: Phone..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.PhoneEditText,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_android_outlined,
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

            ///todo: Vehicle name..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.VehicleNameEditText,
                // keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Vehicle name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.car_crash_sharp,
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

            ///todo: State..........
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<StateModel>(
                      value: _driverProfileController.selectedState.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select State'),
                      items: _driverProfileController.states
                          .map((StateModel state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(
                            state.stateName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (StateModel? newValue) {
                        _driverProfileController.selectedState.value =
                            newValue!;
                        _driverProfileController.selectedCity.value = null;
                        // _driverProfileController.selectedState.value = newValue!;
                      }),
                ),
              ),
            ),

            ///todo: City.........
            SizedBox(
              height: size.height * 0.02,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<City>(
                      value: _driverProfileController.selectedCity.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Selected City'),
                      items: _driverProfileController.cities.map((City city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(
                            city.cityName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (City? newValue) {
                        _driverProfileController.selectedCity.value = newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: Location.........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.LocationEditText,
                // keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Location',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.place,
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

            ///todo: Dl number.........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.DlNumberEditText,
                // keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Dl number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.dataset_linked,
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

            ///todo: Dl image.........
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.5,
                    child: Text(
                      "Upload DL Image:",
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
                    () => _driverProfileController.selectedPath.value != ''
                        ? Image.file(
                            File(_driverProfileController.selectedPath.value))
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
              height: size.height * 0.02,
            ),

            ///todo: Dl image name.........
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     controller: _driverProfileController.DlImageNameEditText,
            //     keyboardType: TextInputType.number,
            //     autofillHints: [AutofillHints.telephoneNumber],
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Dl image name',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.phone_android_outlined,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            SizedBox(
              height: size.height * 0.0,
            ),
            RectangularButton(
                text: 'UPDATE',
                press: () {
                  _driverProfileController.checkDriverUpdateProfile();
                  _driverprofile.driverProfileDetailApi();
                  _driverprofile.update();
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
                _driverProfileController.getImage(ImageSource.camera);
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
                _driverProfileController.getImage(ImageSource.gallery);
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
