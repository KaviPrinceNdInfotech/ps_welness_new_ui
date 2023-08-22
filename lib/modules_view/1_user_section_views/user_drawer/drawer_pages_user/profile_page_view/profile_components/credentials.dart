import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
import 'package:ps_welness_new_ui/controllers/profile_u_controller/profile_update_controller.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../../../model/1_user_model/city_model/city_modelss.dart';
import '../../../../../../model/1_user_model/states_model/state_modells.dart';
import '../../../../../../widgets/circular_loader.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/profile_u_controller/profile_update_controller.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
// //import 'package:ps_welness/modules_view/home_page_view/home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

class ProfileCredentials extends StatelessWidget {
  ProfileCredentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  ProfileController _profileController = Get.put(ProfileController());
  UserProfileControllers _userprofile = Get.put(UserProfileControllers());

  // ComplaintController _complaintController = Get.put(ComplaintController());

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
      key: _profileController.profileformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
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
            ///TODO: Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //initialValue: "I am smart",
                autofillHints: [AutofillHints.name],
                controller: _profileController.patientNameController,
                onSaved: (value) {
                  _profileController.patientName = value!;
                },
                validator: (value) {
                  return _profileController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Patient Name',
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

            ///todo: phone number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.number,
                // autofillHints: [AutofillHints.telephoneNumber],
                controller: _profileController.MobileNumberController,
                onSaved: (value) {
                  _profileController.MobileNumber = value!;
                },
                validator: (value) {
                  return _profileController.validPhone(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Phone No',
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



            ///Todo: subject of complain............................

            // NeumorphicTextFieldContainer(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            //     child: Obx(
            //           () => DropdownButtonFormField<Complaint41Patient>(
            //           value: _complaintController.selectedSubject.value,
            //           decoration: InputDecoration(
            //             prefixIcon: Icon(
            //               Icons.real_estate_agent,
            //               color: Colors.black,
            //             ),
            //             enabledBorder: InputBorder.none,
            //             border: InputBorder.none,
            //           ),
            //           hint: Text('Select Subject'),
            //           items:
            //           _complaintController.subject.map((Complaint41Patient subject) {
            //             return DropdownMenuItem(
            //               value: subject,
            //               child: Text(
            //                 subject.subjectName,
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: size.height * 0.015,
            //                 ),
            //               ),
            //             );
            //           }).toList(),
            //           onChanged: (Complaint41Patient? newValue) {
            //             _complaintController.selectedSubject.value = newValue!;
            //             // _hospital_2_controller.states.value =
            //             //     newValue! as List<String>;
            //             // _hospital_2_controller.selectedCity.value = null;
            //             // _hospital_2_controller.cities.clear();
            //             // _hospital_2_controller.cities
            //             //     .addAll(stateCityMap[newvalue]!);
            //           }),
            //     ),
            //   ),
            // ),

            ///todo: state...............
            ///
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<StateModel>(
                      value: _profileController.selectedState.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Select State'),
                      items: _profileController.states.map((StateModel state) {
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
                        _profileController.selectedState.value = newValue!;
                        _profileController.selectedCity.value = null;
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

            ///Todo: city.....................................

            SizedBox(
              height: size.height * 0.02,
            ),

            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<City>(
                      //icon: Icon(Icons.location_city),
                      value: _profileController.selectedCity.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Selected City'),
                      items: _profileController.cities.map((City city) {
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
                      onTap: () {
                        _profileController.refresh();
                      },
                      onChanged: (City? newValue) {
                        _profileController.selectedCity.value = newValue!;
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

            ///todo: location value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _profileController.LocationController,
                onSaved: (value) {
                  _profileController.Location = value!;
                },
                validator: (value) {
                  return _profileController.validLocation(value!);
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

            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            //
            // ///Todo: fees..............
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     controller: _profileController.feesController,
            //     onSaved: (value) {
            //       _profileController.fees = value!;
            //     },
            //     validator: (value) {
            //       return _profileController.validFees(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Fees',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.currency_rupee,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

            SizedBox(
              height: size.height * 0.02,
            ),

            ///TODO: Pin.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.password],
                controller: _profileController.PinCodeController,
                onSaved: (value) {
                  _profileController.pin = value!;
                },
                validator: (value) {
                  return _profileController.validPin(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Pin',
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
              height: size.height * 0.01,
              //appPadding / 2,
            ),
            // Text(
            //   'Bank Details:',
            //   style: TextStyle(
            //       fontWeight: FontWeight.w700, fontSize: size.width * 0.04),
            // ),
            //
            // SizedBox(
            //   height: size.height * 0.01,
            //   //appPadding / 2,
            // ),
            //
            // ///TODO: bankAc  no.......................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     keyboardType: TextInputType.number,
            //     autofillHints: [AutofillHints.creditCardNumber],
            //     controller: _profileController.AccountNoController,
            //     onSaved: (value) {
            //       _profileController.AccountNo = value!;
            //     },
            //     validator: (value) {
            //       return _profileController.validAccount(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Bank Account No.',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.account_balance_outlined,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            //
            // SizedBox(
            //   height: size.height * 0.018,
            //   //appPadding / 2,
            // ),
            //
            // ///TODO: IFSC.......................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.creditCardNumber],
            //     controller: _profileController.IFSCCodeController,
            //     onSaved: (value) {
            //       _profileController.IFSCCode = value!;
            //     },
            //     validator: (value) {
            //       return _profileController.validIfsc(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'IFSC Code',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.qr_code,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            //
            // SizedBox(
            //   height: size.height * 0.018,
            //   //appPadding / 2,
            // ),
            //
            // ///TODO:  bank name.......................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.name],
            //     controller: _profileController.BranchNameController,
            //     onSaved: (value) {
            //       _profileController.BranchName = value!;
            //     },
            //     validator: (value) {
            //       return _profileController.validBranch(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Branch name.',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.account_balance_rounded,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

            SizedBox(
              height: size.height * 0.01,
              //appPadding / 2,
            ),

            RectangularButton(
                text: 'UPDATE',
                press: () {
                  CallLoader.loader();
                  _profileController.checkProfilee();
                  _userprofile.update();
                  _userprofile.userprofileApi();
                  _userprofile.onInit();

                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
