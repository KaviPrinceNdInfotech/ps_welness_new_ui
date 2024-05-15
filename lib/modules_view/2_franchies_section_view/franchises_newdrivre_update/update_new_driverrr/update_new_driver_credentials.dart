import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/update_new_driver_controller/update_newdriver_controllerrr.dart';
import 'package:ps_welness_new_ui/model/franchies_models/update_new_vehicle_vehicletypeid_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/vechle_number_list_newdriverupdate_model.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';

import '../../../../widgets/widgets/neumorphic_text_field_container.dart';

class UpdatenewDriverCredentials extends StatelessWidget {
  UpdatenewDriverCredentials({Key? key}) : super(key: key);
  UpdatenewdriverrrController _updatenewVehicleController =
      Get.put(UpdatenewdriverrrController());

  get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _updatenewVehicleController.updatenewdriverformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            // Container(
            //   height: size.height * 0.06,
            //   width: size.width * 0.2,
            //   margin: const EdgeInsets.symmetric(vertical: 30 / 3),
            //   decoration: BoxDecoration(
            //       gradient: const LinearGradient(
            //           begin: Alignment.centerLeft,
            //           end: Alignment.centerRight,
            //           colors: [
            //             Colors.blue,
            //             darkPrimary,
            //           ]),
            //       borderRadius: BorderRadius.circular(12),
            //       boxShadow: const [
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
            //   child: InkWell(
            //     onTap: () async {
            //       //_addVehicleController.FrenchiesAddVehicleList();
            //       //_addVehicleController.update();
            //       // CallLoader.loader();
            //       // await Future.delayed(Duration(milliseconds: 900));
            //       // CallLoader.hideLoader();
            //       // await Get.to(() => VehicleList());
            //     },
            //     child: Container(
            //       height: size.height * 0.06,
            //       width: size.width * 0.1,
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
            //         child: Center(
            //           child: Text(
            //             'New Driver Update',
            //             style: TextStyle(
            //               fontSize: size.width * 0.03,
            //               fontWeight: FontWeight.w700,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            ///Todo: vehicle type............................
            SizedBox(
              height: size.height * 0.03,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => (_updatenewVehicleController.isLoading.value)
                      ? Center(child: CircularProgressIndicator())
                      : DropdownButtonFormField<NewVehicleType>(
                          value: _updatenewVehicleController
                              .selectedVehicleCat.value,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                          hint: Text('Select Vehicle Type'),
                          items: _updatenewVehicleController.vehiclesCat
                              .map((NewVehicleType items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items.vehicleTypeName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.013,
                                ),
                              ),
                            );
                          }).toList(),
                          validator: (value) =>
                              value == null ? '  field required' : null,
                          onChanged: (NewVehicleType? newValue) {
                            _updatenewVehicleController
                                .selectedVehicleCat.value = newValue!;
                            _updatenewVehicleController
                                .selectedVehicleType.value = null;
                          }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => (_updatenewVehicleController.isLoading.value)
                      ? Center(child: CircularProgressIndicator())
                      : DropdownButtonFormField<VehicleNumberListElement>(
                          value: _updatenewVehicleController
                              .selectedVehicleType.value,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                          hint: Text('Select Vehicle number'),
                          items: _updatenewVehicleController.vehicleType
                              .map((VehicleNumberListElement items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items.vehicleNumber,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            );
                          }).toList(),
                          onTap: () {
                            _updatenewVehicleController.refresh();
                          },
                          validator: (value) =>
                              value == null ? '  field required' : null,
                          onChanged: (VehicleNumberListElement? newValue) {
                            _updatenewVehicleController
                                .selectedVehicleType.value = newValue!;
                          }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(
              onTap: () async {
                final isValid = _updatenewVehicleController
                    .updatenewdriverformkey.currentState!
                    .validate();
                if (isValid) {
                  await _updatenewVehicleController.updatenewdriverfrrType();
                  await Get.offAll(FranchiesHomePage());
                  // Timer(const Duration(seconds: 2),
                  //     () => _addVehicleController.FrenchiesAddVehicleList());
                  // _addVehicleController.update();
                  // Timer(
                  //     const Duration(seconds: 2),
                  //         () => Get.to(VehicleList()));
                  return;
                } else {
                  await _updatenewVehicleController.updatenewdriverfrrType();
                  _updatenewVehicleController.selectedVehicleCat.value = null;
                  await Get.offAll(FranchiesHomePage());
                  // Get.snackbar("Failed", "please add all data");
                }
              },
              child: Container(
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
                    boxShadow: const [
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
                        'UPDATE',
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
            ),

            ///todo:add new vehicle.....
            SizedBox(
              height: size.height * 0.03,
            ),

            // InkWell(
            //   onTap: () async {
            //     //await _addVehicleController.getCityByStateID(stateID);
            //
            //     //getCityByStateID
            //     //getVehicleCategoryApi
            //
            //     /// _addVehicleController.FrenchiesAddVehicleList();
            //
            //     // await getVehicleCategoryApi();
            //
            //     /// CallLoader.loader();
            //     ///Future.delayed(Duration(seconds: 1));
            //     ///CallLoader.hideLoader();
            //
            //     //await Get.offAll(AddVehiclePage());
            //
            //     // await _addVehicleController.getVehicleCategoryApi();
            //
            //     _addVehicleController.addVeciclenewApi();
            //
            //     // _addVehicleController.vehiclecatagaryvehicleController.clear();
            //     //_addVehicleController.vehicletypeController.clear();
            //
            //     ///await Get.to(FranchiesHomePage());
            //
            //     // await _addVehicleController.getVehicleCategoryApi();
            //
            //     // _addVehicleController.FrenchiesAddVehicleList();
            //     // _addVehicleController.update();
            //     // final isValid = _addVehicleController
            //     //     .addvehicleformkey.currentState!
            //     //     .validate();
            //     // if (isValid) {
            //     //   _addVehicleController.FrenchiesAddVehicleType();
            //     //   // Timer(const Duration(seconds: 2),
            //     //   //     () => _addVehicleController.FrenchiesAddVehicleList());
            //     //   // _addVehicleController.update();
            //     //   // Timer(
            //     //   //     const Duration(seconds: 2),
            //     //   //         () => Get.to(VehicleList()));
            //     //   return;
            //     // } else {
            //     //   Get.snackbar("Failed", "please add all data");
            //     // }
            //   },
            //   child: Container(
            //     height: size.height * 0.06,
            //     width: size.width * 0.99,
            //     margin: EdgeInsets.symmetric(vertical: 30 / 9),
            //     decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //             begin: Alignment.centerLeft,
            //             end: Alignment.centerRight,
            //             colors: [
            //               Colors.cyan.shade300,
            //               Colors.black38,
            //             ]),
            //         borderRadius: BorderRadius.circular(12),
            //         boxShadow: const [
            //           BoxShadow(
            //             offset: Offset(-2, -2),
            //             spreadRadius: 1,
            //             blurRadius: 4,
            //             color: darkShadow,
            //           ),
            //           BoxShadow(
            //             offset: Offset(2, 2),
            //             spreadRadius: 1,
            //             blurRadius: 4,
            //             color: lightShadow,
            //           ),
            //         ]),
            //     child: Container(
            //       height: size.height * 0.06,
            //       width: size.width * 0.1,
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
            //         child: Center(
            //           child: Text(
            //             'Add New',
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: size.width * 0.04,
            //               fontWeight: FontWeight.w700,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
