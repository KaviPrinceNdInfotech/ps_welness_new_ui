import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/add_dept_spec_page_view/list_dept_spec/list_dept_specialist.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/add_dept_spec_page_view/list_dept_spec/list_dept_specialist.dart';

import '../../../../controllers/2_franchises_controller/add_department_and_spealist_controller/add_dept_specialist_view.dart';

class AdddeptSpecialCredentials extends StatelessWidget {
  AdddeptSpecialCredentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  AdddepartmentController _adddepartmentController =
      Get.put(AdddepartmentController());

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
      key: _adddepartmentController.adddepartmentformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(7),
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

            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.2,
              margin: EdgeInsets.symmetric(vertical: appPadding / 3),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        lightPrimary2,
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
              child: InkWell(
                onTap: () {
                  Get.to(() => DeptSpecList());
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
                    child: Center(
                      child: Text(
                        'View List',
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),

            ///todo:  name..........
            Container(
              height: size.height * 0.07,
              //width: size.width * 0.37,
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
              child: TextFormField(
                keyboardType: TextInputType.name,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _adddepartmentController.nameController,
                onSaved: (value) {
                  _adddepartmentController.name = value!;
                },
                validator: (value) {
                  return _adddepartmentController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  hintText: 'Dept Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 12,
                  ),
                  // prefixIcon: Icon(
                  //   Icons.account_box,
                  //   color: black.withOpacity(0.7),
                  //   size: 20,
                  // ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.07,
              //width: size.width * 0.37,
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
              child: TextFormField(
                keyboardType: TextInputType.name,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _adddepartmentController.branchController,
                onSaved: (value) {
                  _adddepartmentController.branch = value!;
                },
                validator: (value) {
                  return _adddepartmentController.validDept(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  hintText: 'Enter service',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 12,
                  ),
                  // prefixIcon: Icon(
                  //   Icons.account_box,
                  //   color: black.withOpacity(0.7),
                  //   size: 20,
                  // ),
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.2,
              margin: EdgeInsets.symmetric(vertical: appPadding / 3),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        lightPrimary1,
                        darkPrimary2,
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
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
                  child: Center(
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
