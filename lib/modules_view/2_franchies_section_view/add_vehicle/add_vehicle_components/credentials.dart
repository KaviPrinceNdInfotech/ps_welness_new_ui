import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleCategoryDD_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleTypeDD_model.dart';
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
                  () => DropdownButtonFormField<VehicleCatDropdown>(
                      value: _addVehicleController.selectedVehicleCat.value,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Vehicle Category'),
                      items: _addVehicleController.vehiclesCat.map((VehicleCatDropdown items) {
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
                      onChanged: (VehicleCatDropdown? newValue) {
                        _addVehicleController.selectedVehicleCat.value = newValue!;
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
                      () => DropdownButtonFormField<VehicleTypeName>(
                      value: _addVehicleController.selectedVehicleType.value,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Vehicle Category'),
                      items: _addVehicleController.vehicleType.map((VehicleTypeName items) {
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
                      onChanged: (VehicleTypeName? newValue) {
                        _addVehicleController.selectedVehicleType.value = newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(
              onTap: (){
                _addVehicleController.FrenchiesAddVehicleType();
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
            ),
          ],
        ),
      ),
    );
  }
}
