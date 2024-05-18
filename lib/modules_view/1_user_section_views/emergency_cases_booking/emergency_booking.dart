// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../servicess_api/api_services_all_api.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   String? _currentAddress;
//   Position? _currentPosition;
//
//   ///todo: handle permission...12 jan 2024....
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
//   ///todo: get current position.......
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
//   ///todo: get cerrent address....
//
//   Future<void> _getAddressFromLatLng(Position position) async {
//     await placemarkFromCoordinates(
//             _currentPosition!.latitude, _currentPosition!.longitude)
//         .then((List<Placemark> placemarks) {
//       Placemark place = placemarks[0];
//       setState(() {
//         _currentAddress =
//             '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
//       });
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentPosition();
//
//     //postssDriverUpdateApi();
//     // Timer(
//     //    Duration(seconds: 3),
//     //     () => Navigator.pushReplacement(
//     //         context, MaterialPageRoute(builder: (context) => LoginScreen())));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //Get.put(SplashController());
//
//     ///todo: define lat lang.....
//     var lat = "${_currentPosition?.latitude.toDouble() ?? ""}";
//     //_currentPosition?.latitude.toDouble();
//     var lang = "${_currentPosition?.longitude.toDouble() ?? ""}";
//
//     ///todo:apiiii....driver update location...
//     Future<void> postssDriverUpdateApi() async {
//       http.Response r = await ApiProvider.GoogleupdatedriverApi(
//         lat,
//         lang,
//       );
//       if (r.statusCode == 200) {
//         //Get.snackbar('message', r.body);
//         var data = jsonDecode(r.body);
//       }
//     }
//
//     ///todo:................................
//     return Scaffold(
//         backgroundColor: Colors.white,
//         //todo: it will show after column...
//         //  Text('LAT: ${_currentPosition?.latitude ?? ""}'),
//         //               Text('LNG: ${_currentPosition?.longitude ?? ""}'),
//         //               Text('ADDRESS: ${_currentAddress ?? ""}'),
//         body: Center(
//           child: Container(
//             height: 299,
//             width: 300,
//             color: Colors.transparent,
//             child: Image.asset('lib/assets/DriverPlaystore.png'),
//           ),
//           //"This is the splash screen"
//         ));
//   }
// }
