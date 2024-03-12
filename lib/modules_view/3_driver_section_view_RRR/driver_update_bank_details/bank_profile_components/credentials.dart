import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_update_bank_details/update_bank_driver_controller.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

class UpdateDriverBankCredentials extends StatelessWidget {
  UpdateDriverBankCredentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  UpdateBankSeperatedvrController _updateBankdvrController =
      Get.put(UpdateBankSeperatedvrController());
  //class UpdateBankSeperatedvrController extends GetxController {

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
      key: _updateBankdvrController.updateseperatedvrbankformkey,
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

            ///TODO: bankAc  no.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                // keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.creditCardNumber],
                controller: _updateBankdvrController.AccountNo,
                onSaved: (value) {
                  _updateBankdvrController.accountNo = value!;
                },
                validator: (value) {
                  return _updateBankdvrController.validbankaccount(value!);
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
                controller: _updateBankdvrController.IFSCCode,
                onSaved: (value) {
                  _updateBankdvrController.iFSCCode = value!;
                },
                validator: (value) {
                  return _updateBankdvrController.validifsc(value!);
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
                controller: _updateBankdvrController.BranchName,
                onSaved: (value) {
                  _updateBankdvrController.branchName = value!;
                },
                validator: (value) {
                  return _updateBankdvrController.validbranch(value!);
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

            ///TODO:  branch address.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _updateBankdvrController.BranchAddress,
                onSaved: (value) {
                  _updateBankdvrController.branchAddress = value!;
                },
                validator: (value) {
                  return _updateBankdvrController.validbranchaddress(value!);
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
                controller: _updateBankdvrController.HolderName,
                onSaved: (value) {
                  _updateBankdvrController.accountNo = value!;
                },
                validator: (value) {
                  return _updateBankdvrController.validname(value!);
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
                controller: _updateBankdvrController.MobileNumber,
                onSaved: (value) {
                  _updateBankdvrController.mobileNumber = value!;
                },
                validator: (value) {
                  return _updateBankdvrController.validmobile(value!);
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
                  _updateBankdvrController.checkUpdateBankSeperatecheDetail();
                  //_updateBankdvrController.hideLoader();
                })
          ],
        ),
      ),
    );
  }
}
