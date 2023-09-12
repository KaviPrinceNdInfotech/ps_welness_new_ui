// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_api_headers/google_api_headers.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:location/location.dart';
//
// import '../../../controllers/map_controllers/map_controller.dart';
// //import 'package:ps_welness/controllers/map_controllers/map_controller.dart';
//
// const LatLng currentLocation = LatLng(28.583, 77.3132);
//
// class MapUser extends StatefulWidget {
//   MapUser({Key? key}) : super(key: key);
//
//   @override
//   State<MapUser> createState() => _MapUserState();
// }
//
// var items = [
//   'Item 1',
//   'Item 2',
//   'Item 3',
//   'Item 4',
//   'Item 5',
// ];
//
// class _MapUserState extends State<MapUser> {
//   ///11 jan 2023.......edited
//   final Completer<GoogleMapController> _controller = Completer();
//   // on below line we are specifying our camera position
//   static final CameraPosition _kGoogle = const CameraPosition(
//     target: LatLng(37.42796133580664, -122.885749655962),
//     zoom: 14.4746,
//   );
//   List<Marker> _marker = [];
//   List<LatLng> polyLineCoordinates = [];
//   LocationData? currentLocation;
//
//   static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
//   static const LatLng destination = LatLng(37.33429383, -122.06600055);
//
//   BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
//
//   void setCustomMarkerIcon() {
//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration.empty, 'lib/assets/icons/rwa.png')
//         .then(
//       (icon) => sourceIcon = icon,
//     );
//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration.empty, 'lib/assets/icons/user.png')
//         .then(
//       (icon) => destinationIcon = icon,
//     );
//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration.empty, 'lib/assets/icons/frpayout.png')
//         .then(
//       (icon) => currentLocationIcon = icon,
//     );
//   }
//
//   // void getCurrentLocation() async {
//   //   Location location = Location().toString();
//   //   location.getLocation().then((location) {
//   //     currentLocation = location;
//   //     setState(() {});
//   //   });
//   //   GoogleMapController googleMapController = await _controller.future;
//   //
//   //   location.onLocationChanged.listen((newLoc) {
//   //     currentLocation = newLoc;
//   //     googleMapController.animateCamera(
//   //       CameraUpdate.newCameraPosition(
//   //         CameraPosition(
//   //           target: LatLng(
//   //             newLoc.latitude!,
//   //             newLoc.longitude!,
//   //           ),
//   //         ),
//   //       ),
//   //     );
//   //     setState(() {});
//   //   });
//   // }
//
//   void getPolyPoints() async {
//     PolylinePoints polylinePoints = PolylinePoints();
//     PolylineResult polylineResult =
//         await polylinePoints.getRouteBetweenCoordinates(
//       'AIzaSyBrbWFXlOYpaq51wteSyFS2UjdMPOWBlQw',
//       PointLatLng(
//         sourceLocation.latitude,
//         sourceLocation.longitude,
//       ),
//       PointLatLng(
//         destination.latitude,
//         destination.longitude,
//       ),
//     );
//     if (polylineResult.points.isNotEmpty) {
//       polylineResult.points.forEach((point) {
//         polyLineCoordinates.add(
//           LatLng(
//             point.latitude,
//             point.longitude,
//           ),
//         );
//       });
//       setState(() {});
//     }
//   }
//
//   ///11 jan..........
//
//   String googleApikey = "AIzaSyBrbWFXlOYpaq51wteSyFS2UjdMPOWBlQw";
//   GoogleMapController? mapController;
//   GoogleMapController? mapController2; //contrller for Google map
//   CameraPosition? cameraPosition;
//   LatLng startLocation = LatLng(28.583, 77.3132);
//   String location = "Search Pickup Address";
//   String location2 = "Search Destination Address";
//   //late GoogleMapController mapController;
//
//   Map<String, Marker> _markers = {};
//   Set<Marker> _markerss = Set<Marker>();
//   //Set<Marker> _polygonss = Set<Polygon>();
//   List<LatLng> polygonLatLng = <LatLng>[];
//
//   Set<Marker> markers = Set<Marker>();
//
//   int _polygonIdCounter = 1;
//
//   // static final CameraPosition _kpGooglePlex = cameraPosition(
//   //
//   // );
//
//   //Completer<GoogleMapController> _controller = Completer();
//   TextEditingController _searchController = TextEditingController();
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
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _marker.addAll(_list);
//     // _ksGooglemarkerfirst(LatLng(latitude, longitude))
//     //_setMarker(LatLng(latitude, longitude))
//   }
//
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       // appBar: AppBar(
//       //   elevation: 0,
//       //   title: Text("Place Search Autocomplete Google Map"),
//       //   backgroundColor: Colors.transparent,
//       // ),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Positioned(
//               top: size.height * 0.0,
//               bottom: size.height * 0.12,
//               child: Container(
//                 height: size.height,
//                 width: size.width,
//                 child: GoogleMap(
//                   //Map widget from google_maps_flutter package
//                   zoomGesturesEnabled: true,
//                   mapType: MapType.normal,
//                   markers: {
//                     _kGooglemarkerfirst,
//                     _kGooglemarkersecond,
//                   },
//                   polylines: {
//                     _kpolyline,
//                   },
//
//                   // polygons: {
//                   //   _kPolygon,
//                   // }, //enable Zoom in, out on map
//                   initialCameraPosition: CameraPosition(
//                     //innital position in map
//                     target: startLocation, //initial position
//                     zoom: 14.0, //initial zoom level
//                   ),
//                   //mapType: MapType.normal, //map type
//                   onMapCreated: (controller) {
//                     //method called when map is created
//                     setState(() {
//                       mapController = controller;
//                     });
//                   },
//                 ),
//               ),
//             ),
//
//             //search autoconplete input
//             Positioned(
//                 //search input bar
//                 top: 2,
//                 child: InkWell(
//                     onTap: () async {
//                       var place = await PlacesAutocomplete.show(
//                           context: context,
//                           apiKey: googleApikey,
//                           mode: Mode.overlay,
//                           types: [],
//                           strictbounds: false,
//                           components: [Component(Component.country, 'Ind')],
//                           //google_map_webservice package
//                           onError: (err) {
//                             print(err);
//                           });
//
//                       if (place != null) {
//                         location = place.description.toString();
//
//                         //form google_maps_webservice package
//                         final plist = GoogleMapsPlaces(
//                           apiKey: googleApikey,
//
//                           ///..............
//                           apiHeaders: await GoogleApiHeaders().getHeaders(),
//                           //from google_api_headers package
//                         );
//                         String placeid = place.placeId ?? "0";
//                         final detail = await plist.getDetailsByPlaceId(placeid);
//                         final geometry = detail.result.geometry!;
//                         final lat = geometry.location.lat;
//                         final lang = geometry.location.lng;
//                         var newlatlang = LatLng(lat, lang);
//                         var newpoint =
//
//                             ///Todo:abhi bhau.....10 jan 2023...................................................
//                             _kGooglemarkerfirst = _kGooglemarkerfirst.copyWith(
//                                 positionParam: newlatlang);
//                         // _kpolyline =
//                         //     _kpolyline.copyWith(pointsParam: polygonLatLng);
//
//                         setState(() {});
//
//                         //move map camera to selected place with animation
//                         mapController?.animateCamera(
//                             CameraUpdate.newCameraPosition(
//                                 CameraPosition(target: newlatlang, zoom: 14)));
//                       }
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.all(15),
//                       child: Card(
//                         child: Container(
//                             padding: EdgeInsets.all(0),
//                             width: MediaQuery.of(context).size.width - 40,
//                             child: ListTile(
//                               title: Text(
//                                 location,
//                                 style: TextStyle(fontSize: 14),
//                               ),
//                               leading: Icon(
//                                 Icons.pin_drop,
//                                 color: Colors.red,
//                                 size: 20,
//                               ),
//                               trailing: Icon(Icons.search),
//                               dense: true,
//                             )),
//                       ),
//                     ))),
//             //search autoconplete input
//             Positioned(
//                 //search input bar
//                 top: size.height * 0.08,
//                 child: InkWell(
//                     onTap: () async {
//                       var place = await PlacesAutocomplete.show(
//                           context: context,
//                           apiKey: googleApikey,
//                           mode: Mode.overlay,
//                           types: [],
//                           strictbounds: false,
//
//                           ///error:...............................................
//                           components: [Component(Component.country, 'Ind')],
//                           //google_map_webservice package
//                           onError: (err) {
//                             print(err);
//                           });
//
//                       if (place != null) {
//                         location2 = place.description.toString();
//
//                         //form google_maps_webservice package
//                         final plist = GoogleMapsPlaces(
//                           apiKey: googleApikey,
//
//                           ///........
//                           //apiHeaders: await GoogleApiHeaders().getHeaders(),
//                           //from google_api_headers package
//                         );
//                         String placeid = place.placeId ?? "0";
//                         final detail = await plist.getDetailsByPlaceId(placeid);
//                         final geometry = detail.result.geometry!;
//                         final lat = geometry.location.lat;
//                         final lang = geometry.location.lng;
//                         var newlatlang = LatLng(lat, lang);
//
//                         ///Todo:abhi bhau.....10 jan 2023...................................................
//                         _kGooglemarkersecond = _kGooglemarkersecond.copyWith(
//                             positionParam: newlatlang);
//                         // _kpolyline =
//                         //     _kpolyline.copyWith(pointsParam: polygonLatLng);
//
//                         setState(() {});
//
//                         //move map camera to selected place with animation
//                         mapController2?.animateCamera(
//                             CameraUpdate.newCameraPosition(
//                                 CameraPosition(target: newlatlang, zoom: 14)));
//                       }
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.all(15),
//                       child: Card(
//                         child: Container(
//                             padding: EdgeInsets.all(0),
//                             width: MediaQuery.of(context).size.width - 40,
//                             child: ListTile(
//                               title: Text(
//                                 location2,
//                                 style: TextStyle(fontSize: 14),
//                               ),
//                               leading: Icon(
//                                 Icons.pin_drop,
//                                 color: Colors.red,
//                                 size: 20,
//                               ),
//                               trailing: Icon(Icons.search),
//                               dense: true,
//                             )),
//                       ),
//                     ))),
//
//             Positioned(
//               bottom: size.height * 0.0,
//               //left: size.height * 0.05,
//               child: Container(
//                 height: size.height * 0.14,
//                 width: size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: size.height * 0.043,
//                       width: size.width,
//                       decoration: BoxDecoration(
//                         color: Colors.cyanAccent,
//                       ),
//                       child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: size.width * 0.01),
//                         child: Obx(
//                           () => DropdownButtonFormField(
//                               value: _mapControllers.selectedState.value,
//                               decoration: InputDecoration(
//                                 contentPadding:
//                                     EdgeInsets.only(bottom: size.height * 0.01),
//                                 // prefixIcon: Icon(
//                                 //   Icons.real_estate_agent,
//                                 //   color: Colors.black,
//                                 // ),
//                                 enabledBorder: InputBorder.none,
//                                 border: InputBorder.none,
//                               ),
//                               hint: Text(
//                                 'Ambulance Type',
//                                 style: TextStyle(
//                                   fontSize: size.height * 0.016,
//                                 ),
//                               ),
//                               items: items.map((String items) {
//                                 return DropdownMenuItem(
//                                   value: items,
//                                   child: Text(
//                                     items,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.height * 0.015,
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                               onChanged: (String? newValue) {
//                                 _mapControllers.selectedState.value = newValue!;
//                                 // _hospital_2_controller.states.value =
//                                 //     newValue! as List<String>;
//                                 // _hospital_2_controller.selectedCity.value = null;
//                                 // _hospital_2_controller.cities.clear();
//                                 // _hospital_2_controller.cities
//                                 //     .addAll(stateCityMap[newvalue]!);
//                               }),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.height * 0.004,
//                     ),
//                     Container(
//                       height: size.height * 0.043,
//                       width: size.width,
//                       decoration: BoxDecoration(
//                         color: Colors.cyanAccent,
//                       ),
//                       child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: size.width * 0.01),
//                         child: Obx(
//                           () => DropdownButtonFormField(
//                               //icon: Icon(Icons.location_city),
//                               value: _mapControllers.selectedCity.value,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.only(
//                                     bottom: size.height * 0.022),
//                                 // prefixIcon: Icon(
//                                 //   Icons.location_city,
//                                 //   color: Colors.black,
//                                 // ),
//                                 enabledBorder: InputBorder.none,
//                                 border: InputBorder.none,
//                               ),
//                               hint: Text(
//                                 'Vehicle Type',
//                                 style: TextStyle(
//                                   fontSize: size.height * 0.016,
//                                 ),
//                               ),
//                               items: items.map((String items) {
//                                 return DropdownMenuItem(
//                                   value: items,
//                                   child: Text(
//                                     items,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.height * 0.015,
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                               onChanged: (String? newValue) {
//                                 _mapControllers.selectedCity.value = newValue!;
//                                 // _hospital_2_controller.states.value =
//                                 //     newValue! as List<String>;
//                                 // _hospital_2_controller.selectedCity.value = null;
//                                 // _hospital_2_controller.cities.clear();
//                                 // _hospital_2_controller.cities
//                                 //     .addAll(stateCityMap[newvalue]!);
//                               }),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.height * 0.005,
//                     ),
//                     PhysicalModel(
//                       color: Colors.grey.shade300,
//                       elevation: 10,
//                       shadowColor: Colors.grey.shade900,
//                       borderRadius: BorderRadius.circular(10),
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Container(
//                           height: size.height * 0.03,
//                           width: size.width * 0.6,
//                           decoration: BoxDecoration(
//                             color: Colors.indigo,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: size.width * 0.01),
//                             child: Center(
//                                 child: Text(
//                               'Submit',
//                               style: TextStyle(
//                                 fontSize: size.height * 0.02,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             )),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
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
//     _markers[id] = marker;
//     setState(() {});
//   }
//
//   final List<Marker> _list = const [
//     Marker(
//         markerId: MarkerId('1'),
//         position: LatLng(20.42796133580664, 75.885749655962),
//         infoWindow: InfoWindow(
//           title: 'My Position',
//         )),
//     Marker(
//         markerId: MarkerId('2'),
//         position: LatLng(25.42796133580664, 80.885749655962),
//         infoWindow: InfoWindow(
//           title: 'Location 1',
//         )),
//   ];
//
//   static Marker _kGooglemarkerfirst = Marker(
//     markerId: MarkerId("_kpGoogle1"),
//     infoWindow: InfoWindow(title: 'Noida'),
//     icon: BitmapDescriptor.defaultMarker,
//     position: LatLng(28.583, 77.3132),
//   );
//
//   static Marker _kGooglemarkersecond = Marker(
//     markerId: MarkerId("_kpGoogle2"),
//     infoWindow: InfoWindow(title: 'Delhi'),
//     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//     position: LatLng(28.5930, 77.3052),
//   );
//
//   static Polyline _kpolyline = Polyline(
//     polylineId: PolylineId("_kpolyline"),
//     points: [
//       LatLng(28.583, 77.3132),
//       LatLng(28.5930, 77.3052),
//
//       // LatLng(28.573, 77.3132),
//       // LatLng(29.0788, 76.0856),
//     ],
//     width: 5,
//   );
//
//   static final Polygon _kPolygon = Polygon(
//     polygonId: PolygonId('_kPolygon'),
//     points: [
//       LatLng(28.583, 77.3132),
//       LatLng(28.5930, 77.3052),
//       LatLng(28.563, 77.2932),
//       LatLng(28.5731, 77.3292),
//     ],
//     strokeWidth: 5,
//     fillColor: Colors.transparent,
//   );
// }
// //<script src="https://maps.googleapis.com/maps/api/js?sensor=false&callback=myMap"></script>
