// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
// class MyLocation extends StatefulWidget {
//   @override
//   _MyLocationState createState() => _MyLocationState();
// }
//
// class _MyLocationState extends State<MyLocation> {
//   String location = 'Null, Press Button';
//   String Address = 'search';
//
//   //final double latitude = ; // Replace with your latitude
//
//   void getCurrentPosition() async {
//     //final  UserLiveLocationController _userlivelocation =
//     //Get.put(UserLiveLocationController());
//     //permission
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       print("permission not given");
//       LocationPermission asked = await Geolocator.requestPermission();
//     } else {
//       Position currentPosition = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.best);
//
//       // Future<void> GetAddressFromLatLong(Position position) async {
//       //   List<Placemark> placemarks = await placemarkFromCoordinates(
//       //       position.latitude, position.longitude);
//       //   print(placemarks);
//       //   Placemark place = placemarks[0];
//       //   Address =
//       //       '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
//       //   setState(() {});
//       // }
//
//       var lang = "Longitude:${currentPosition.longitude.toDouble()}";
//       var lat = "Latitude:${currentPosition.latitude.toDouble()}";
//       print(lang);
//       print(lat);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //var userlocation = Provider.of<getCurrentPosition>(context);
//     //Position currentPosition =  Geolocator.getCurrentPosition(
//     // desiredAccuracy: LocationAccuracy.best) as Position;
//     //var lang = "Longitude:${currentPosition.longitude.toString()}";
//     //var lat = "Latitude:${currentPosition.latitude.toString()}";
//
//     return Scaffold(
//         body: SafeArea(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           //lang = "Longitude:${currentPosition.longitude.toString()}";
//           // lat = "Latitude:${currentPosition.latitude.toString()}";
//           SizedBox(
//             height: 00,
//           ),
//           Text(
//               //"Location: Lat:${userlocation.latitude}"
//               "Latitude:"),
//           Text("Longitude:"),
//           //Geolocator.distanceBetween(lang, startLongitude, endLatitude, endLongitude)
//           // Geolocator.getCurrentPosition();
//           // Text("Longitude${lat}"),
//           Align(
//             alignment: Alignment.center,
//             child: ElevatedButton(
//               onPressed: () async {
//                 getCurrentPosition();
//                 //Position position = await _getGeoLocationPosition();
//                 // GetAddressFromLatLong();
//               },
//               child: Text("Get current position"),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

///MyLocation
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers/driver_complete_ride_controller/driver_complete_ride_controller.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_home/driver_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/utils/services/account_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../servicess_api/api_services_all_api.dart';

Timer? timer;

OngoingRideController _ongoingRideController = Get.put(OngoingRideController());

//import 'package:lib/views/home_view/update_locations.dart';
// lib/views/home_view/update_locations.dart
// import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_home/driver_home_page.dart';
//
// import '../../../../../constants/constants/constants.dart';
// import '../../../../../servicess_api/api_services_all_api.dart';
// import '../../../../../utils/services/account_service.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        //28.5847, 77.3159, 0.0000
        position: LatLng(28.5847, 77.3159),
        // flat: 14.4746,

        infoWindow: InfoWindow(
          title: 'User Position',
        )),
  ];

  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  var x = 0;
  var period = const Duration(seconds: 1);
  late GoogleMapController mapController;
  late GoogleMapController newGoogleMapController;
  double mapbottompadding = 0;

  final _scaffoldKey1 = GlobalKey<ScaffoldState>();

  String? _currentAddress;
  Position? _currentPosition;

  //get latitudecontroller => null;
