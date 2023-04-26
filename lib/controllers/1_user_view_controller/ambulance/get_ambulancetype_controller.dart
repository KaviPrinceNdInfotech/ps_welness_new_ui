// import 'package:get/get.dart';
// import 'package:ps_welness_new_ui/model/1_user_model/ambulance/ambulance_type_model.dart';
// import 'package:ps_welness_new_ui/model/1_user_model/lab_details/lab_details_api.dart';
//
// import '../../../model/1_user_model/lab_list_models.dart';
// import '../../../servicess_api/api_services_all_api.dart';
// //import 'package:ps_welness/model/1_user_model/lab_list_models.dart';
// //import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//
// class GetAmbulanceController extends GetxController {
//   RxBool isLoading = true.obs;
//
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     getambulanceApi();
//   }
//
//   @override
//   void onClose() {
//     ambulancetype = null;
//     super.onClose();
//   }
//
//   @override
//   void dispose() {
//     ambulancetype = null;
//     super.dispose();
//   }
//
//
//
// }
//
// ///todo from here checkout model value..............
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/ambulance_catagary2_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/vehicle_type3_model.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class AmbulancegetController extends GetxController {

  final GlobalKey<FormState> Chooseambulancevehicletypekey = GlobalKey<FormState>();
  ///ambulancde catagary Id...........

  Rx<Vehicle?> selectedambCatagary = (null as Vehicle?).obs;
  List<Vehicle> ambulancvecatagarys = <Vehicle>[].obs;

  ///vehicle by catagary Id...........
  ///
  Rx<VehicleDetaile?> selectedvhicleCatagary = (null as VehicleDetaile?).obs;
  RxList<VehicleDetaile> vhicletypes = <VehicleDetaile>[].obs;

  ///ambulancde catagary Id...........

  // var selectedambCatagary = (null as Vehicle?).obs;
  //   //final selectedambCatagary = < as Vehicle>[].obs;
  //   late var ambulancvecatagarys = <Vehicle>[].obs;
  //   //RxList<Vehicle> ambulancvecatagarys = <Vehicle>[].obs;

  ///get ambulance catagary api.........

  void ambulancecatagaryyApi() async {
    ambulancvecatagarys = (await ApiProvider.getambulancecatagaryApi())!;
    print('Prince ambulance catagary list');
    print(ambulancvecatagarys);
  }

  ///get vehicle api...........
  void getvehicletype(String ambulancecatagaryID) async {
    vhicletypes.clear();
    final localList = await ApiProvider.getvechilebyidApi(ambulancecatagaryID);
    vhicletypes.addAll(localList!);
    print("Prince cities of $ambulancecatagaryID");
    print(vhicletypes);
  }


  // late TextEditingController pinController,
  //     clinicnameController,
  //     passwordController,
  //     confirmpasswordController,
  //     mobileController;
  //
  // var clinic_name = '';
  // var email = '';
  // var password = '';
  // var confirmpassword = '';
  // var mobile = '';


  @override
  void onInit() {

    super.onInit();

    ambulancecatagaryyApi();
    selectedambCatagary.listen((p0) {
      if (p0 != null) {
        getvehicletype("${p0.id}");
      }
    });
   // getTestNameeApi();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
   // clinicnameController.dispose();
   // mobileController.dispose();
  }

  String? validClinicname(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }

    return null;
  }

  String? validPhone(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid phone number should be of 10 digits';
    }
    return null;
  }

  void checkambulance2() {
    final isValid = Chooseambulancevehicletypekey.currentState!.validate();
    if (!isValid) {
      return;
    }
    Chooseambulancevehicletypekey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
