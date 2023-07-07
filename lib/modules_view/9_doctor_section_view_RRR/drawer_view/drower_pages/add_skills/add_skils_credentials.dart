import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/skils_controller/skils_controllers.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

class AddskillsCredentials extends StatelessWidget {
  AddskillsCredentials({Key? key}) : super(key: key);
  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  SkillsListController _skillsListController = Get.put(SkillsListController());

  get newvalue => null!;

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _skillsListController.skillsformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///todo: other value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                maxLines: 1,
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _skillsListController.skillsnameController,
                onSaved: (value) {
                  _skillsListController.SkillName = value!;
                },
                validator: (value) {
                  return _skillsListController.validskillss(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  hintText: 'Type Your Skills',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  // prefixIcon: Icon(
                  //   Icons.comment_bank_outlined,
                  //   color: black.withOpacity(0.7),
                  //   size: 20,
                  // ),
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(
              height: size.height * 0.02,
            ),

            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: location value..........

            RectangularButton(
                text: 'SUBMIT',
                press: () {
                  CallLoader.loader();
                  _skillsListController.checkSkills();
                  _skillsListController.skillsListApi();
                  _skillsListController.update();
                  _skillsListController.refresh();
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
