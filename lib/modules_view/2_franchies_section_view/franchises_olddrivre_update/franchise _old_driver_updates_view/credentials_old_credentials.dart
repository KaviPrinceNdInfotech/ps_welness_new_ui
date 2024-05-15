import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesOldDriver_controller/update_old_driver_post_controllers.dart';
import 'package:ps_welness_new_ui/model/franchies_models/update_old_driver_model.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';

import '../../../../widgets/widgets/neumorphic_text_field_container.dart';

class UpdateoldDriverCredentials extends StatelessWidget {
  UpdateoldDriverCredentials({Key? key}) : super(key: key);
  UpdateolddriverrrController _updateoldVehicleController =
      Get.put(UpdateolddriverrrController());

  get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _updateoldVehicleController.updateolddriverformkey,
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
            // SizedBox(
            //   height: size.height * 0.03,
            // ),
            // NeumorphicTextFieldContainer(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            //     child: Obx(
            //       () => (_updateoldVehicleController.isLoading.value)
            //           ? Center(child: CircularProgressIndicator())
            //           : DropdownButtonFormField<VehicleNumberListdrop>(
            //               value: _updateoldVehicleController
            //                   .selectedVehicleCat.value,
            //               decoration: InputDecoration(
            //                 contentPadding: EdgeInsets.symmetric(
            //                     horizontal: size.width * 0.02),
            //                 enabledBorder: InputBorder.none,
            //                 border: InputBorder.none,
            //               ),
            //               hint: Text('Select vehicle'),
            //               items: _updateoldVehicleController.vehiclesCat
            //                   .map((VehicleNumberListdrop items) {
            //                 return DropdownMenuItem(
            //                   value: items,
            //                   child: Text(
            //                     items.vehicleNumber,
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.w600,
            //                       fontSize: size.height * 0.013,
            //                     ),
            //                   ),
            //                 );
            //               }).toList(),
            //               validator: (value) =>
            //                   value == null ? '  field required' : null,
            //               onChanged: (VehicleNumberListdrop? newValue) {
            //                 _updateoldVehicleController
            //                     .selectedVehicleCat.value = newValue!;
            //                 _updateoldVehicleController
            //                     .selectedVehicleType.value = null;
            //               }),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.03,
            // ),
            // NeumorphicTextFieldContainer(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            //     child: Obx(
            //       () => (_updateoldVehicleController.isLoading.value)
            //           ? Center(child: CircularProgressIndicator())
            //           : DropdownButtonFormField<VehicleNumberdetail>(
            //               value: _updateoldVehicleController
            //                   .selectedVehicleType.value,
            //               decoration: InputDecoration(
            //                 contentPadding: EdgeInsets.symmetric(
            //                     horizontal: size.width * 0.02),
            //                 enabledBorder: InputBorder.none,
            //                 border: InputBorder.none,
            //               ),
            //               hint: Text('Select Vehicle number'),
            //               items: _updateoldVehicleController.vehicleType
            //                   .map((VehicleNumberdetail items) {
            //                 return DropdownMenuItem(
            //                   value: items,
            //                   child: Text(
            //                     items.driverName,
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.w600,
            //                       fontSize: size.height * 0.015,
            //                     ),
            //                   ),
            //                 );
            //               }).toList(),
            //               onTap: () {
            //                 _updateoldVehicleController.refresh();
            //               },
            //               validator: (value) =>
            //                   value == null ? '  field required' : null,
            //               onChanged: (VehicleNumberdetail? newValue) {
            //                 _updateoldVehicleController
            //                     .selectedVehicleType.value = newValue!;
            //               }),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.05,
            // ),

            ///Todo: driver...............................
            SizedBox(
              height: size.height * 0.03,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => (_updateoldVehicleController.isLoading.value)
                      ? Center(child: CircularProgressIndicator())
                      : DropdownButtonFormField<Driver>(
                          value:
                              _updateoldVehicleController.selecteddriver.value,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                          hint: Text('Select Driver'),
                          items: _updateoldVehicleController.driverss
                              .map((Driver items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items.driverName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.013,
                                ),
                              ),
                            );
                          }).toList(),
                          validator: (value) =>
                              value == null ? '  field required' : null,
                          onChanged: (Driver? newValue) {
                            _updateoldVehicleController.selecteddriver.value =
                                newValue!;
                            // _updateoldVehicleController
                            //     .selectedVehicleType.value = null;
                          }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            InkWell(
              onTap: () async {
                final isValid = _updateoldVehicleController
                    .updateolddriverformkey.currentState!
                    .validate();
                if (isValid) {
                  await _updateoldVehicleController.updateolddriverfrrType();
                  await Get.offAll(FranchiesHomePage());
                  // Timer(const Duration(seconds: 2),
                  //     () => _addVehicleController.FrenchiesAddVehicleList());
                  // _addVehicleController.update();
                  // Timer(
                  //     const Duration(seconds: 2),
                  //         () => Get.to(VehicleList()));
                  return;
                } else {
                  await _updateoldVehicleController.updateolddriverfrrType();
                  //_updateoldVehicleController.selectedVehicleCat.value = null;
                  _updateoldVehicleController.selecteddriver.value = null;
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
