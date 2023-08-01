import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/10_lab_controller/add_test_lab_controller/lab_test_add_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/test_name_model/test_name_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../widgets/circular_loader.dart';

//import 'package:ps_welness/constants/constants/constants.dart';

//import 'package:ps_welness/modules_view/drawer_view/drower_pages/complaint_page/complaint_components/credentials.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/complaint_page/complaint_components/head_text.dart';
class RIKeys {
  static final riKey1 = const Key('__RIKEY1__');
  static final riKey2 = const Key('__RIKEY2__');
  static final riKey3 = const Key('__RIKEY3__');
}

class AddTestPageLab extends StatelessWidget {
  AddTestPageLab({Key? key}) : super(key: key);
  LabTestListController _labTestListController =
      Get.put(LabTestListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Form(
        key: _labTestListController.testformkey2323,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            // appBar: AppBar(
            //   backgroundColor: MyTheme.ThemeColors,
            //   elevation: 0,
            //   title: Text('Update Profile'),
            // ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  // clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: size.height * 0.014,
                      //bottom: size.height * 0.64,
                      //left: -30,
                      right: -size.width * 0.006,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: size.height * 0.200,
                          width: size.width * 0.40,
                          decoration: BoxDecoration(
                              //color: Colors.,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                    'lib/assets/icons/lab_report_view.png',
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: appPadding,
                              vertical: appPadding / 2,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Icon(
                                            Icons.arrow_back_ios_outlined)),
                                    SizedBox(
                                      width: size.width * 0.03,
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.width * 0.05,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: size.height * 0.05),
                                Text(
                                  'Add Lab Test',
                                  style: GoogleFonts.alatsi(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                // RichText(
                                //   text: TextSpan(
                                //     children: <TextSpan>[
                                //       TextSpan(
                                //         text: 'Please enter your complain.',
                                //         style: GoogleFonts.poppins(
                                //           fontSize: 23,
                                //           color: Colors.black87,
                                //           fontWeight: FontWeight.w600,
                                //           //color: Color(0xff023382)
                                //         ),
                                //       ),
                                //       TextSpan(
                                //         text: '',
                                //         style: GoogleFonts.alatsi(
                                //           fontSize: 20,
                                //           fontWeight: FontWeight.w600,
                                //           color: Colors.deepPurple.shade500,
                                //           //color: Color(0xff023382)
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Text(
                                //   'Sign Up',
                                //   style: TextStyle(
                                //     fontSize: 24,
                                //     fontWeight: FontWeight.w600,
                                //     //color: Color(0xff023382)
                                //   ),
                                // ),

                                //HospitalSocial(),
                                //Spacer(),
                              ],
                            ),
                          ),

                          ///todo: other value..........
                          // Padding(
                          //   padding:
                          //       EdgeInsets.only(top: 30, right: 20, left: 20),
                          //   child: NeumorphicTextFieldContainer(
                          //     child: TextFormField(
                          //       key: RIKeys.riKey1,
                          //       maxLines: 1,
                          //       autofillHints: [
                          //         AutofillHints.addressCityAndState
                          //       ],
                          //       controller:
                          //           _labTestListController.skillsnameController,
                          //       onSaved: (value) {
                          //         _labTestListController.SkillName = value!;
                          //       },
                          //       validator: (value) {
                          //         return _labTestListController
                          //             .validskillss(value!);
                          //       },
                          //       cursorColor: Colors.black,
                          //       obscureText: false,
                          //       decoration: InputDecoration(
                          //         contentPadding: EdgeInsets.all(20.0),
                          //         hintText: 'Type Your Test',
                          //         helperStyle: TextStyle(
                          //           color: black.withOpacity(0.7),
                          //           fontSize: 18,
                          //         ),
                          //         // prefixIcon: Icon(
                          //         //   Icons.comment_bank_outlined,
                          //         //   color: black.withOpacity(0.7),
                          //         //   size: 20,
                          //         // ),
                          //         border: InputBorder.none,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          //
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 14, right: 10, left: 10),
                            child: NeumorphicTextFieldContainer(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.00),
                                child: Obx(
                                  () => DropdownButtonFormField(
                                      //key: RIKeys.riKey2,
                                      // menuMaxHeight: size.height * 0.06,
                                      //icon: Icon(Icons.location_city),
                                      value: _labTestListController
                                          .selectedTest.value,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.text_snippet_outlined,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,
                                      ),
                                      hint: Text('Selected Test'),
                                      items: _labTestListController.tests
                                          .map((TestModel test) {
                                        return DropdownMenuItem(
                                          value: test,
                                          child: SizedBox(
                                            width: size.width * 0.74,
                                            // height: size.height * 0.02,
                                            child: Text(
                                              test.testName,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.height * 0.014,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (TestModel? newValue) {
                                        _labTestListController
                                            .selectedTest.value = newValue!;
                                      }),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: size.height * 0.0,
                            //appPadding / 2,
                          ),

                          SizedBox(
                            height: size.height * 0.02,
                          ),

                          ///todo: location value..........

                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, right: 20, left: 20),
                            child: RectangularButton(
                                //key: _labTestListController.testformkey2323,
                                text: 'SUBMIT',
                                press: () async {
                                  //_labTestListController.onInit();
                                  CallLoader.loader();
                                  await Future.delayed(Duration(seconds: 2));
                                  CallLoader.hideLoader();
                                  await SharedPreferences.getInstance().then(
                                      (value) => _labTestListController
                                          .labTestListApi());
                                  _labTestListController.update();

                                  ///
                                  ///CallLoader.loader();
                                  _labTestListController.addLabTestApi();
                                  //_labTestListController.checkTest();
                                  _labTestListController.labTestListApi();
                                  _labTestListController.update();
                                  _labTestListController.refresh();
                                  // _labTestListController.onInit();
                                  //_loginpasswordController.checkLoginpassword();
                                  //Get.to(HomePage());
                                  //_loginpasswordController.checkLoginpassword();
                                }),
                          )
                        ]),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
