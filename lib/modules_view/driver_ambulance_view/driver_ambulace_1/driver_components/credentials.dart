import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_controller_RRR/driver_controller1.dart';
import 'package:ps_welness_new_ui/model/3_driver_controllers_RRR/vehicle_type_dropdown.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/driver_ambulance_view/driver_ambulance_2/driver_registation_2.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/driver_controller/driver_controller1.dart';
// import 'package:ps_welness/modules_view/driver_ambulance_view/driver_ambulance_2/driver_registation_2.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

class Driver1Credentials extends StatelessWidget {
  Driver1Credentials({Key? key}) : super(key: key);

  Driver_1111_Controller _driver_1111_controller =
      Get.put(Driver_1111_Controller());

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      //key: _driver_1111_controller.driver1111formkey,
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
                controller: _driver_1111_controller.nameController,
                onSaved: (value) {
                  _driver_1111_controller.name = value!;
                },
                validator: (value) {
                  return _driver_1111_controller.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.person_outline_sharp,
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

            ///Todo: email.....................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.email],
                controller: _driver_1111_controller.emailController,
                onSaved: (value) {
                  _driver_1111_controller.email = value!;
                },
                validator: (value) {
                  return _driver_1111_controller.validEmail(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
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

            ///Todo: password..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driver_1111_controller.passwordController,
                onSaved: (value) {
                  _driver_1111_controller.password = value!;
                },
                validator: (value) {
                  return _driver_1111_controller.validPassword(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Password',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
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

            ///Todo: confirm password...........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driver_1111_controller.confirmpasswordController,
                onSaved: (value) {
                  _driver_1111_controller.confirmpassword = value!;
                },
                validator: (value) {
                  return _driver_1111_controller.validConfirmPassword(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.phonelink_lock,
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

            ///todo: phone number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _driver_1111_controller.mobileController,
                onSaved: (value) {
                  _driver_1111_controller.mobile = value!;
                },
                validator: (value) {
                  return _driver_1111_controller.validPhone(value!);
                },
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
            // RectangularInputField(
            //   hintText: 'Password',
            //   icon: Icons.lock,
            //   obscureText: true,
            // ),

            ///Todo: vehicle............................
            SizedBox(
              height: size.height * 0.01,
            ),

            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<VehicleTypeElement>(
                      value: _driver_1111_controller.selectevehicletype.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Select Vehicle'),
                      items: _driver_1111_controller.vehicletype
                          .map((VehicleTypeElement vehicletype) {
                        return DropdownMenuItem(
                          value: vehicletype,
                          child: SizedBox(
                            width: size.width * 0.5,
                            child: Text(
                              vehicletype.vehicleTypeName.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.013,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (VehicleTypeElement? newValue) {
                        _driver_1111_controller.selectevehicletype.value =
                            newValue!;
                        //_driver_1111_controller.selectedCity.value = null;
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
              height: size.height * 0.02,
            ),

            ///Todo: dlnumber.....................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.nickname],
                controller: _driver_1111_controller.dlnumbercontroller,
                onSaved: (value) {
                  _driver_1111_controller.DlNumber = value!;
                },
                validator: (value) {
                  return _driver_1111_controller.validAddress(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Dl number',
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
            SizedBox(
              height: size.height * 0.08,
              width: size.width,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 30 / 5),
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
                        offset: Offset(-0, -0),
                        spreadRadius: 0,
                        blurRadius: 0,
                        color: Colors.white,
                      ),
                      BoxShadow(
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                        blurRadius: 0,
                        color: Colors.grey,
                      ),
                    ]),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  // decoration: InputDecoration(
                  //   hintText: 'Enter Something',
                  //   contentPadding: EdgeInsets.all(20.0),
                  // ),

                  controller: _driver_1111_controller.dlvaliditycontroller,
                  onTap: () {
                    _driver_1111_controller.chooseDate();
                  },

                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(17.0),
                    hintText: 'Select date',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.calendar_today_outlined,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  autofocus: true,
                  //obscureText: true,
                  //controller: _loginpasswordController.mobileController,
                ),
              ),
              // ListView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 32,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(3.0),
              //         child: PhysicalModel(
              //           color: MyTheme.white,
              //           borderRadius: BorderRadius.circular(5),
              //           elevation: 20,
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: size.width * 0.01,
              //                 vertical: size.height * 0.004),
              //             child: Container(
              //               //height: size.height * 0.025,
              //               width: size.width * 0.17,
              //               decoration: BoxDecoration(
              //                 color: MyTheme.ThemeColors,
              //                 borderRadius: BorderRadius.circular(5),
              //               ),
              //               child: Column(
              //                 mainAxisAlignment:
              //                     MainAxisAlignment.center,
              //                 children: [
              //                   Text(
              //                     'MAR',
              //                     style: TextStyle(
              //                       fontSize: size.height * 0.015,
              //                       fontWeight: FontWeight.w600,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: size.height * 0.01,
              //                   ),
              //                   Text(
              //                     '${index}',
              //                     style: TextStyle(
              //                       fontSize: size.height * 0.016,
              //                       fontWeight: FontWeight.w600,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     }),
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
                text: 'Go Next >',
                press: () async {
                  //_doctor_1_controller.onInit();
                  // _driver_1111_controller.getStateDriverApi();
                  // _doctor_1_controller.update();
                  //_driver_1111_controller.ambulancecatagaryyApi();
                  //RxStatus.loading();
                  CallLoader.loader();
                  await Future.delayed(Duration(seconds: 1));
                  CallLoader.hideLoader();
                  await Get.to(DriverSignup2());
                  //Driver_1111_Controller//
                  //_driver_1111_controller.checkDriver1111();
                  ///Get.to(DriverSignup2());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
