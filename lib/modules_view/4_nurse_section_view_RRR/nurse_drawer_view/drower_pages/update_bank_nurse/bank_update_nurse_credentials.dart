import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_drawer_view/drower_pages/update_bank_nurse/update_bank_nrs_controller.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
//import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/update_bank_seperate_controller/update_bank_seperate_chemist_controller.dart';
//import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

//import '../../../widgets/circular_loader.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
// //import 'package:ps_welness/modules_view/home_page_view/home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

//import '../../../../controllers/6_chemist_view_controllers/update_bank_controller/update_bank_detail_controller.dart';

class UpdateBankNurseCredentials extends StatelessWidget {
  UpdateBankNurseCredentials({Key? key}) : super(key: key);
  // DoctorUpdateBankDetailController _doctorUpdateBankDetailController =
  //     Get.put(DoctorUpdateBankDetailController());

  UpdateBankSeperatenrsController _updateBankSeperatenrsController =
      Get.put(UpdateBankSeperatenrsController());

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
      key: _updateBankSeperatenrsController.updateseperatenrsbankformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.0,
            ),
            Text(
              'Update Details:',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: size.width * 0.04),
            ),
            SizedBox(
              height: size.height * 0.0,
              //appPadding / 2,
            ),

            ///TODO: bankAc  no...........................

            NeumorphicTextFieldContainer(
              child: TextFormField(
                // keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.creditCardNumber],
                controller: _updateBankSeperatenrsController.AccountNo,
                onSaved: (value) {
                  _updateBankSeperatenrsController.accountNo = value!;
                },
                validator: (value) {
                  return _updateBankSeperatenrsController
                      .validbankaccount(value!);
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
                controller: _updateBankSeperatenrsController.IFSCCode,
                onSaved: (value) {
                  _updateBankSeperatenrsController.iFSCCode = value!;
                },
                validator: (value) {
                  return _updateBankSeperatenrsController.validifsc(value!);
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

            ///TODO:  bank name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _updateBankSeperatenrsController.BranchName,
                onSaved: (value) {
                  _updateBankSeperatenrsController.branchName = value!;
                },
                validator: (value) {
                  return _updateBankSeperatenrsController.validbranch(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Bank name.',
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

            ///TODO:  branch address.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _updateBankSeperatenrsController.BranchAddress,
                onSaved: (value) {
                  _updateBankSeperatenrsController.branchAddress = value!;
                },
                validator: (value) {
                  return _updateBankSeperatenrsController
                      .validbranchaddress(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Branch Address.',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.pin_drop,
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

            ///TODO:  accountholder name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _updateBankSeperatenrsController.HolderName,
                onSaved: (value) {
                  _updateBankSeperatenrsController.accountNo = value!;
                },
                validator: (value) {
                  return _updateBankSeperatenrsController.validname(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Account Holder name.',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_box,
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

            ///TODO:  mobile no .......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.newPassword],
                controller: _updateBankSeperatenrsController.MobileNumber,
                onSaved: (value) {
                  _updateBankSeperatenrsController.mobileNumber = value!;
                },
                validator: (value) {
                  return _updateBankSeperatenrsController.validmobile(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Valid Mobile no',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),

            RectangularButton(
                text: 'Update Bank',
                press: () {
                  _updateBankSeperatenrsController
                      .checkUpdateBankSeperateFrDetail();
                  CallLoader.hideLoader();
                })
          ],
        ),
      ),
    );
  }
}