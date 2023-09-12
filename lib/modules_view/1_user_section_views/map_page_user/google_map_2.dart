// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../../../controllers/map_controllers/map_controller.dart';
// import '../../../google_map/google_maps.dart';
// //import 'package:ps_welness/controllers/map_controllers/map_controller.dart';
// //import 'package:ps_welness/google_map/google_maps.dart';
//
// //const LatLng currentLocation = LatLng(28.583, 77.3132);
//
// class MapUsers extends StatefulWidget {
//   MapUsers({Key? key}) : super(key: key);
//
//   @override
//   State<MapUsers> createState() => _MapUsersState();
// }
//
// class _MapUsersState extends State<MapUsers> {
//   TextEditingController _originController = TextEditingController();
//   TextEditingController _destinationController = TextEditingController();
//
//   Set<Marker> _markers = Set<Marker>();
//   Set<Polygon> _polygons = Set<Polygon>();
//   Set<Polyline> _polylines = Set<Polyline>();
//
//   List<LatLng> polygonLatLngs = <LatLng>[];
//   int _polygonIdCounter = 1;
//   int _polylineIdCounter = 1;
//
//   Completer<GoogleMapController> _controller = Completer();
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(28.583, 77.3132),
//     zoom: 14,
//   );
//   @override
//   void initState() {
//     super.initState();
//     _setMarker(LatLng(28.583, 77.3132));
//   }
//
//   void _setMarker(LatLng point) {
//     setState(() {
//       _markers.add(
//         Marker(markerId: MarkerId('marker'), position: point),
//       );
//     });
//   }
//
//   void _setPolygon() {
//     final String polygonIdval = 'polygon_$_polygonIdCounter';
//     _polygonIdCounter++;
//     _polygons.add(Polygon(
//       polygonId: PolygonId(polygonIdval),
//       points: polygonLatLngs,
//       strokeWidth: 2,
//       fillColor: Colors.red,
//     ));
//   }
//
//   void _setPolyline(List<LatLng> points) {
//     final String polylineIdval = 'polyline_$_polylineIdCounter';
//     _polylineIdCounter++;
//     _polylines.add(
//       Polyline(
//         polylineId: PolylineId(polylineIdval),
//         //points: polylineLatLngs,
//         width: 2,
//         color: Colors.blue,
//         points: points
//             .map(
//               (point) => LatLng(point.latitude, point.longitude),
//             )
//             .toList(),
//       ),
//     );
//   }
//
//   // static final Marker _kGooglePlexMarker = Marker(
//   //   markerId: MarkerId('_kGooglePlex'),
//   //   infoWindow: InfoWindow(title: 'Noida'),
//   //   icon: BitmapDescriptor.defaultMarker,
//   //   position: LatLng(28.583, 77.3132),
//   // );
//   ///
//   // static final CameraPosition _kLake = CameraPosition(
//   //   bearing: 29.4345455,
//   //   target: LatLng(28.5930, 77.3052),
//   //   //LatLng(29.083, 78.3132),
//   //   tilt: 49.44071,
//   //   zoom: 15,
//   // );
//   ///
//   // static final Marker _kLakeMarker = Marker(
//   //   markerId: MarkerId('_kLakeMarket'),
//   //   infoWindow: InfoWindow(title: 'Delhi'),
//   //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//   //   position: LatLng(28.5930, 77.3052),
//   //   //LatLng(29.083, 78.3132),
//   // );
//   ///
//
//   // static final Polyline _kpolyline = Polyline(
//   //   polylineId: PolylineId('_kpolyline'),
//   //   points: [
//   //     LatLng(28.583, 77.3132),
//   //     LatLng(28.5930, 77.3052),
//   //     //LatLng(29.083, 78.3132),
//   //     // LatLng(28.563, 77.2932),
//   //     //LatLng(28.5731, 77.3292),
//   //   ],
//   //   width: 5,
//   //   color: Colors.red,
//   //   // strokeWidth: 5,
//   //   //fillColor: Colors.transparent,
//   // );
//   ///
//
//   // static final Polygon _kPolygon = Polygon(
//   //   polygonId: PolygonId('_kPolygon'),
//   //   points: [
//   //     LatLng(28.583, 77.3132),
//   //     LatLng(28.5930, 77.3052),
//   //     LatLng(28.563, 77.2932),
//   //     LatLng(28.5731, 77.3292),
//   //   ],
//   //   strokeWidth: 5,
//   //   fillColor: Colors.transparent,
//   // );
//
//   late GoogleMapController mapController;
//
//   //Map<String, Marker> _markers = {};
//
//   MapController _mapControllers = Get.put(MapController());
//
//   var items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];
//
//   get newvalue => null!;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Find your location'),
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                   child: Column(
//                 children: [
//                   TextFormField(
//                     controller: _originController,
//                     //textCapitalization: TextCapitalization.words,
//                     decoration: InputDecoration(hintText: 'Origin'),
//                     onChanged: (value) {
//                       print(value);
//                     },
//                   ),
//                   TextFormField(
//                     controller: _destinationController,
//                     // textCapitalization: TextCapitalization.words,
//                     decoration: InputDecoration(hintText: 'Destination'),
//                     onChanged: (value) {
//                       print(value);
//                     },
//                   ),
//                 ],
//               )),
//               IconButton(
//                   onPressed: () async {
//                     var directions = await LocationService().getDirections(
//                         _originController.text, _destinationController.text);
//                     _goToPlace(
//                       directions['start_location']['lat'],
//                       directions['start_location']['lng'],
//                       directions['bounds_ne'],
//                       directions['bounds_sw'],
//                     );
//
//                     _setPolyline(directions['poliline_decoded']);
//                     // var place = await LocationService()
//                     //     .getPlace(_searchController.text);
//                     // _goToPlace(place);
//                   },
//                   icon: Icon(Icons.search)),
//             ],
//           ),
//           Expanded(
//             child: GoogleMap(
//               mapType: MapType.hybrid,
//               markers: _markers,
//               polygons: _polygons,
//               polylines: _polylines,
//               // markers: {
//               //   _kGooglePlexMarker,
//               //   // _kLakeMarker
//               // },
//               // polylines: {
//               //   _kpolyline,
//               // },
//               // polygons: {
//               //   _kPolygon,
//               // },
//               initialCameraPosition: _kGooglePlex,
//               onMapCreated: (GoogleMapController controller) {
//                 _controller.complete(controller);
//               },
//               onTap: (point) {
//                 setState(() {
//                   polygonLatLngs.add(point);
//                   _setPolygon();
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton.extended(
//       //   onPressed: _goToThelake,
//       //   label: Text('To The lake!'),
//       //   icon: Icon(Icons.directions_boat),
//       // ),
//       ///
//
//       // Form(
//       //   key: _mapControllers.mapformkey,
//       //   child: SafeArea(
//       //     child: Stack(
//       //       clipBehavior: Clip.none,
//       //       children: [
//       //         Positioned(
//       //           top: size.height * 0.0,
//       //           bottom: size.height * 0.12,
//       //           child: Container(
//       //             height: size.height,
//       //             width: size.width,
//       //             child: GoogleMap(
//       //               // mapType: MapType.hybrid,
//       //               //mapType: MapType.satellite,
//       //               //mapType: MapType.terrain,
//       //               mapType: MapType.normal,
//       //
//       //               initialCameraPosition: CameraPosition(
//       //                 target: currentLocation,
//       //                 zoom: 14,
//       //               ),
//       //               onMapCreated: (controller) {
//       //                 mapController = controller;
//       //                 addMarker('test', currentLocation);
//       //               },
//       //               markers: _markers.values.toSet(),
//       //             ),
//       //           ),
//       //         ),
//       //         Positioned(
//       //           top: size.height * 0.03,
//       //           left: size.height * 0.05,
//       //           child: Container(
//       //             height: size.height * 0.06,
//       //             width: size.width * 0.8,
//       //             decoration: BoxDecoration(
//       //               color: Colors.white,
//       //             ),
//       //             child: TextFormField(
//       //               autofillHints: [AutofillHints.name],
//       //               controller: _mapControllers.nameController,
//       //               onSaved: (value) {
//       //                 _mapControllers.name = value!;
//       //               },
//       //               validator: (value) {
//       //                 return _mapControllers.validName(value!);
//       //               },
//       //               cursorColor: Colors.black,
//       //               obscureText: false,
//       //               decoration: InputDecoration(
//       //                 hintText: 'Enter Pickup Location',
//       //                 helperStyle: TextStyle(
//       //                   color: black.withOpacity(0.7),
//       //                   fontSize: 18,
//       //                 ),
//       //                 prefixIcon: Icon(
//       //                   Icons.pin_drop,
//       //                   color: Colors.red,
//       //                   size: 20,
//       //                 ),
//       //                 border: InputBorder.none,
//       //               ),
//       //             ),
//       //           ),
//       //         ),
//       //         Positioned(
//       //           top: size.height * 0.11,
//       //           left: size.height * 0.05,
//       //           child: Container(
//       //             height: size.height * 0.06,
//       //             width: size.width * 0.8,
//       //             decoration: BoxDecoration(
//       //               color: Colors.white,
//       //             ),
//       //             child: TextFormField(
//       //               autofillHints: [AutofillHints.addressCityAndState],
//       //               controller: _mapControllers.addressController,
//       //               onSaved: (value) {
//       //                 _mapControllers.address = value!;
//       //               },
//       //               validator: (value) {
//       //                 return _mapControllers.validAddress(value!);
//       //               },
//       //               cursorColor: Colors.black,
//       //               obscureText: false,
//       //               decoration: InputDecoration(
//       //                 hintText: 'Enter Destination',
//       //                 helperStyle: TextStyle(
//       //                   color: black.withOpacity(0.7),
//       //                   fontSize: 18,
//       //                 ),
//       //                 prefixIcon: Icon(
//       //                   Icons.pin_drop,
//       //                   color: Colors.red,
//       //                   size: 20,
//       //                 ),
//       //                 border: InputBorder.none,
//       //               ),
//       //             ),
//       //           ),
//       //         ),
//       //         Positioned(
//       //           bottom: size.height * 0.0,
//       //           //left: size.height * 0.05,
//       //           child: Container(
//       //             height: size.height * 0.14,
//       //             width: size.width,
//       //             decoration: BoxDecoration(
//       //               color: Colors.white,
//       //             ),
//       //             child: Column(
//       //               children: [
//       //                 Container(
//       //                   height: size.height * 0.043,
//       //                   width: size.width,
//       //                   decoration: BoxDecoration(
//       //                     color: Colors.cyanAccent,
//       //                   ),
//       //                   child: Padding(
//       //                     padding: EdgeInsets.symmetric(
//       //                         horizontal: size.width * 0.01),
//       //                     child: Obx(
//       //                       () => DropdownButtonFormField(
//       //                           value: _mapControllers.selectedState.value,
//       //                           decoration: InputDecoration(
//       //                             contentPadding: EdgeInsets.only(
//       //                                 bottom: size.height * 0.01),
//       //                             // prefixIcon: Icon(
//       //                             //   Icons.real_estate_agent,
//       //                             //   color: Colors.black,
//       //                             // ),
//       //                             enabledBorder: InputBorder.none,
//       //                             border: InputBorder.none,
//       //                           ),
//       //                           hint: Text(
//       //                             'Ambulance Type',
//       //                             style: TextStyle(
//       //                               fontSize: size.height * 0.016,
//       //                             ),
//       //                           ),
//       //                           items: items.map((String items) {
//       //                             return DropdownMenuItem(
//       //                               value: items,
//       //                               child: Text(
//       //                                 items,
//       //                                 style: TextStyle(
//       //                                   fontWeight: FontWeight.w600,
//       //                                   fontSize: size.height * 0.015,
//       //                                 ),
//       //                               ),
//       //                             );
//       //                           }).toList(),
//       //                           onChanged: (String? newValue) {
//       //                             _mapControllers.selectedState.value =
//       //                                 newValue!;
//       //                             // _hospital_2_controller.states.value =
//       //                             //     newValue! as List<String>;
//       //                             // _hospital_2_controller.selectedCity.value = null;
//       //                             // _hospital_2_controller.cities.clear();
//       //                             // _hospital_2_controller.cities
//       //                             //     .addAll(stateCityMap[newvalue]!);
//       //                           }),
//       //                     ),
//       //                   ),
//       //                 ),
//       //                 SizedBox(
//       //                   height: size.height * 0.004,
//       //                 ),
//       //                 Container(
//       //                   height: size.height * 0.043,
//       //                   width: size.width,
//       //                   decoration: BoxDecoration(
//       //                     color: Colors.cyanAccent,
//       //                   ),
//       //                   child: Padding(
//       //                     padding: EdgeInsets.symmetric(
//       //                         horizontal: size.width * 0.01),
//       //                     child: Obx(
//       //                       () => DropdownButtonFormField(
//       //                           //icon: Icon(Icons.location_city),
//       //                           value: _mapControllers.selectedCity.value,
//       //                           decoration: InputDecoration(
//       //                             contentPadding: EdgeInsets.only(
//       //                                 bottom: size.height * 0.022),
//       //                             // prefixIcon: Icon(
//       //                             //   Icons.location_city,
//       //                             //   color: Colors.black,
//       //                             // ),
//       //                             enabledBorder: InputBorder.none,
//       //                             border: InputBorder.none,
//       //                           ),
//       //                           hint: Text(
//       //                             'Vehicle Type',
//       //                             style: TextStyle(
//       //                               fontSize: size.height * 0.016,
//       //                             ),
//       //                           ),
//       //                           items: items.map((String items) {
//       //                             return DropdownMenuItem(
//       //                               value: items,
//       //                               child: Text(
//       //                                 items,
//       //                                 style: TextStyle(
//       //                                   fontWeight: FontWeight.w600,
//       //                                   fontSize: size.height * 0.015,
//       //                                 ),
//       //                               ),
//       //                             );
//       //                           }).toList(),
//       //                           onChanged: (String? newValue) {
//       //                             _mapControllers.selectedCity.value =
//       //                                 newValue!;
//       //                             // _hospital_2_controller.states.value =
//       //                             //     newValue! as List<String>;
//       //                             // _hospital_2_controller.selectedCity.value = null;
//       //                             // _hospital_2_controller.cities.clear();
//       //                             // _hospital_2_controller.cities
//       //                             //     .addAll(stateCityMap[newvalue]!);
//       //                           }),
//       //                     ),
//       //                   ),
//       //                 ),
//       //                 SizedBox(
//       //                   height: size.height * 0.005,
//       //                 ),
//       //                 PhysicalModel(
//       //                   color: Colors.grey.shade300,
//       //                   elevation: 10,
//       //                   shadowColor: Colors.grey.shade900,
//       //                   borderRadius: BorderRadius.circular(10),
//       //                   child: Padding(
//       //                     padding: const EdgeInsets.all(4.0),
//       //                     child: Container(
//       //                       height: size.height * 0.03,
//       //                       width: size.width * 0.6,
//       //                       decoration: BoxDecoration(
//       //                         color: MyTheme.blueww,
//       //                         borderRadius: BorderRadius.circular(10),
//       //                       ),
//       //                       child: Padding(
//       //                         padding: EdgeInsets.symmetric(
//       //                             horizontal: size.width * 0.01),
//       //                         child: Center(
//       //                             child: Text(
//       //                           'Submit',
//       //                           style: TextStyle(
//       //                             fontSize: size.height * 0.02,
//       //                             fontWeight: FontWeight.bold,
//       //                             color: Colors.white,
//       //                           ),
//       //                         )),
//       //                       ),
//       //                     ),
//       //                   ),
//       //                 ),
//       //               ],
//       //             ),
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       // ),
//     );
//   }
//
//   Future<void> _goToPlace(
//     //Map<String, dynamic> place
//     double lat,
//     double lng,
//     Map<String, dynamic> boundsNe,
//     Map<String, dynamic> boundsSw,
//   ) async {
//     //final double lat = place['geometry']['location']['lat'];
//     //final double lng = place['geometry']['location']['lat'];
//
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(target: LatLng(lat, lng), zoom: 12),
//       ),
//     );
//     controller.animateCamera(
//       CameraUpdate.newLatLngBounds(
//           LatLngBounds(
//             southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
//             northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
//           ),
//           25),
//       // CameraPosition(target: LatLng(lat, lng), zoom: 12),
//     );
//     _setMarker(LatLng(lat, lng));
//   }
//
//   // Future<void> _goToThelake() async {
//   //   final GoogleMapController controller = await _controller.future;
//   //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   // }
//
//   addMarker(String id, LatLng location) async {
//     // var markerIcon = await BitmapDescriptor.fromAssetImage(
//     //   ImageConfiguration(),
//     //   'lib/assets/icons/fr1.png',
//     // );
//     var marker = Marker(
//       markerId: MarkerId(id),
//       position: location,
//       infoWindow: InfoWindow(
//         title: 'Nd Infotech',
//         snippet: 'My awesom office',
//       ),
//       //icon: markerIcon,
//     );
//     // _markers[id] = marker;
//     // setState(() {});
//   }
// }
// //<script src="https://maps.googleapis.com/maps/api/js?sensor=false&callback=myMap"></script>
