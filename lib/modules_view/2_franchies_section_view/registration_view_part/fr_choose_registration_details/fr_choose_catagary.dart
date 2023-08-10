import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesChemistDetail_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesDoctorDetail_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesDriverDetail_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesLabDetail_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesNurseDetail_Controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesPatientDetail_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesRWADetail_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesVehicleDetail_controller.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';

// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';

import '../../fr_registration_detailsss/fr_registration_detail_chemist/fr_registration_chemist_detailss.dart';
import '../../fr_registration_detailsss/fr_registration_detail_doctor/fr_registration_doctor_detailss.dart';
import '../../fr_registration_detailsss/fr_registration_detail_driver/fr_registration_driver_detailss.dart';
import '../../fr_registration_detailsss/fr_registration_detail_lab/fr_registration_lab_detailss.dart';
import '../../fr_registration_detailsss/fr_registration_detail_nurse/fr_registration_nurse_detailss.dart';
import '../../fr_registration_detailsss/fr_registration_detail_patient/fr_registration_patient_detailss.dart';
import '../../fr_registration_detailsss/fr_registration_detail_rwa/fr_registration_rwa_detailss.dart';
import '../../fr_registration_detailsss/fr_registration_detail_vehicle/fr_registration_vehicle_detailss.dart';

class FrRegistrationDetails extends StatelessWidget {
  FrRegistrationDetails({Key? key}) : super(key: key);

  final List<String> doctorcatagary = [
    'Vehicle Details',
    'Driver Details',
    'Doctor Details',
    'Patient Details',
    'Chemist Details',
    'Nurse Details',
    'Lab Details',
    // 'Checkup Details',
    'Rwa Details',
  ];

  final List<String> catimage = [
    'lib/assets/icons/frd0.png',
    'lib/assets/icons/frd2.png',
    'lib/assets/icons/frd3.png',
    'lib/assets/icons/frd4.png',
    'lib/assets/icons/frd5.png',
    'lib/assets/icons/frd6.png',
    'lib/assets/icons/frd7.png',
    // 'lib/assets/icons/frd8.png',
    'lib/assets/icons/frd9.png',
  ];
  FrenchiesRWADetailController _frenchiesRWADetailController =
      Get.put(FrenchiesRWADetailController());
  FrenchiesLabDetailController _frenchiesLabDetailController =
      Get.put(FrenchiesLabDetailController());
  FrenchiesChemistDetailController _frenchiesChemistDetailController =
      Get.put(FrenchiesChemistDetailController());
  FrenchiesNurseDetailController _frenchiesNurseDetailController =
      Get.put(FrenchiesNurseDetailController());
  FrenchiesPatientDetailController _frenchiesPatientDetailController =
      Get.put(FrenchiesPatientDetailController());
  FrenchiesDoctorDetailController _frenchiesDoctorDetailController =
      Get.put(FrenchiesDoctorDetailController());
  FrenchiesDriverDetailController _frenchiesDriverDetailController =
      Get.put(FrenchiesDriverDetailController());

