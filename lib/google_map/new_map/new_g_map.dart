import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/ambulance/get_ambulancetype_controller.dart';
import 'package:ps_welness_new_ui/controllers/device_token_controller/devicetoken_controller.dart';
import 'package:ps_welness_new_ui/google_map/new_map/secrets.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/ambulance_catagary2_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/vehicle_type3_model.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';

import '../../controllers/map_controllers/map_controller.dart';

class MapView extends StatefulWidget {
  late final bool allowManualEntry; // Define allowManualEntry parameter

  MapView({Key? key, required this.allowManualEntry}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

bool _isLoading = true; // Add a loading state

class _MapViewState extends State<MapView> {
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();
  AmbulancegetController _ambulancegetController =
      Get.put(AmbulancegetController());

  DevicetokenController _devicetokenController =
      Get.put(DevicetokenController());

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  String _startAddress = '';
  String _destinationAddress = '';
  String? _placeDistance;

  Set<Marker> markers = {};

  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  late GoogleMapController mapController;

  late Position _currentPosition;
  String _currentAddress = '';

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final MapController _mapControllers = Get.put(MapController());

  // final MapController _mapControllers = Get.put(MapController());

  @override
  void initState() {
    super.initState();

    _getCurrentLocation();
  }

  // Widget for the text field
  Widget _textField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    required double width,
    required Icon prefixIcon,
    required Function(String) locationCallback,
    required bool allowManualEntry,
    bool showSuffixIcon =
        true, // Add a parameter to control the visibility of suffix icon
  }) {
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          locationCallback(value);
        },
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: showSuffixIcon
              ? IconButton(
                  icon: Icon(Icons.my_location),
                  onPressed: () {
                    _getCurrentLocation().then((_) {
                      if (controller == startAddressController) {
                        controller.text = _currentAddress;
                        _startAddress = _currentAddress;
                      } else {
                        controller.text = _currentAddress;
                        _destinationAddress = _currentAddress;
                      }
                    });
                  },
                )
              : null, // Use null if suffix icon is not required
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.blue.shade300,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }

  // Method for retrieving the current location

  _getCurrentLocation() async {
    setState(() {
      _isLoading =
          true; // Set loading state to true when starting location fetching
    });

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
        _isLoading =
            false; // Set loading state to false after fetching location
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
      setState(() {
        _isLoading = false; // Set loading state to false in case of error
      });
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  // Method for calculating the distance between two places

  Future<bool> _calculateDistance(
      String startAddress, String destinationAddress) async {
    try {
      // Retrieving placemarks from addresses
      List<Location> startPlacemark = await locationFromAddress(startAddress);
      List<Location> destinationPlacemark =
          await locationFromAddress(destinationAddress);

      double startLatitude = startPlacemark[0].latitude;
      double startLongitude = startPlacemark[0].longitude;
      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      // Start Location Marker
      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: startAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: destinationAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      markers.add(startMarker);
      markers.add(destinationMarker);

      double miny = min(startLatitude, destinationLatitude);
      double minx = min(startLongitude, destinationLongitude);
      double maxy = max(startLatitude, destinationLatitude);
      double maxx = max(startLongitude, destinationLongitude);

      double southWestLatitude = miny;
      double southWestLongitude = minx;
      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );

      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      double totalDistance = 0.0;

      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      setState(() {
        _placeDistance = totalDistance.toStringAsFixed(2);
        print('DISTANCE: $_placeDistance km');
        _devicetokenController.UsertokenApi();
      });

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277

  double _coordinateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  ///
  // double _coordinateDistance(lat1, lon1, lat2, lon2) {
  //   var p = 0.017453292519943295;
  //   var c = cos;
  //   var a = 0.5 -
  //       c((lat2 - lat1) * p) / 2 +
  //       c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  //   return 12742 * asin(sqrt(a));
  // }

  // Create the polylines for showing the route between two places

  _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY, // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    // You may log or print the polyline coordinates for debugging
    print('Polyline Coordinates: $polylineCoordinates');

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  double mapbottompadding = 0;

  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  late Position currentpositon;
  var geolocator = Geolocator();

  void locatepostion() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentpositon = position; // this is line 26, it is point before await

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition googlepostion =
      CameraPosition(target: LatLng(37.4249, -122.0657));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool shouldPop = true;
    //bool shouldPop = true;

    return WillPopScope(
      onWillPop: () async {
        Get.to(() => UserHomePage());
        return shouldPop;
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Scaffold(
          key: _scaffoldKey,
          body: Stack(
            children: <Widget>[
              // Map View
              GoogleMap(
                markers: Set<Marker>.from(markers),
                initialCameraPosition: _initialLocation,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                polylines: Set<Polyline>.of(polylines.values),
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                  newGoogleMapController = controller;
                  _getCurrentLocation();
                },
              ),

              Positioned(
                bottom: size.height * 0.04,
                left: size.height * 0.00,
                right: size.width * 0,
                child: Container(
                  // height: size.height * 0.23,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                  ),
                  child: Column(
                    children: [
                      ///.......selected....ambulance catagary....
                      NeumorphicTextFieldContainer(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          child: Obx(
                            () => DropdownButtonFormField<Vehicle>(
                                value: _ambulancegetController
                                    .selectedambCatagary.value,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.bus_alert,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                                hint: Text('Ambulance Catagary'),
                                items: _ambulancegetController
                                    .ambulancvecatagarys
                                    .map((Vehicle ambulancvecatagarys) {
                                  return DropdownMenuItem(
                                    value: ambulancvecatagarys,
                                    child: Text(
                                      ambulancvecatagarys.categoryName
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.012,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (Vehicle? newValue) {
                                  _ambulancegetController
                                      .selectedambCatagary.value = newValue!;
                                  _ambulancegetController
                                      .selectedvhicleCatagary.value = null;
                                }),
                          ),
                        ),
                      ),

                      ///.........selected vhicle..by catagary id.....
                      NeumorphicTextFieldContainer(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.0),
                          child: Obx(
                            () => DropdownButtonFormField<VehicleDetaile>(
                                //icon: Icon(Icons.location_city),
                                value: _ambulancegetController
                                    .selectedvhicleCatagary.value,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.car_crash_sharp,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                                hint: Text('Vehicle Type'),
                                items: _ambulancegetController.vhicletypes
                                    .map((VehicleDetaile vhiclee) {
                                  return DropdownMenuItem(
                                    value: vhiclee,
                                    child: SizedBox(
                                      width: size.width * 0.8,
                                      child: Text(
                                        vhiclee.vehicleTypeName.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: size.height * 0.015,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onTap: () {
                                  _ambulancegetController.refresh();
                                },
                                onChanged: (VehicleDetaile? newValue) {
                                  _ambulancegetController
                                      .selectedvhicleCatagary.value = newValue!;
                                  // _hospital_2_controller.states.value =
                                  //     newValue! as List<String>;
                                  // _hospital_2_controller.selectedCity.value = null;
                                  // _hospital_2_controller.cities.clear();
                                  // _hospital_2_controller.cities
                                  //     .addAll(stateCityMap[newvalue]!);
                                }),
                          ),
                        ),
                      ),

                      PhysicalModel(
                        color: Colors.grey.shade300,
                        elevation: 2,
                        shadowColor: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: EdgeInsets.all(1.0),
                          child: InkWell(
                            onTap: () {
                              //CallLoader.loader();
                              _ambulancegetController
                                  .googlerequestambulance(markers);

                              ///todo: user device token saved..........
                            },
                            child: Container(
                              height: size.height * 0.045,
                              width: size.width * 0.6,
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.01),
                                child: Center(
                                    child: Text(
                                  'Send Request',
                                  style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Spacer(),
                    ],
                  ),
                ),
              ),
              // Show zoom buttons
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Colors.blue.shade100, // button color
                          child: InkWell(
                            splashColor: Colors.blue, // inkwell color
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.add),
                            ),
                            onTap: () {
                              mapController.animateCamera(
                                CameraUpdate.zoomIn(),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ClipOval(
                        child: Material(
                          color: Colors.blue.shade100, // button color
                          child: InkWell(
                            splashColor: Colors.blue, // inkwell color
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.remove),
                            ),
                            onTap: () {
                              mapController.animateCamera(
                                CameraUpdate.zoomOut(),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Show the place input fields & button for
              // showing the route
              SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Places',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(height: 10),
                            _textField(
                              label: 'Start',
                              hint: 'Choose starting point',
                              prefixIcon: Icon(Icons.looks_one),
                              controller: startAddressController,
                              focusNode: startAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  _startAddress = value;
                                });
                              },
                              allowManualEntry:
                                  true, // Allow manual entry for starting point
                            ),
                            SizedBox(height: 10),
                            _textField(
                              label: 'Destination',
                              hint: 'Choose destination',
                              prefixIcon: Icon(Icons.looks_two),
                              controller: destinationAddressController,
                              focusNode: desrinationAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  _destinationAddress = value;
                                });
                              },
                              allowManualEntry: widget.allowManualEntry,
                              showSuffixIcon:
                                  false, // Set showSuffixIcon to false
                            ),

                            SizedBox(height: 10),
                            Visibility(
                              visible: _placeDistance != null,
                              child: Text(
                                'DISTANCE: $_placeDistance km',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            ///
                            // Visibility(
                            //   visible: _placeDistance == null ? false : true,
                            //   child: Text(
                            //     'DISTANCE: $_placeDistance km',
                            //     style: TextStyle(
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: (_startAddress != '' &&
                                          _destinationAddress != '') ||
                                      (widget.allowManualEntry &&
                                          startAddressController
                                              .text.isNotEmpty &&
                                          destinationAddressController
                                              .text.isNotEmpty)
                                  ? () async {
                                      startAddressFocusNode.unfocus();
                                      desrinationAddressFocusNode.unfocus();
                                      setState(() {
                                        if (markers.isNotEmpty) markers.clear();
                                        if (polylines.isNotEmpty)
                                          polylines.clear();
                                        if (polylineCoordinates.isNotEmpty)
                                          polylineCoordinates.clear();
                                        // Remove resetting _placeDistance here so it retains the previous value
                                      });

                                      String start = widget.allowManualEntry
                                          ? startAddressController.text
                                          : _startAddress;
                                      String destination = widget
                                              .allowManualEntry
                                          ? destinationAddressController.text
                                          : _destinationAddress;

                                      await _calculateDistance(
                                              start, destination)
                                          .then((isCalculated) {
                                        if (isCalculated) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Distance Calculated Successfully'),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Error Calculating Distance'),
                                            ),
                                          );
                                        }
                                      });
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Show Route'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red.shade400,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),

                            ///
                            // ElevatedButton(
                            //   onPressed: (_startAddress != '' &&
                            //               _destinationAddress != '') ||
                            //           (widget.allowManualEntry &&
                            //               startAddressController
                            //                   .text.isNotEmpty &&
                            //               destinationAddressController.text
                            //                   .isNotEmpty) // Accessing allowManualEntry from the widget
                            //       ? () async {
                            //           startAddressFocusNode.unfocus();
                            //           desrinationAddressFocusNode.unfocus();
                            //           setState(() {
                            //             if (markers.isNotEmpty) markers.clear();
                            //             if (polylines.isNotEmpty)
                            //               polylines.clear();
                            //             if (polylineCoordinates.isNotEmpty)
                            //               polylineCoordinates.clear();
                            //             _placeDistance = null;
                            //           });
                            //
                            //           String start = widget.allowManualEntry
                            //               ? startAddressController.text
                            //               : _startAddress; // Accessing allowManualEntry from the widget
                            //           String destination = widget
                            //                   .allowManualEntry
                            //               ? destinationAddressController.text
                            //               : _destinationAddress; // Accessing allowManualEntry from the widget
                            //
                            //           _calculateDistance(start, destination)
                            //               .then((isCalculated) {
                            //             if (isCalculated) {
                            //               ScaffoldMessenger.of(context)
                            //                   .showSnackBar(
                            //                 SnackBar(
                            //                   content: Text(
                            //                       'Distance Calculated Successfully'),
                            //                 ),
                            //               );
                            //             } else {
                            //               ScaffoldMessenger.of(context)
                            //                   .showSnackBar(
                            //                 SnackBar(
                            //                   content: Text(
                            //                       'Error Calculating Distance'),
                            //                 ),
                            //               );
                            //             }
                            //           });
                            //         }
                            //       : null,
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Text(
                            //       'Show Route'.toUpperCase(),
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 20.0,
                            //       ),
                            //     ),
                            //   ),
                            //   style: ElevatedButton.styleFrom(
                            //     primary: Colors.red.shade400,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(20.0),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Show current location button
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.7, bottom: 0.9),
                    child: ClipOval(
                      child: Material(
                        color: Colors.orange.shade100, // button color
                        child: InkWell(
                          splashColor: Colors.orange, // inkwell color
                          child: SizedBox(
                            width: 36,
                            height: 36,
                            child: Icon(Icons.my_location),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: LatLng(
                                    _currentPosition.latitude,
                                    _currentPosition.longitude,
                                  ),
                                  zoom: 18.0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Circular loader
              if (_isLoading) // Render loader if isLoading is true
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
