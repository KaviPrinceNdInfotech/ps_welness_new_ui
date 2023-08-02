import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';

import 'bank_update_seperate_franchise_head_text.dart';
import 'credentials_bankdetail_franchise_credential_update.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

//import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_update_bank_details/profile_components/credentials.dart';
//import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_update_bank_details/profile_components/head_text.dart';

//import 'bank_profile_components/credentials.dart';
//import 'bank_profile_components/head_text.dart';

class UpdateBankChemistSeperateDetail extends StatelessWidget {
  UpdateBankChemistSeperateDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: size.height * 0.016,
                  right: -size.width * 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(10),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/fr_bank_profile1.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UpdateBankFranchiseSeperateHeadText(),
                    UpdateBankSeperateFranchiseCredentials(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