  FrenchiesVehicleDetailController _frenchiesVehicleDetailController =
      Get.put(FrenchiesVehicleDetailController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        backgroundColor: Color(0xff11f2ec),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.18,
                    color: Color(0xff11f2ec),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: MyTheme.blueww,
                                    size: size.height * 0.027,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  'Registration Details',
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: size.width * 0.06,
                                    color: MyTheme.blueww,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              color: Colors.white),
                          width: size.width,
                          height: size.height * 0.06,
                          margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(splashColor: Colors.transparent),
                            child: TextField(
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 15.0, color: MyTheme.blueww),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search catagary',
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, bottom: 12.0, top: 0.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.0001,
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.01),
                    child: Container(
                      height: size.height * 0.71,
                      color: Color(0xff11f2ec),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: size.height * 0.21,
                            mainAxisExtent: size.height * 0.12,
                            childAspectRatio: 4 / 3,
                            crossAxisSpacing: size.width * 0.006,
                            mainAxisSpacing: size.height * 0.006,
                          ),
                          itemCount: doctorcatagary.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01,
                                  vertical: size.height * 0.003),
                              child: InkWell(
                                onTap: () async {
                                  if (index == 0) {
                                    _frenchiesVehicleDetailController
                                        .FrenchiesVehicleDetailApi();
                                    _frenchiesVehicleDetailController.update();
                                    CallLoader.loader();
                                    await Future.delayed(
                                        Duration(milliseconds: 900));
                                    CallLoader.hideLoader();
                                    Get.to(() => ResitrationVechileDetails());
                                  } else if (index == 1) {
                                    _frenchiesDriverDetailController
                                        .FrenchiesDriverDetailApi();
                                    _frenchiesDriverDetailController.update();
                                    // FrenchiesDriverDetailController _frenchiesDriverDetailController = Get.put(FrenchiesDriverDetailController());

                                    CallLoader.loader();
                                    await Future.delayed(
                                        Duration(milliseconds: 900));
                                    CallLoader.hideLoader();

                                    Get.to(() => ResitrationDriverDetails());
                                  } else if (index == 2) {
                                    _frenchiesDoctorDetailController
                                        .FrenchiesDoctorDetailApi();
                                    _frenchiesDoctorDetailController.update();
                                    CallLoader.loader();
                                    await Future.delayed(
                                        Duration(milliseconds: 900));
                                    CallLoader.hideLoader();
                                    Get.to(() => ResitrationDoctorDetails());
                                  } else if (index == 3) {
                                    _frenchiesPatientDetailController
                                        .FrenchiesPatientDetailApi();
                                    _frenchiesPatientDetailController.update();
                                    CallLoader.loader();
                                    await Future.delayed(
                                        Duration(milliseconds: 900));
                                    CallLoader.hideLoader();
                                    Get.to(() => ResitrationPatientDetails());
                                  } else if (index == 4) {
                                    _frenchiesChemistDetailController
                                        .FrenchiesChemistDetailApi();
                                    _frenchiesChemistDetailController.update();
                                    CallLoader.loader();
                                    await Future.delayed(
                                        Duration(milliseconds: 700));
                                    CallLoader.hideLoader();
                                    Get.to(() => ResitrationChemistDetails());
                                  } else if (index == 5) {
                                    _frenchiesNurseDetailController
                                        .frenchiesNurseDetailApi();
                                    _frenchiesNurseDetailController.update();

                                    CallLoader.loader();
                                    await Future.delayed(
                                        Duration(milliseconds: 900));
                                    CallLoader.hideLoader();
                                    Get.to(() => ResitrationNurseDetails());
                                  } else if (index == 6) {
                                    _frenchiesLabDetailController
                                        .frenchiesLabDetailApi();
                                    _frenchiesLabDetailController.update();

                                    CallLoader.loader();
                                    await Future.delayed(
                                        Duration(milliseconds: 900));
                                    CallLoader.hideLoader();
                                    Get.to(() => ResitrationLabDetails());
                                  }
                                  // else if (index == 7) {
                                  //   //Get.to(() => ResitrationHealthCheckupDetails());
                                  // }
                                  else if (index == 7) {
                                    _frenchiesRWADetailController
                                        .frenchiesRWADetailApi();
                                    _frenchiesRWADetailController.update();

                                    CallLoader.loader();
                                    await Future.delayed(
                                        Duration(milliseconds: 900));
                                    CallLoader.hideLoader();
                                    Get.to(() => ResitrationRwaDetails());
                                  }
                                  //Get.to(() => DoctorListUser());
                                },
                                child: Container(
                                  height: size.height * 0.08,
                                  width: size.width * 0.15,
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.004),
                                  decoration: BoxDecoration(
                                      color: MyTheme.ThemeColors,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(5, 5),
                                          blurRadius: 0,
                                          spreadRadius: 0,
                                        ),
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, -0),
                                          blurRadius: 0,
                                          spreadRadius: 0,
                                        ),
                                      ]),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        catimage[index],
                                        height: size.height * 0.08,
                                        //productimage[index],
                                        //"lib/assets/image/icons8-hospital-64.png",
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(size.height * 0.001),
                                        child: Text(
                                          doctorcatagary[index],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.sunflower(
                                            fontWeight: FontWeight.bold,
                                            color: MyTheme.blueww,
                                            fontSize: size.height * 0.017,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//#00caf7
