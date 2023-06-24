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
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker.dart';
import 'package:http/http.dart' as http;
//import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_home/driver_home_page.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../../modules_view/circular_loader/circular_loaders.dart';

class DriverUpdateLocationController extends GetxController {
  final GlobalKey<FormState> Chooseambulancevehicletypekey =
      GlobalKey<FormState>();
  RxBool isLoading = true.obs;

  ///todo: google book ambulance api post Api...........2 may 2023.....

  void postDriverUpdateApi(Set<Marker> markers) async {
    final startLat = markers.first.position.latitude;
    final startLong = markers.first.position.longitude;

    // final endLat = markers.last.position.latitude;
    // final endLong = markers.last.position.longitude;
    CallLoader.loader();
    http.Response r = await ApiProvider.GoogleupdatedriverApi(
      //_currentPosition?.latitude
      startLat.toDouble(),
      startLong.toDouble(),
    );

    if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      //Get.offAll(UserHomePage());
      //Driver_List_LocationId

      Get.to(DriverHomePage());

      //Get.offAll(() => UserHomePage());
      //ambulancecatagaryyApi();
      //getvehicletype(markers);
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
    super.onInit();

    latiudecontroller = TextEditingController();
    longitudecontroller = TextEditingController();
    patientidcontroller = TextEditingController();

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

  void googledriverupdate(Set<Marker> markers) {
    postDriverUpdateApi(markers);

    // if (Chooseambulancevehicletypekey.currentState!.validate()) {
    // }
    // Chooseambulancevehicletypekey.currentState!.save();
  }
}

///MyLocation
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
///
//
// class MyLocation extends StatefulWidget {
//   const MyLocation({Key? key}) : super(key: key);
//
//   @override
//   State<MyLocation> createState() => _MyLocationState();
// }
//
// class _MyLocationState extends State<MyLocation> {
//   TextEditingController latitude = TextEditingController();
//   String? _currentAddress;
//   Position? _currentPosition;
//
//   Future<bool> _handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location services are disabled. Please enable the services')));
//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Location permissions are denied')));
//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location permissions are permanently denied, we cannot request permissions.')));
//       return false;
//     }
//     return true;
//   }
//
//   Future<void> _getCurrentPosition() async {
//     final hasPermission = await _handleLocationPermission();
//
//     if (!hasPermission) return;
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() => _currentPosition = position);
//       _getAddressFromLatLng(_currentPosition!);
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }
//
//   Future<void> _getAddressFromLatLng(Position position) async {
//     await placemarkFromCoordinates(
//         _currentPosition!.latitude, _currentPosition!.longitude)
//         .then((List<Placemark> placemarks) {
//       Placemark place = placemarks[0];
//       setState(() {
//         _currentAddress =
//         '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
//       });
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Location Page")),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('LAT: ${_currentPosition?.latitude ?? ""}'),
//               Text('LNG: ${_currentPosition?.longitude ?? ""}'),
//               Text('ADDRESS: ${_currentAddress ?? ""}'),
//               TextField(
//                 controller:latitude ,
//               ),
//               const SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: _getCurrentPosition,
//                 child: const Text("Get Current Location"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
