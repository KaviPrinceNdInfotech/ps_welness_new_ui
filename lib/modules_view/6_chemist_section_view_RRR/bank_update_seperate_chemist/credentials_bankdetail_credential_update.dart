import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/6_chemist_view_controllers_RRR/update_bank_seperate_controller/update_bank_seperate_chemist_controller.dart';
//import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/update_bank_seperate_controller/update_bank_seperate_chemist_controller.dart';
//import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../widgets/circular_loader.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
// //import 'package:ps_welness/modules_view/home_page_view/home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

//import '../../../../controllers/6_chemist_view_controllers/update_bank_controller/update_bank_detail_controller.dart';

class UpdateBankSeperateCredentials extends StatelessWidget {
  UpdateBankSeperateCredentials({Key? key}) : super(key: key);
  // DoctorUpdateBankDetailController _doctorUpdateBankDetailController =
  //     Get.put(DoctorUpdateBankDetailController());

  UpdateBankSeperateController _updateBankSeperateController =
      Get.put(UpdateBankSeperateController());

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
      key: _updateBankSeperateController.updateseperatebankformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Update Details:',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: size.width * 0.04),
            ),
            SizedBox(
              height: size.height * 0.01,
              //appPadding / 2,
            ),

            ///TODO: bankAc  no.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.creditCardNumber],
                controller: _updateBankSeperateController.AccountNo,
                onSaved: (value) {
                  _updateBankSeperateController.accountNo = value!;
                },
                validator: (value) {
                  return _updateBankSeperateController.validbankaccount(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Bank Account No.',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_balance_outlined,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),

            ///TODO: IFSC.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.creditCardNumber],
                controller: _updateBankSeperateController.IFSCCode,
                onSaved: (value) {
                  _updateBankSeperateController.iFSCCode = value!;
                },
                validator: (value) {
                  return _updateBankSeperateController.validifsc(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'IFSC Code',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.qr_code,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),

            ///TODO:  branch name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _updateBankSeperateController.BranchName,
                onSaved: (value) {
                  _updateBankSeperateController.branchName = value!;
                },
                validator: (value) {
                  return _updateBankSeperateController.validbranch(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Branch name.',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_balance_rounded,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),

            RectangularButton(
                text: 'Update Bank',
                press: () {
                  _updateBankSeperateController.checkUpdateBankSeperateDetail();
                  CallLoader.hideLoader();
                })
          ],
        ),
      ),
    );
  }
}
