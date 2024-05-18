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
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
import 'package:ps_welness_new_ui/utils/services/account_service.dart';

import '../../../../controllers/1_user_view_controller/ambulance/near_driverlist_controller.dart';
import '../booked_ambulance/driver_emergency_list.dart';
import '../model_emergency/emergency_model.dart';

class AmbulanceEmergencygetController extends GetxController {
  final GlobalKey<FormState> Chooseambulancevehicletypekey =
      GlobalKey<FormState>();
  RxBool isLoading = true.obs;
  DriverlistnearController _nearambulancelistController =
      Get.put(DriverlistnearController());

  Future<Position> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
    } catch (e) {
      print("Error getting location: $e");
      return Future.error("Failed to get location");
    }
  }

  ///todo:list of driver...

  ///todo: google book ambulance api post Api...........2 may 2023.....

  void postEmergencyAmbulancerequestApi(double lat, double lng) async {
    try {
      // Show loader
      isLoading.value = true;
      // Call the API with provided latitude and longitude
      http.Response r = await ApiProvider.GooglebookEmengencyambulanceApi(
        lat,
        lng,
      );

      if (r.statusCode == 200) {
        print("ACCOUNT ${r.body}");

        var data = jsonDecode(r.body);
        // Hide loader before navigating
        isLoading.value = false;

        accountService.getAccountData.then((accountData) {
          Timer(
            const Duration(seconds: 0),
            () {
              Get.to(
                Driver_List_Emergency(
                  driverlist: emergencyAmbulanceListFromJson(r.body),
                ),
              );
            },
          );
        });
      }
    } catch (e) {
      print("Error: $e");
      // Handle error fetching location or API call
    }
  }

  ///todo: request all for user to  individual driver..........9 april 2024...prince..
  Future<void> postRequestIndividualemgApi() async {
    //CallLoader.loader();
    http.Response r = await ApiProvider.AcceptIndividualEmergencyPostApi();
    if (r.statusCode == 200) {
      //CallLoader.hideLoader();
      print("ACCOUNT ${r.body}");
      //Get.snackbar('Successfully', "Request send");

      /// we can navigate to user page.....................................

      accountService.getAccountData.then((accountData) {
        //CallLoader.loader();
        // nearlistdriverApi();

        Timer(
          const Duration(seconds: 05),
          () {
            ///
          },
        );
        //CallLoader.hideLoader();
      });
    }
  }

  late TextEditingController latiudecontroller,
      longitudecontroller,
      patientidcontroller;

  var lat = '';
  var lang = '';
  var id = '';

  ///todo:user complain...........

  @override
  void onInit() {
    // nearlistdriverApi();
    super.onInit();
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

  void googlerequestemergencyambulance(double lat, double lng) {
    postEmergencyAmbulancerequestApi(lat, lng);
  }
}