//   return await Geolocator.getCurrentPosition(
//   desiredAccuracy: LocationAccuracy.high);
// }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 18.0,
        )),
      );

      ///Todo:.............................todo:.............todo.....

      _getAddressFromLatLng(position);

      ///Todo:.............................todo:..........todo........
    }).catchError((e) {
      ///todo:...//.....//.....//.....//........//.......//............................
      debugPrint(e);
    });
  }

  ///......................................................
  // LatLng startLocation = LatLng(28.535517, 77.391029);
  LatLng startLocation = LatLng(0.0, 0.0);

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  ///init state.........................................
  @override
  void initState() {
    super.initState();
    _handleLocationPermission().then(
      (_) => {
        _getCurrentPosition().then((coordinates) => {
              ///Todo: here from time dperiod function.....
            }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var lat = _currentPosition?.latitude.toDouble();
    var lang = _currentPosition?.longitude.toDouble();

    ///todo:user id list
    final DriverListId = (_ongoingRideController.ongoingRide?.id ?? 0);

    ///todo: post driver update..........

    ///todo:apiiii....driver update location...
    Future<void> postssDriverUpdateApi() async {
      http.Response r = await ApiProvider.GoogleupdatedriverApi(
        lat,
        lang,
      );
      if (r.statusCode == 200) {
        //Get.snackbar('message', r.body);
        var data = jsonDecode(r.body);

        //CallLoader.hideLoader();

        /// we can navigate to user page.....................................
      } else {
        // Get.snackbar(
        //   'message', // Title
        //   r.body, // Message
        //   duration: Duration(seconds: 4), // Duration in seconds
        //   backgroundColor: Colors.red, // Custom background color
        //   colorText: Colors.white, // Custom text color
        // );
      }
    }

    ///todo: post complete ride..........19 apr 2024...

    Future<void> CompleterideApi() async {
      http.Response r = await ApiProvider.CompleteridedriverApi(
          _ongoingRideController.ongoingRide?.id.toString());
      if (r.statusCode == 200) {
        Get.snackbar(
          'message', // Title
          r.body, // Message
          duration: Duration(seconds: 4),
          backgroundColor: Colors.green, // Custom background color
          colorText: Colors.white, // Duration in seconds
        );
        // Get.snackbar('message', r.body);
        //var data = jsonDecode(r.body);

        //CallLoader.hideLoader();

        /// we can navigate to user page.....................................
      } else {
        Get.snackbar(
          'message', // Title
          r.body, // Message
          duration: Duration(seconds: 4), // Duration in seconds
          backgroundColor: Colors.red, // Custom background color
          colorText: Colors.white, // Custom text color
        );
      }
    }

    //...................................
    ///................................................
    TextEditingController latitudecontroller =
        TextEditingController(text: "${lat}");
    TextEditingController longitudecontroller =
        TextEditingController(text: "${lang}");
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Scaffold(
          key: _scaffoldKey1,
          //appBar: AppBar(title: const Text("Location Page")),
          body: SafeArea(
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                  top: size.height * 0.02,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: size.height * 0.80,
                    child: GoogleMap(
                      markers: Set<Marker>.of(_markers),
                      zoomGesturesEnabled: true,

                      // indoorViewEnabled: true,

                      ///markers: Set<Marker>.from(markers),

                      /// initialCameraPosition: _initialLocation,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      mapType: MapType.normal,
                      // indoorViewEnabled = false,
                      // trafficEnabled = false,
                      //bool buildingsEnabled = true,
                      //zoomGesturesEnabled: true,
                      zoomControlsEnabled: false,

                      ///enable Zoom in, out on map
                      initialCameraPosition: CameraPosition(
                        //innital position in map
                        target: startLocation, //initial position
                        zoom: 14.0, //initial zoom level
                      ),
                      //mapType: MapType.normal,
                      // myLocationEnabled: true,
                      compassEnabled: true,
                      //polylines: Set<Polyline>.of(polylines.values),
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                        newGoogleMapController = controller;
                        _getCurrentPosition();
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.02,
                  left: size.height * 0.02,
                  //right: size.width * 0,
                  child: InkWell(
                    splashColor: Colors.yellow,
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: size.width * 0.08,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.1,
                  left: size.height * 0.00,
                  right: size.width * 0,
                  child: SizedBox(
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: size.height * 0.08,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                              //color: Colors.grey[300],
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    darkPrimary1,
                                    lightShadow,
                                  ]),
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(4, 4),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(-4, -4),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Text('LAT: ${_currentPosition?.latitude ?? ""}'),
                                //Text('LNG: ${_currentPosition?.longitude ?? ""}'),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.16,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                          ' ADDRESS :',
                                          style: GoogleFonts.alatsi(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.03),
                                        ),
                                      ),
                                    ),
                                    //Spacer(),
                                    SizedBox(
                                      width: size.width * 0.71,
                                      child: Text(
                                        """${_currentAddress ?? ""}""",
                                        // ' ',
                                        style: GoogleFonts.alatsi(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * 0.028),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ///todo:  latitude..........
                            SizedBox(
                                width: size.width * 0.43,
                                child: Container(
                                  //height: size.height * 0.06,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      vertical: appPadding / 2),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            darkPrimary1,
                                            lightShadow,
                                          ]),
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(-1, -1),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          color: darkShadow,
                                        ),
                                        BoxShadow(
                                          offset: Offset(1, 1),
                                          spreadRadius: 1,
                                          blurRadius: 0,
                                          color: lightShadow,
                                        ),
                                      ]),
                                  child: TextFormField(
                                    autofillHints: [AutofillHints.location],
                                    controller: latitudecontroller,

                                    //
                                    // validator: (value) {
                                    //   return _hospital_2_controller.validPhone(value!);
                                    // },
                                    cursorColor: Colors.cyanAccent,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Your Latitude',
                                      helperStyle: TextStyle(
                                        color: black.withOpacity(0.7),
                                        fontSize: 18,
                                      ),
                                      prefix: Text(
                                        '  LAT : ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // prefixIcon:
                                      // Align(
                                      //     alignment: Alignment.center,
                                      //     child: Text("Lat:")),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                )

                                ///

                                ///
                                ),

                            ///todo: longitude.....
                            SizedBox(
                                width: size.width * 0.43,
                                child: Container(
                                  //height: size.height * 0.06,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      vertical: appPadding / 2),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            darkPrimary1,
                                            lightShadow,
                                          ]),
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(-1, -1),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          color: darkShadow,
                                        ),
                                        BoxShadow(
                                          offset: Offset(1, 1),
                                          spreadRadius: 1,
                                          blurRadius: 0,
                                          color: lightShadow,
                                        ),
                                      ]),
                                  child: TextFormField(
                                    autofillHints: [AutofillHints.location],
                                    controller: longitudecontroller,
                                    //
                                    // validator: (value) {
                                    //   return _hospital_2_controller.validPhone(value!);
                                    // },
                                    cursorColor: Colors.black,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Your Longitude',
                                      helperStyle: TextStyle(
                                        color: black.withOpacity(0.7),
                                        fontSize: 18,
                                      ),
                                      prefix: Text(
                                        '  LNG : ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.05,
                  left: size.height * 0.00,
                  right: size.width * 0,
                  child: SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // SizedBox(height: 32),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Material(
                            elevation: 20,
                            shadowColor: Colors.white,
                            //surfaceTintColor: Colors.red,

                            borderRadius: BorderRadius.circular(4),
                            color: Colors.blue.shade700,
                            //Theme.of(context).bottomAppBarColor,
                            child: InkWell(
                              splashColor: Colors.blueGrey,
                              onTap: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setString("DriverListId",
                                    "${_ongoingRideController.ongoingRide?.id.toString() ?? 0.0}");
                                _getCurrentPosition();

                                ///await postssDriverUpdateApi();

                                //CompleterideApi
                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: size.height * 0.1,
                                      width: size.width * 0.21,
                                      child: AlertDialog(
                                        title: Text("Complete Your last Ride"),
                                        content: Text(
                                            "You Want to finished your last ride?"),
                                        actions: [
                                          ElevatedButton(
                                            child: SizedBox(
                                              width: size.width * 0.21,
                                              child: Text(
                                                "   Cancel   ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                textStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          //Spacer(),
                                          ElevatedButton(
                                            child: Text(
                                              "   Confirm   ",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.green,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                textStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: () async {
                                              //CallLoader.loader();
                                              await Future.delayed(
                                                  Duration(microseconds: 100));
                                              CallLoader.hideLoader();
                                              await _ongoingRideController
                                                  .ongoingRideApi();
                                              _ongoingRideController.onInit();
                                              _ongoingRideController.update();

                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              await prefs.setString(
                                                  "DriverListId",
                                                  "${_ongoingRideController.ongoingRide?.id ?? 0}");

                                              ///todo: open google map and reache to ride.........start..
                                              ///await _getCurrentPosition();
                                              CallLoader.loader();
                                              await Future.delayed(
                                                  Duration(microseconds: 800));
                                              CallLoader.hideLoader();
                                              await _getCurrentPosition();
                                              postssDriverUpdateApi();
                                              CompleterideApi();

                                              // await postssDriverUpdateApi();

                                              ///timeperiod.............start...
                                              /// await _getCurrentPosition();
                                              ///todo: current location.....time...period...
                                              // Timer.periodic(
                                              //     Duration(seconds: 10),
                                              //     (Timer t) =>
                                              //         _getCurrentPosition());

                                              ///todo: time period for post update api...
                                              // Timer.periodic(
                                              //     Duration(seconds: 20),
                                              //     (Timer t) =>
                                              //         postssDriverUpdateApi());

                                              ///timeperiod.............start...
                                              ///
                                              //CallLoader.loader();

                                              await Future.delayed(
                                                  Duration(milliseconds: 100));
                                              CallLoader.hideLoader();

                                              ///todo: navigate to home screen.........
                                              accountService.getAccountData
                                                  .then((accountData) {
                                                Timer(
                                                  const Duration(
                                                      milliseconds: 300),
                                                  () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                DriverHomePage()));

                                                    //Get.to((page))
                                                    ///
                                                  },
                                                );
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );

                                //postDriverUpdateApi();
                                // CallLoader.hideLoader();
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.4,
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    //color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(2, 2),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: Colors.red,
                                        offset: Offset(-1.5, -1.5),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                    ]),
                                child: Center(
                                  child: Text(
                                    """Complete Your ride ?""",
                                    // '\u{20B9}',
                                    //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                    style: GoogleFonts.actor(
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Spacer(),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Material(
                            elevation: 20,
                            shadowColor: Colors.white,
                            //surfaceTintColor: Colors.red,

                            borderRadius: BorderRadius.circular(4),
                            color: Colors.red.shade200,
                            //Theme.of(context).bottomAppBarColor,
                            child: InkWell(
                              splashColor: Colors.blueGrey,
                              onTap: () async {
                                await _getCurrentPosition();

                                await postssDriverUpdateApi();

                                // Timer.periodic(Duration(seconds: 10),
                                //     (Timer t) => _getCurrentPosition());
                                //
                                // ///timeperiod.............start...
                                // Timer.periodic(Duration(seconds: 20),
                                //     (Timer t) => postssDriverUpdateApi());

                                ///timeperiod.............start...

                                //postDriverUpdateApi();
                                // CallLoader.hideLoader();

                                CallLoader.loader();
                                await Future.delayed(Duration(seconds: 2));
                                CallLoader.hideLoader();
                                accountService.getAccountData
                                    .then((accountData) {
                                  Timer(
                                    const Duration(seconds: 2),
                                    () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DriverHomePage()));

                                      //Get.to((page))
                                      ///
                                    },
                                  );
                                });
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.4,
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    //color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(2, 2),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: Colors.green,
                                        offset: Offset(-1.5, -1.5),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                    ]),
                                child: Center(
                                  child: Text(
                                    """Update Your Location""",
                                    // '\u{20B9}',
                                    //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                    style: GoogleFonts.actor(
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
