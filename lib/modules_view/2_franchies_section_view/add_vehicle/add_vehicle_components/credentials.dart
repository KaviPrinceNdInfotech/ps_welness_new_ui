import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/add_vehicle/added_vehicle_list/added_vehicle_list.dart';
//import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';

import '../../../../controllers/2_franchises_controller/add_vehicle_controller/add_vehicle_controller.dart';
import '../../../../widgets/widgets/neumorphic_text_field_container.dart';
import '../../add_single_department/added_vehicle_list/added_vehicle_list.dart';

class AddVehicleCredentials extends StatelessWidget {
  AddVehicleCredentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  AddVehicleController _addVehicleController = Get.put(AddVehicleController());

  var items = [
    'Advance Life Support Ambulance',
    'Basic Life Support Ambulance',
    'Patient Transport Ambulance',
  ];

  get newvalue => null!;

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _addVehicleController.addvehicleformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ///Todo: email.....................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.email],
            //     controller: _profileController.emailController,
            //     onSaved: (value) {
            //       _profileController.email = value!;
            //     },
            //     validator: (value) {
            //       return _profileController.validEmail(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Email',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.email,
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
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.2,
              margin: EdgeInsets.symmetric(vertical: 30 / 3),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.blue,
                        // lightPrimary1,
                        darkPrimary,
                      ]),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-2, -2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      color: darkShadow,
                    ),
                    BoxShadow(
                      offset: Offset(2, 2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      color: lightShadow,
                    ),
                  ]),
              child: InkWell(
                onTap: () {
                  Get.to(() => VehicleList());
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
                    child: Center(
                      child: Text(
                        'View List',
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            ///Todo: vehicle type............................
            SizedBox(
              height: size.height * 0.04,
            ),

            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField(
                      value: _addVehicleController.selectedState.value,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        // prefixIcon: Icon(
                        //   Icons.real_estate_agent,
                        //   color: Colors.black,
                        // ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Vehicle Category'),
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
                        _addVehicleController.selectedState.value = newValue!;
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
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              height: size.height * 0.0,
            ),

            ///todo:  name..........
            Container(
              height: size.height * 0.07,
              //width: size.width * 0.37,
              //margin: EdgeInsets.symmetric(vertical: appPadding / 3),
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
                      offset: Offset(-2, -2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      color: darkShadow,
                    ),
                    BoxShadow(
                      offset: Offset(2, 2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      color: lightShadow,
                    ),
                  ]),
              child: TextFormField(
                keyboardType: TextInputType.name,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _addVehicleController.nameController,
                onSaved: (value) {
                  _addVehicleController.name = value!;
                },
                validator: (value) {
                  return _addVehicleController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  hintText: 'Vehicle Type',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 12,
                  ),
                  // prefixIcon: Icon(
                  //   Icons.account_box,
                  //   color: black.withOpacity(0.7),
                  //   size: 20,
                  // ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            // Container(
            //   height: size.height * 0.07,
            //   //width: size.width * 0.37,
            //   //margin: EdgeInsets.symmetric(vertical: appPadding / 3),
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //           begin: Alignment.centerLeft,
            //           end: Alignment.centerRight,
            //           colors: [
            //             lightPrimary,
            //             darkPrimary,
            //           ]),
            //       borderRadius: BorderRadius.circular(12),
            //       boxShadow: [
            //         BoxShadow(
            //           offset: Offset(-2, -2),
            //           spreadRadius: 1,
            //           blurRadius: 4,
            //           color: darkShadow,
            //         ),
            //         BoxShadow(
            //           offset: Offset(2, 2),
            //           spreadRadius: 1,
            //           blurRadius: 4,
            //           color: lightShadow,
            //         ),
            //       ]),
            //   child: TextFormField(
            //     keyboardType: TextInputType.name,
            //     autofillHints: [AutofillHints.telephoneNumber],
            //     controller: _addVehicleController.branchController,
            //     onSaved: (value) {
            //       _addVehicleController.branch = value!;
            //     },
            //     validator: (value) {
            //       return _addVehicleController.validDept(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       contentPadding:
            //           EdgeInsets.symmetric(horizontal: size.width * 0.02),
            //       hintText: 'Enter service',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 12,
            //       ),
            //       // prefixIcon: Icon(
            //       //   Icons.account_box,
            //       //   color: black.withOpacity(0.7),
            //       //   size: 20,
            //       // ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

            // SizedBox(
            //   height: size.height * 0.05,
            // ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.99,
              margin: EdgeInsets.symmetric(vertical: 30 / 9),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.cyan.shade300,
                        Colors.black38,
                      ]),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-2, -2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      color: darkShadow,
                    ),
                    BoxShadow(
                      offset: Offset(2, 2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      color: lightShadow,
                    ),
                  ]),
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
                  child: Center(
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
