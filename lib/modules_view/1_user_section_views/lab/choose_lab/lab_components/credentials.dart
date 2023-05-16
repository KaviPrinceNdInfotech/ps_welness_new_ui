import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';

// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/model/1_user_model/city_model/city_modelss.dart';
// import 'package:ps_welness/model/1_user_model/states_model/state_modells.dart';
// import 'package:ps_welness/model/1_user_model/test_name_model/test_name_modells.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/lab/lab_catagary/choose_catagary.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/lab_controller/choose_lab_controller/lab_controller.dart';
import '../../../../../model/1_user_model/city_model/city_modelss.dart';
import '../../../../../model/1_user_model/test_name_model/test_name_modells.dart';
import '../../../../../widgets/widgets/rectangular_button.dart';

class LabCredentials extends StatelessWidget {
  LabCredentials({Key? key}) : super(key: key);

  ChooseLabController _chooseLabController = Get.put(ChooseLabController());

  //Doctor_2_Controller _doctor_2_controller = Get.put(Doctor_2_Controller());

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
        key: _chooseLabController.ChooseLabformkey,
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
                        value: _chooseLabController.selectedState.value,
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
                            _chooseLabController.states.map((StateModel state) {
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
                          _chooseLabController.selectedState.value = newValue!;
                          _chooseLabController.selectedCity.value = null;
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
                        value: _chooseLabController.selectedCity.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Selected City'),
                        items: _chooseLabController.cities.map((City city) {
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
                          _chooseLabController.refresh();
                        },
                        onChanged: (City? newValue) {
                          _chooseLabController.selectedCity.value = newValue!;
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

              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
                  child: Obx(
                    () => DropdownButtonFormField(
                        // menuMaxHeight: size.height * 0.06,
                        //icon: Icon(Icons.location_city),
                        value: _chooseLabController.selectedTest.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.text_snippet_outlined,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Selected Test'),
                        items: _chooseLabController.tests.map((TestModel test) {
                          return DropdownMenuItem(
                            value: test,
                            child: Text(
                              test.testName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.010,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (TestModel? newValue) {
                          _chooseLabController.selectedTest.value = newValue!;
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
                    CallLoader.loader();
                    _chooseLabController.checklab1();
                    // Get.to(LabCatagaryDetails());
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
