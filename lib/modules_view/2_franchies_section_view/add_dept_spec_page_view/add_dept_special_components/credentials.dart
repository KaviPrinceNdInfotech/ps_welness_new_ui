import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/model/franchies_models/Dept_dropdown_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/specialistDW_model.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/add_dept_spec_page_view/list_dept_spec/list_dept_specialist.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/add_dept_spec_page_view/list_dept_spec/list_dept_specialist.dart';

import '../../../../controllers/2_franchises_controller/add_department_and_spealist_controller/add_dept_specialist_view.dart';

class AdddeptSpecialCredentials extends StatelessWidget {
  AdddeptSpecialCredentials({Key? key}) : super(key: key);

  AdddepartmentController _adddepartmentController = Get.put(AdddepartmentController());

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  get newvalue => null!;

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
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.2,
              margin: const EdgeInsets.symmetric(vertical: appPadding / 3),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        lightPrimary2,
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
              child: InkWell(
                onTap: () {
                  Get.to(() => DeptSpecList());
                },
                child: SizedBox(
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
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(() => DropdownButtonFormField<FranchiseDepartment>(
                      value: _adddepartmentController.selectedDep.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Department'),
                      items: _adddepartmentController.department.map((FranchiseDepartment items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items.departmentName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (FranchiseDepartment? newValue) {
                        _adddepartmentController.selectedDep.value = newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                      () => DropdownButtonFormField<FranchiseSpecialist>(
                      value: _adddepartmentController.selectedSpec.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Specialist'),
                      items: _adddepartmentController.specialist.map((FranchiseSpecialist items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items.specialistName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (FranchiseSpecialist? newValue) {
                        _adddepartmentController.selectedSpec.value = newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(
              onTap: (){
                _adddepartmentController.checkadddeptspeceee();
              },
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.2,
                margin: const EdgeInsets.symmetric(vertical: appPadding / 3),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          lightPrimary1,
                          darkPrimary2,
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
                          fontSize: size.width * 0.03,
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
