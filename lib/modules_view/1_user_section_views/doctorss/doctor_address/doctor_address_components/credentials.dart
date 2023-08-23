import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/doctor_sections/get_doctor_list_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/model/1_user_model/city_model/city_modelss.dart';
// import 'package:ps_welness/model/1_user_model/states_model/state_modells.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/doctorss/appointment_section/catagary/choose_catagary.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../../controllers/1_user_view_controller/doctor_sections/doctors_appointment1.dart';
import '../../../../../model/1_user_model/get_department_list_model/department_model.dart';
import '../../../../../model/1_user_model/get_speacilist_bydeptid_model/get_speacilist_bydeptid.dart';
import '../../../../../model/1_user_model/states_model/state_modells.dart';

class DoctorAddressCredentials extends StatelessWidget {
  DoctorAddressCredentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  Doctor_appointment_1_Controller _doctor_appointment_1_controller =
      Get.put(Doctor_appointment_1_Controller());
  DoctorListController _doctorListController = Get.put(DoctorListController());

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
      key: _doctor_appointment_1_controller.doctorappointment1key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),

            ///Todo: state............................
            SizedBox(
              height: size.height * 0.01,
            ),

            Text(
              'Choose State',
              style: TextStyle(
                fontSize: size.height * 0.016,
                fontWeight: FontWeight.bold,
                color: MyTheme.blueww,
              ),
            ),

            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<StateModel>(
                      value:
                          _doctor_appointment_1_controller.selectedState.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Select State'),
                      items: _doctor_appointment_1_controller.states
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
                        _doctor_appointment_1_controller.selectedState.value =
                            newValue!;
                        _doctor_appointment_1_controller.selectedCity.value =
                            null;
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

            Text(
              'Choose City',
              style: TextStyle(
                fontSize: size.height * 0.016,
                fontWeight: FontWeight.bold,
                color: MyTheme.blueww,
              ),
            ),

            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<City>(
                      //icon: Icon(Icons.location_city),
                      value:
                          _doctor_appointment_1_controller.selectedCity.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Selected City'),
                      items: _doctor_appointment_1_controller.cities
                          .map((City city) {
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
                        _doctor_appointment_1_controller.refresh();
                      },
                      onChanged: (City? newValue) {
                        _doctor_appointment_1_controller.selectedCity.value =
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
            SizedBox(
              height: size.height * 0.01,
            ),

            ///todo>>>>>>>>>>>department.........

            ///Todo: department............................
            SizedBox(
              height: size.height * 0.01,
            ),

            Text(
              'Choose Department',
              style: TextStyle(
                fontSize: size.height * 0.016,
                fontWeight: FontWeight.bold,
                color: MyTheme.blueww,
              ),
            ),

            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<DepartmentModel>(
                      value: _doctor_appointment_1_controller
                          .selectedDepartment.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.space_dashboard_outlined,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Select Department'),
                      items: _doctor_appointment_1_controller.department
                          .map((DepartmentModel department) {
                        return DropdownMenuItem(
                          value: department,
                          child: Text(
                            department.departmentName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.013,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (DepartmentModel? newValue) {
                        _doctor_appointment_1_controller
                            .selectedDepartment.value = newValue!;
                        _doctor_appointment_1_controller
                            .selectedSpecialist.value = null;
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

            ///Todo: speacilist.....................................

            SizedBox(
              height: size.height * 0.02,
            ),

            Text(
              'Choose Specialist',
              style: TextStyle(
                fontSize: size.height * 0.016,
                fontWeight: FontWeight.bold,
                color: MyTheme.blueww,
              ),
            ),

            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<SpecialistModel>(
                      //icon: Icon(Icons.location_city),
                      value: _doctor_appointment_1_controller
                          .selectedSpecialist.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.folder_special,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text(' Choose Specialist'),
                      items: _doctor_appointment_1_controller.specialist
                          .map((SpecialistModel specialist) {
                        return DropdownMenuItem(
                          value: specialist,
                          child: Text(
                            specialist.specialistName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onTap: () {
                        _doctor_appointment_1_controller.refresh();
                      },
                      onChanged: (SpecialistModel? newValue) {
                        _doctor_appointment_1_controller
                            .selectedSpecialist.value = newValue!;
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
              height: size.height * 0.018,
              //appPadding / 2,
            ),

            SizedBox(
              height: size.height * 0.00,
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
            // ),...............for..................

            RectangularButton(
                text: 'SUBMIT',
                press: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("doctorstateId",
                      "${_doctor_appointment_1_controller.selectedState.value?.id.toString()}");
                  prefs.setString("doctorcityId",
                      "${_doctor_appointment_1_controller.selectedCity.value?.id.toString()}");
                  prefs.setString("doctordepartmentId",
                      "${_doctor_appointment_1_controller.selectedDepartment.value?.id.toString()}");
                  prefs.setString("doctorspeacilistId",
                      "${_doctor_appointment_1_controller.selectedSpecialist.value?.id.toString()}");
                  _doctorListController.doctorListApi();
                  _doctorListController.update();
                  _doctor_appointment_1_controller.update();
                  _doctor_appointment_1_controller.doctorcheck1();
                  //Get.to(DoctorListUser());
                  //this is not required in detail list
                  ///Get.to(CatagaryDetails());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
