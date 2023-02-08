import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';
import '../../../../../controllers/2_franchises_controller/registration_part_controller/vehicle_part_controller/vehicle_part_controller.dart';

class FrVehicleCredentials extends StatelessWidget {
  FrVehicleCredentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  Franchies_vehicle_Controller _franchies_vehicle_controller =
      Get.put(Franchies_vehicle_Controller());

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
    return Form(
      key: _franchies_vehicle_controller.frvehicleformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
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
                controller: _franchies_vehicle_controller.nameController,
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
                //obscureText: true,
                //controller: _loginpasswordController.mobileController,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: driver charge..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller:
                    _franchies_vehicle_controller.driverchaergeController,
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
            // RectangularInputField(
            //   hintText: 'Password',
            //   icon: Icons.lock,
            //   obscureText: true,
            // ),

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
                  () => DropdownButtonFormField(
                      value: _franchies_vehicle_controller.selectedState.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.car_repair,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select vehicle category'),
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
                        _franchies_vehicle_controller.selectedState.value =
                            newValue!;
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

            ///Todo: type.....................................

            SizedBox(
              height: size.height * 0.02,
            ),

            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField(
                      //icon: Icon(Icons.location_city),
                      value: _franchies_vehicle_controller.selectedCity.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.bus_alert,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Vehicle Type'),
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
                        _franchies_vehicle_controller.selectedCity.value =
                            newValue!;
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
              //appPadding / 2,
            ),

            Container(
              height: size.height * 0.06,
              width: size.width * 0.90,
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
              child: GetBuilder<Franchies_vehicle_Controller>(
                // specify type as Controller
                init:
                    Franchies_vehicle_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _franchies_vehicle_controller.getImage(ImageSource.gallery);
                  },
                  child: Container(
                    height: size.height * 0.03,
                    width: size.width * 0.4,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cancel Cheque',
                            style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.camera_alt),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
              //appPadding / 2,
            ),

            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: InkWell(
            //     onTap: () {},
            //     child: Text(
            //       'Forget Password?',
            //       style: GoogleFonts.alegreya(
            //         fontWeight: FontWeight.w500,
            //         fontSize: size.width * 0.035,
            //       ),
            //     ),
            //   ),
            // ),
            RectangularButton(
                text: 'Submit',
                press: () {
                  //Get.to(UserHomePage());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
