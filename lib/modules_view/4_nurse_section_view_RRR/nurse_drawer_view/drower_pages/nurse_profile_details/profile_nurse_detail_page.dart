import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_profile_controller.dart';

class NurseDetailProfile extends StatelessWidget {
  const NurseDetailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    NurseProfileControllersdetail _nurseprofileContrller =
        Get.put(NurseProfileControllersdetail());

    return Scaffold(
      backgroundColor: MyTheme.white,
      body: Obx(
        () => (_nurseprofileContrller.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: size.height * 0.25,
                          width: size.width,
                          color: MyTheme.ThemeColors,
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        PhysicalModel(
                          color: Colors.cyan,
                          shadowColor: Colors.cyan.shade700,
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: size.height * 0.4,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  //color: Colors.red.shade200,
                                  // image: const DecorationImage(
                                  //     image: NetworkImage(
                                  //       'https://images.unsplash.com/photo-1623682687826-fe06bf64e6d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTV8blNwa29NdC1DeW98fGVufDB8fHx8&auto=format&fit=crop&w=600&q=60',
                                  //     ),
                                  //     fit: BoxFit.fill)
                                  ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.person,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.solidMessage,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.phone,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.addressCard,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.city,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.locationPinLock,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.sortNumericAsc,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _nurseprofileContrller
                                              .getNurseProfile!.nurseName
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: size.height * 0.018,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          _nurseprofileContrller
                                              .getNurseProfile!.emailId
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: size.height * 0.018,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          _nurseprofileContrller
                                              .getNurseProfile!.mobileNumber
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: size.height * 0.018,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.05,
                                          width: size.width * 0.6,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              _nurseprofileContrller
                                                  .getNurseProfile!.location
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.016,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          _nurseprofileContrller
                                              .getNurseProfile!.stateName
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: size.height * 0.018,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          _nurseprofileContrller
                                              .getNurseProfile!.cityName
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: size.height * 0.018,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          _nurseprofileContrller
                                              .getNurseProfile!.pinCode
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: size.height * 0.018,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: size.height * 0.14,
                      left: size.width * 0.35,
                      //right: size.width * 0.0,
                      child: PhysicalModel(
                        elevation: 14,
                        color: Colors.green.shade200,
                        shape: BoxShape.circle,
                        shadowColor: MyTheme.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.31,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                  'lib/assets/image/ps_welness2.png',
                                ))),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.012,
                      left: size.width * 0.0,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: size.height * 0.03,
                              width: size.width * 0.12,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                size: size.height * 0.023,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            'Nurse Profile Details',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: size.height * 0.024,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
