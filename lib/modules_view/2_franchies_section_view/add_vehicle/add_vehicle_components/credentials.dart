import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleCategoryDD_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleTypeDD_model.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';

//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/add_vehicle/added_vehicle_list/added_vehicle_list.dart';
//import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';

import '../../../../controllers/2_franchises_controller/add_vehicle_controller/add_vehicle_controller.dart';
import '../../../../widgets/widgets/neumorphic_text_field_container.dart';
import '../../add_single_department/added_vehicle_list/added_vehicle_list.dart';

class AddVehicleCredentials extends StatelessWidget {
  AddVehicleCredentials({Key? key}) : super(key: key);
  AddVehicleController _addVehicleController = Get.put(AddVehicleController());

  get newvalue => null!;

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
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.2,
              margin: const EdgeInsets.symmetric(vertical: 30 / 3),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.blue,
                        darkPrimary,
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
              child: InkWell(
                onTap: () async {
                  _addVehicleController.FrenchiesAddVehicleList();
                  _addVehicleController.update();
                  CallLoader.loader();
                  await Future.delayed(Duration(milliseconds: 900));
                  CallLoader.hideLoader();
                  await Get.to(() => VehicleList());
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
              height: size.height * 0.03,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => (_addVehicleController.isLoading.value)
                      ? Center(child: CircularProgressIndicator())
                      : DropdownButtonFormField<VehicleCatDropdown>(
                          value: _addVehicleController.selectedVehicleCat.value,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                          hint: Text('Select Vehicle Category'),
                          items: _addVehicleController.vehiclesCat
                              .map((VehicleCatDropdown items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items.categoryName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            );
                          }).toList(),
                          validator: (value) =>
                              value == null ? '  field required' : null,
                          onChanged: (VehicleCatDropdown? newValue) {
                            _addVehicleController.selectedVehicleCat.value =
                                newValue!;
                            _addVehicleController.selectedVehicleType.value =
                                null;
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
                  () => (_addVehicleController.isLoading.value)
                      ? Center(child: CircularProgressIndicator())
                      : DropdownButtonFormField<VehicleTypeName>(
                          value:
                              _addVehicleController.selectedVehicleType.value,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                          hint: Text('Select Vehicle Category'),
                          items: _addVehicleController.vehicleType
                              .map((VehicleTypeName items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items.vehicleTypeName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            );
                          }).toList(),
                          onTap: () {
                            _addVehicleController.refresh();
                          },
                          validator: (value) =>
                              value == null ? '  field required' : null,
                          onChanged: (VehicleTypeName? newValue) {
                            _addVehicleController.selectedVehicleType.value =
                                newValue!;
                          }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(
              onTap: () async {
                final isValid = _addVehicleController
                    .addvehicleformkey.currentState!
                    .validate();
                if (isValid) {
                  await _addVehicleController.FrenchiesAddVehicleType();
                  await Get.offAll(VehicleList());
                  // Timer(const Duration(seconds: 2),
                  //     () => _addVehicleController.FrenchiesAddVehicleList());
                  // _addVehicleController.update();
                  // Timer(
                  //     const Duration(seconds: 2),
                  //         () => Get.to(VehicleList()));
                  return;
                } else {
                  await _addVehicleController.FrenchiesAddVehicleType();
                  await Get.offAll(VehicleList());
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
            ),

            ///todo:add new vehicle.....
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              'Add your New vehicle:-',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.red.shade800,
              ),
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
                  child: TextFormField(
                    controller: _addVehicleController.vehicletypeController,
                    onSaved: (value) {
                      _addVehicleController.vehicletype = value!;
                    },
                    validator: (value) {
                      return _addVehicleController.validvehicletype(value!);
                    },
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(
                            Icons.car_rental_outlined,
                            color: Colors.black,
                          ),
                        ),
                        //labelText: 'Vehicle Type',
                        border: InputBorder.none,
                        hintText: 'Enter type of vehicle'),
                  )),
            ),

            SizedBox(
              height: size.height * 0.0,
            ),
            // Text('Add your vehicle name'),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: TextFormField(
                  controller:
                      _addVehicleController.vehiclecatagaryvehicleController,
                  onSaved: (value) {
                    _addVehicleController.vehiclecatagary = value!;
                  },
                  validator: (value) {
                    return _addVehicleController.validcatagary(value!);
                  },
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.car_crash,
                          color: Colors.black,
                        ),
                      ),
                      //labelText: 'Vehicle Type',
                      border: InputBorder.none,
                      hintText: 'Enter vehicle catagary'),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            InkWell(
              onTap: () async {
                //await _addVehicleController.getCityByStateID(stateID);

                //getCityByStateID
                //getVehicleCategoryApi

                /// _addVehicleController.FrenchiesAddVehicleList();

                // await getVehicleCategoryApi();

                /// CallLoader.loader();
                ///Future.delayed(Duration(seconds: 1));
                ///CallLoader.hideLoader();

                //await Get.offAll(AddVehiclePage());

                // await _addVehicleController.getVehicleCategoryApi();

                _addVehicleController.addVeciclenewApi();

                // _addVehicleController.vehiclecatagaryvehicleController.clear();
                //_addVehicleController.vehicletypeController.clear();

                ///await Get.to(FranchiesHomePage());

                // await _addVehicleController.getVehicleCategoryApi();

                // _addVehicleController.FrenchiesAddVehicleList();
                // _addVehicleController.update();
                // final isValid = _addVehicleController
                //     .addvehicleformkey.currentState!
                //     .validate();
                // if (isValid) {
                //   _addVehicleController.FrenchiesAddVehicleType();
                //   // Timer(const Duration(seconds: 2),
                //   //     () => _addVehicleController.FrenchiesAddVehicleList());
                //   // _addVehicleController.update();
                //   // Timer(
                //   //     const Duration(seconds: 2),
                //   //         () => Get.to(VehicleList()));
                //   return;
                // } else {
                //   Get.snackbar("Failed", "please add all data");
                // }
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
                        'Add New',
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
          ],
        ),
      ),
    );
  }
}
