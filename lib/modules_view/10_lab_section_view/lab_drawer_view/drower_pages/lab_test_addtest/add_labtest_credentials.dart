import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/controllers/10_lab_controller/add_test_lab_controller/lab_test_add_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/lab_details/lab_testname_model_new.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

class AddlabtestCredentials extends StatelessWidget {
  AddlabtestCredentials({Key? key}) : super(key: key);
  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  LabTestListController _labTestListController =
      Get.put(LabTestListController());

  get newvalue => null!;

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      //key: _labTestListController.testformkey2323,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///todo: other value..........
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     maxLines: 1,
            //     autofillHints: [AutofillHints.addressCityAndState],
            //     controller: _labTestListController.skillsnameController,
            //     onSaved: (value) {
            //       _labTestListController.SkillName = value!;
            //     },
            //     validator: (value) {
            //       return _labTestListController.validskillss(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.all(20.0),
            //       hintText: 'Type Your Test',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       // prefixIcon: Icon(
            //       //   Icons.comment_bank_outlined,
            //       //   color: black.withOpacity(0.7),
            //       //   size: 20,
            //       // ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

            SizedBox(
              height: size.height * 0.02,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
                child: Obx(
                  () => DropdownButtonFormField(
                      // menuMaxHeight: size.height * 0.06,
                      //icon: Icon(Icons.location_city),
                      value: _labTestListController.selectedTest.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.text_snippet_outlined,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Selected Test'),
                      items:
                          _labTestListController.tests.map((LabTestName test) {
                        return DropdownMenuItem(
                          value: test,
                          child: Text(
                            test.testDesc.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.010,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (LabTestName? newValue) {
                        _labTestListController.selectedTest.value = newValue!;
                      }),
                ),
              ),
            ),

            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),

            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: location value..........

            RectangularButton(
                text: 'SUBMIT',
                press: () {
                  CallLoader.loader();
                  _labTestListController.checkTest();
                  _labTestListController.labTestListApi();
                  _labTestListController.update();
                  _labTestListController.refresh();
                  //_loginpasswordController.checkLoginpassword();
                  //Get.to(HomePage());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
