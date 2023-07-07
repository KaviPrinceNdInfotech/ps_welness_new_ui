import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleCategoryDD_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleTypeDD_model.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
import '../../../../../controllers/2_franchises_controller/registration_part_controller/vehicle_part_controller/vehicle_part_controller.dart';

class FrVehicleCredentials extends StatelessWidget {
  FrVehicleCredentials({Key? key}) : super(key: key);

  Franchies_vehicle_Controller _franchies_vehicle_controller = Get.put(Franchies_vehicle_Controller());

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
      key: _franchies_vehicle_controller.frvehicleformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TODO: Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _franchies_vehicle_controller.nameController,
                onSaved: (value) {
                  _franchies_vehicle_controller.name = value!;
                },
                validator: (value) {
                  return _franchies_vehicle_controller.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Vehicle Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.car_rental,
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
            ///Todo: vehicle number.....................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.email],
                controller: _franchies_vehicle_controller.vehiclenumberController,
                onSaved: (value) {
                  _franchies_vehicle_controller.vehiclenumber = value!;
                },
                validator: (value) {
                  return _franchies_vehicle_controller.validnumber(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter Vehicle number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.numbers,
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
            ///Todo: account..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _franchies_vehicle_controller.accountController,
                onSaved: (value) {
                  _franchies_vehicle_controller.account = value!;
                },
                validator: (value) {
                  return _franchies_vehicle_controller.validAcno(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter Account No',
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
            ///Todo: confirm account no...........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller:
                    _franchies_vehicle_controller.confirmaccountController,
                onSaved: (value) {
                  _franchies_vehicle_controller.confirmaccount = value!;
                },
                validator: (value) {
                  return _franchies_vehicle_controller.validAcno(value!);
                },

                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Confirm Account',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_box_outlined,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ///todo: driver charge..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _franchies_vehicle_controller.driverchargeController,
                onSaved: (value) {
                  _franchies_vehicle_controller.drivercharge = value!;
                },
                validator: (value) {
                  return _franchies_vehicle_controller.validcharge(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'driver charge',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.currency_rupee,
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
            ///todo: ac holder name value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.addressCityAndState],
                controller:
                    _franchies_vehicle_controller.accountholderController,
                onSaved: (value) {
                  _franchies_vehicle_controller.acholdername = value!;
                },
                validator: (value) {
                  return _franchies_vehicle_controller.validaccholder(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Account holder name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            ///Todo: catagary............................
            SizedBox(
              height: size.height * 0.02,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<VehicleCatDropdown>(
                      value: _franchies_vehicle_controller.selectedVehicleCat.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.car_repair,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select vehicle category'),
                      items: _franchies_vehicle_controller.vehicles.map((VehicleCatDropdown items) {
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
                        _franchies_vehicle_controller.selectedVehicleCat.value = newValue!;
                      }),
                ),
              ),
            ),
            ///Todo: type.....................................
            SizedBox(
              height: size.height * 0.02,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<VehicleTypeName>(
                      value: _franchies_vehicle_controller.selectedVehicleType.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.bus_alert,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Vehicle Type'),
                      items: _franchies_vehicle_controller.vehicleType.map((VehicleTypeName items) {
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
                        _franchies_vehicle_controller.selectedVehicleType.value = newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ///TODO: Ifsc.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.password],
                controller: _franchies_vehicle_controller.IfscController,
                onSaved: (value) {
                  _franchies_vehicle_controller.ifsccode = value!;
                },
                validator: (value) {
                  return _franchies_vehicle_controller.validIfsc(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'IFSC code',
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
              height: size.height * 0.033,
            ),
            GetBuilder<Franchies_vehicle_Controller>(
              init: Franchies_vehicle_Controller(), // intialize with the Controller
              builder: (value) => InkWell(
                onTap: () {
                  _franchies_vehicle_controller.getImage(ImageSource.gallery);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cancel Cheque',
                      style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      height: 70,width: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:  Border.all(color: Colors.blue, width: 1.0),
                          borderRadius:BorderRadius.circular(5)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Obx(()=> _franchies_vehicle_controller.selectedImagepath.value=='' ?
                        const Center(
                            child: Text("No Image")) :
                        Image.file(File(_franchies_vehicle_controller.selectedImagepath.value),
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
            RectangularButton(
                text: 'Submit',
                press: () {
                  _franchies_vehicle_controller.FrenchiesVehicleRegistration();
                })
          ],
        ),
      ),
    );
  }
}
