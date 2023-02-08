import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/controllers/1_user_view_controller/health_checkup_controllersss/health_chkp_post_controller.dart';
// import 'package:ps_welness/controllers/1_user_view_controller/health_checkup_controllersss/health_chkp_post_controller.dart';
// import 'package:ps_welness/model/1_user_model/city_model/city_modelss.dart';
// import 'package:ps_welness/model/1_user_model/states_model/state_modells.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/health_checkup/checkup_catagary/choose_catagary.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/health_checkup_controller/health_checkup_1_controller.dart';
import '../../../../../controllers/1_user_view_controller/health_checkup_controllersss/health_chkp_post_controller.dart';
import '../../../../../model/1_user_model/city_model/city_modelss.dart';
import '../../../../../model/1_user_model/states_model/state_modells.dart';
import '../../../../../widgets/widgets/neumorphic_text_field_container.dart';
import '../../../../../widgets/widgets/rectangular_button.dart';
import '../../checkup_catagary/choose_catagary.dart';

class HealthCheckupCredentials extends StatelessWidget {
  HealthCheckupCredentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  ChooseHealthchkpsCenterController _chooseHealthchkpsCenterController =
      Get.put(ChooseHealthchkpsCenterController());

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
    return SafeArea(
      child: Form(
        key: _chooseHealthchkpsCenterController.ChooseChekpformkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                //height: size.height * 0.02,
              ),

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
                        value: _chooseHealthchkpsCenterController.selectedState.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.real_estate_agent,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select State'),
                        items:
                        _chooseHealthchkpsCenterController.states.map((StateModel state) {
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
                          _chooseHealthchkpsCenterController.selectedState.value = newValue!;
                          _chooseHealthchkpsCenterController.selectedCity.value = null;
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
                        value: _chooseHealthchkpsCenterController.selectedCity.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Selected City'),
                        items: _chooseHealthchkpsCenterController.cities.map((City city) {
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
                          _chooseHealthchkpsCenterController.refresh();
                        },
                        onChanged: (City? newValue) {
                          _chooseHealthchkpsCenterController.selectedCity.value = newValue!;
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

              ///Todo: select test name.....................................

              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Choose Test',
                style: TextStyle(
                  fontSize: size.height * 0.016,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.blueww,
                ),
              ),

              SizedBox(
                height: size.height * 0.018,
                //appPadding / 2,
              ),

              // GetBuilder<Hospital_2_Controller>(
              //   // specify type as Controller
              //   init: Hospital_2_Controller(), // intialize with the Controller
              //   builder: (value) => InkWell(
              //     onTap: () {
              //       _doctor_2_controller.getImage(ImageSource.gallery);
              //     },
              //     child: NeumorphicTextFieldContainer(
              //       child: Container(
              //         height: size.height * 0.07,
              //         //width: size.width * 0.5,
              //         child: Padding(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: size.width * 0.1),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'Authorise Letter Image',
              //                 style: TextStyle(
              //                   fontSize: size.width * 0.03,
              //                   fontWeight: FontWeight.w700,
              //                 ),
              //               ),
              //               Icon(Icons.camera),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              RectangularButton(
                  text: 'SUBMIT',
                  press: () {
                    Get.to(CheckupCatagaryDetails());
                    // LabListPage());
                    //_loginpasswordController.checkLoginpassword();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
