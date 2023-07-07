import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/all_dept_section/all_dept.dart';

import '../../../../constants/constants/constants.dart';
import '../../../../controllers/2_franchises_controller/add_department_and_spealist_controller/add_department_single.dart';
import '../../all_dept_section/all_dept.dart';

class AddSingleDeptCredentials extends StatelessWidget {
  AddSingleDeptCredentials({Key? key}) : super(key: key);

  AddSingleDepartmentController _addsingledepartmentController = Get.put(AddSingleDepartmentController());

  var items = [
    'Advance Life Support Ambulance',
    'Basic Life Support Ambulance',
    'Patient Transport Ambulance',
  ];
  get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _addsingledepartmentController.addsingledepartmentformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              height: size.height * 0.0,
            ),
            ///todo:  name..........
            Container(
              height: size.height * 0.07,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        lightPrimary,
                        darkPrimary,
                      ]),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
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
                controller: _addsingledepartmentController.nameController,
                onSaved: (value) {
                  _addsingledepartmentController.name = value!;
                },
                validator: (value) {
                  return _addsingledepartmentController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  hintText: 'Enter Department',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 12,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(
              onTap: (){
                _addsingledepartmentController.checkadddeptspeceee();
              },
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.99,
                margin: const EdgeInsets.symmetric(vertical: 30 / 9),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.red.shade300,
                          Colors.cyan,
                        ]),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
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
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w700,
                        ),
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
